#!/usr/bin
import os
import sys
import pickle
reload ( sys )
sys.setdefaultencoding ( 'utf-8' )
def makeMatrix ( build_matrix , matrix_filename ):
    count = 0
    f = open ( matrix_filename , "w" )

    for master in build_matrix:
        if count < master:
            count = master
    for master1 in range ( 1 , count + 1 ):
        for master2 in range ( 1 , count + 1 ):
            if master2 in build_matrix [ master1 ]:
                f.write ( str ( build_matrix [ master1 ][ master2 ] ))
            else:
                f.write (  "0" )
            if ( master2 == count ):
                f.write ( "\n" )
            else:
                f.write ( " " )
    f.close ( );

if __name__ == "__main__":
    if len ( sys.argv ) < 2:
        print ( "Input the project path" )
        exit
    projectPath = sys.argv [ 1 ]
    dataPath = os.path.join ( projectPath , "data" )
    build_matrix_filename = os.path.join ( dataPath , "build_matrix" )
    build_matrix_file = open ( build_matrix_filename , "r" )
    build_matrix = pickle.load ( build_matrix_file )
    build_matrix_file.close ( ) ;
    matrix_filename = os.path.join ( dataPath , "matrix.txt" )
    makeMatrix ( build_matrix , matrix_filename )

