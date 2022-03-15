#import decorators: keyword, library
'''
When ROBOT_AUTO_KEYWORDS = False then we can explicitly use @keyword-decorator
to tell which class method become a keyword

'''
from robot.api.deco import keyword
from robot.api.deco import library
import json

#Turn a class into a library with library @library-decorator
#The purpose of creating keyword in class is to reused keywords in different test suites
@library(scope="GLOBAL", version="1.0")
#By setting argument scope is GLOBAL we can be sure that this JSONLibrary can be used in every test case
class JSONlibrary():
    #this JSONLibrary contains keywords to work with JSON files

    @keyword(tags=["json"], types={"json_file": str})
    def parse_json_file(self, json_file):
        '''
        The json.load()-method decodes the JSON content
        into a Python dictionary
        What is return from this method is a dictionary
        Ex: &{parsed_json}      Parse JSON  File    exam_results.json
        '''
        with open(json_file, "r") as json_content:
            return json.load(json_content)