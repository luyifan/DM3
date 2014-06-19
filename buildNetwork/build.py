#!usr/bin
import os
import sys
import pickle
reload ( sys )
sys.setdefaultencoding('utf-8')
def doWithMatrix ( adjacency_filename , id_filename , build_filename ,new_id_filename , K ):
    adjacency_file = open ( adjacency_filename )
    id_file = open ( id_filename )
    build_file = open ( build_filename , "w" )
    adjacency_matrix = {}
    no_useful_id = [];
    for line in adjacency_file:
        num = line.split ( " " )
        length = len ( num )
        master = int ( num [ 0 ] )
        if ( length < K ):
            no_useful_id.append ( master )
        if not ( master in adjacency_matrix ):
            adjacency_matrix [ master ] = [];
        for i in range ( 1 , length ):
            slaver = int ( num [ i ] )
            adjacency_matrix [ master ].append ( slaver )
    for userId in no_useful_id:
        for master in adjacency_matrix:
            if userId in adjacency_matrix [ master ]:
                adjacency_matrix [ master ].remove ( userId )




    build_matrix = {}
    id_map = {}
    count = 0
    for master1 in adjacency_matrix:
        print ( "." )
        for master2 in adjacency_matrix:
            if not ( master1 in id_map ):
                count += 1
                id_map [ master1 ] = count
            if not ( master2 in id_map ):
                count += 1
                id_map [ master2 ] = count
            m1 = id_map [ master1 ]
            m2 = id_map [ master2 ]
            between = 0
            for slaver1 in adjacency_matrix [ master1 ]:
                if slaver1 in adjacency_matrix [ master2 ]:
                    between += 1
            if not ( m1 in build_matrix ):
                build_matrix [ m1 ] = {}
            if not ( m2 in build_matrix [ m1 ]):
                build_matrix [ m1 ][ m2 ] = between
            else:
                build_matrix [ m1 ][ m2 ] += between

    pickle_file = open ( build_filename , "w" )
    pickle.dump ( build_matrix , build_file )
    pickle_file.close( )
    id_name = {}
    for id_line in id_file:
        name = id_line.split(" ")
        userId = int ( name [ 0 ] )
        userName = name [ 1 ]
        if ( userId in id_map ):
            idInMatrix = id_map [ userId ]
            id_name [ idInMatrix ] = userName
        else:
            print ( userId )
    print ( id_name )
    pickle_file = open ( new_id_filename , "w" )
    pickle.dump ( id_name , pickle_file )
    pickle_file.close( )

if __name__=="__main__":
    if len ( sys.argv )< 3:
        print ( "No project path" )
        exit

    projectPath = sys.argv [ 1 ]
    K = int ( sys.argv [ 2 ] )
    dataPath = os.path.join ( projectPath , "data" )
    adjacency_filename = os.path.join ( dataPath , "adjacency_list_filename")
    id_filename = os.path.join ( dataPath , "id_name_map_filename" )
    new_id_filename = os.path.join ( dataPath , "id_name" )
    build_filename = os.path.join ( dataPath , "build_matrix" )
    doWithMatrix ( adjacency_filename ,id_filename , build_filename , new_id_filename , K )
