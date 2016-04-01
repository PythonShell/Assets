#!/usr/bin/env python2

import argparse
import json
from subprocess import Popen, PIPE
import os

DEBUG = True

class GitRepoManager:
    '''
    '''
    def __init__(self):
        '''
        '''
        self.version  = 'alpha-1'
        self.author   = 'PythonShell'
        self.email    = 'pythonshell@yeah.net'
        self.jsonfile = 'repos.json'
        self.repos    = []
        self.readIn()

    def writeOut(self):
        '''
        '''
        output_str = json.dumps(self.repos)
        fp = open( self.jsonfile, 'w')
        fp.write(output_str)
        fp.close()
        if DEBUG:
            print(output_str)

    def readIn(self):
        fp = open( self.jsonfile, 'r')
        input_str = fp.read()
        self.repos = json.loads(input_str)
        fp.close()

    def writeToJson(self, jsonfile):
        '''
        '''
        raise Exception
        self.switchFile(jsonfile)
        self.writeOut()

    def readFromJson(self, jsonfile):
        '''
        Read repos list from json file
        '''
        raise Exception
        self.repos = json.loads(self.jsonFp.read())

    def add(self, repo):
        '''
        '''
        print("Adding %s." % repo)
        if repo in self.repos:
            print("repo %s already exists." % repo)
        else:
            self.repos.append(repo)

    def delete(self, repo):
        '''
        '''
        print("Deleting %s." % repo)
        if repo in self.repos:
            self.repos.remove(repo)
            print("Delete success.")
        else:
            print("Cannot find %s repo." % repo)

    def update(self):
        '''
        '''
        git_remote_show_command = ['/usr/bin/git', 'remote', 'show']
        git_pull_command = ['/usr/bin/git', 'pull', 'github', 'master']
        git_push_command = ['/usr/bin/git', 'push', 'gitosc', 'master']
        repos = self.repos
        print(u'Updating Repos:' + u' '.join(repos))
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
            print('All Repos Update success')
        else:
            print('Failed Repo(s): ' + u' '.join(failed_repo))

    def show(self):
        '''
        '''
        print("Avaliable repos: %s" % (', '.join(self.repos)) )

    def printVersion(self):
        '''
        Output version information.
        '''
        print('Software name:       Repo-Manager')
        print('Software version:    %s' % self.version)
        print('Author:              %s' % self.author)
        print('Email:               %s' % self.email)

def main():
    parser = argparse.ArgumentParser(description='Tool for manager some git\
                                     repos.')
    parser.add_argument('-l', '--show', help='Output already existed repos',
                        action="store_true")
    parser.add_argument('-u', '--update', help='Update already existed repos',
                        action="store_true")
    parser.add_argument('-v', '--version', help='Output version information',
                        action="store_true")
    '''not avaiable currently'''
    # parser.add_argument('-f', '--repo-file', help='Identify repo file',
    #                     default='repos.json')
    parser.add_argument('-a', '--add', help='Add new git repo', metavar='REPO')
    parser.add_argument('-d', '--delete', help='Delete one exist git repo',
                        metavar='REPO')
    '''not avaiable currently'''
    # parser.add_argument('-r', '--rename', help='Rename old repo to new repo',
    #                     nargs=2, metavar=('OLD_REPO', 'NEW_REPO'))

    #   SAMPLE CODES
    # parser.add_argument('integers', metavar='N', type=int, nargs='+',
    #                     help='an integer for the accumulator')
    # parser.add_argument('--sum', dest='accumulate', action='store_const',
    #                     const=sum, default=max,
    #                     help='sum the integers (default: find the max)')

    manager = GitRepoManager()
    args = parser.parse_args()
    if args.delete:
        manager.delete(args.delete)
        manager.writeOut()
    if args.add:
        manager.add(args.add)
        manager.writeOut()
    # if args.rename:
    #     rename(args.rename)
    if args.version:
        manager.printVersion()
    if args.show:
        manager.show()
    if args.update:
        manager.update()


if __name__ == '__main__':
    main()

