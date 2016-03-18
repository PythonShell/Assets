#!/usr/bin/env python2
import json
from subprocess import Popen, PIPE
import os

def main(repo_file='repos.json'):
    '''
    Update Repos listed in file
    '''
    # show already remotes in the repo
    git_remote_show_command = ['/usr/bin/git', 'remote', 'show']
    git_pull_command = ['/usr/bin/git', 'pull', 'github', 'master']
    git_push_command = ['/usr/bin/git', 'push', 'gitosc', 'master']
    repos = json.loads(open(repo_file).read())
    print u'Total Repos:' + u' '.join(repos)
    success_repo = []
    failed_repo = []
    for repo in repos:
        if type(repo) == type(u''):
            repository = os.path.abspath('./' + repo)
            git_remote_list = Popen(git_remote_show_command, cwd=repository,
                                    stdout=PIPE, stderr=PIPE)
            git_query = Popen(git_pull_command, cwd=repository, stdout=PIPE,
                              stderr=PIPE)
            git_query = Popen(git_push_command, cwd=repository, stdout=PIPE,
                              stderr=PIPE)
            (git_status, error) = git_query.communicate()
            if git_query.poll() == 0:
                success_repo.append(repo)
            else:
                failed_repo.append(repo)
    if len(failed_repo)==0:
        print 'All Repos Update success'
    else:
        print 'Failed Repo(s): ' + u' '.join(failed_repo)


if __name__ == '__main__':
    main()
