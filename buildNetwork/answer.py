#!/usr/bin
import os
import sys
import pickle
reload ( sys )
sys.setdefaultencoding ( 'utf-8' )
if __name__ == "__main__":
    if len ( sys.argv ) < 2:
        print ( "no project path" )

    projectPath = sys.argv [ 1 ]
    dataPath = os.path.join ( projectPath , "data" )
    ans_filename = os.path.join ( dataPath , "ans.txt" )
    id_filename = os.path.join ( dataPath , "id_name"  )

    id_file = open ( id_filename )
    ans_file = open ( ans_filename )
    id_map = pickle.load ( id_file )
    id_file.close ()
    ans ={}
    for line in ans_file:
        parts = line.split(" ")
        userId = int ( parts [ 0 ] )
        label = int ( parts [ 1 ] )
        if not ( label in ans ):
            ans [ label ] = []
        ans[ label ].append ( userId )

    for label in ans:
        print ( label )
        for userId in ans [ label ]:
            print ( id_map [ userId ] )
        print ( "\n" )

