from types import SimpleNamespace
from typing_extensions import Protocol
import re

Welcome = """
**************************
  WELCOME TO THE LIBRARY
**************************
"""
Menu = """
Press 1 to add user and Assign book to user..
press 2 to check if user has any book assigned. 
Press 3 to print list of assigned books. 
Press 4 to Ressign book to a new user.
Press 5 to Ressignbook to a exsisting user.
Press 6 to check Which book is assigned to which user.
press 7 to delete user.
Press 8 to edit user.
Press 9 to edit book.
press 10 to EXIT.
"""
print(Welcome)

Userlist=[]
Booklist=[]
FUN=[]
Invalid= """
===================================    
        Invalid value
===================================
"""

exit= """
===================================    
        Exiting Program
===================================
"""

special_characters = re.compile('[@_!#$%^&*()<>?/\|}{~:]')




def rem_space(fun):
    data = fun.split()
    # print("List",data)

    out_str = " "
    Variable=(out_str.join(data))
    # print("Checking",Variable)
    return Variable

def my_function(input):
    check = 0
    
    if not input:
        check = 1
        print("Not input")
    
    if not (special_characters.search(input) == None):
        check = 1
        # print(check)
        print("Please dont use special characters")
        
    if not (any(char.isdigit() for char in input)== False):
        check = 1
        # print(check)
        print("Please dont use Numbers ")
    return check
    
        
while not (input == "10") :
    print(Menu)
    Value = input("Please Enter a Value:")
    if Value == "1":
        Username =input("Enter Username: ")
        
        Username=rem_space(Username)
        print(Username)
        
        check = my_function(Username)
        # print(check)

        

        if check==0:
            # print(check)
            print("New user" , Username, "is added")
            # print(Userlist)
            Bookname =input("Enter Bookname you have to Assign to the User: ")
            Bookname=rem_space(Bookname)
            # print(Username)
            check = my_function(Bookname)
            # print(check)
        if check==0:          
            print("New Book" , Bookname, "is added")
            Userlist.append(Username)
            Booklist.append(Bookname)
            print("Book" ,Bookname,"has been assigned to the user",Username,)
            
    elif Value == "2":
        User =input("Enter the Username to check which book is assigned to user: ")
        
        
        User =rem_space(User)
        # print(check)
        
        check = my_function(User)
        # print(check)
        
        if check==0:
            USERNAME = User.lower()
            for x in Userlist:
                X = x.lower()
                if X == USERNAME:    
                    index = Userlist.index(x)
                    
                    print("User",x,"has book", Booklist[index],)
                    check=1

            if check == 0 :
                print(User,"doesnt exsists")
        
    elif Value == "3":
        print("Assigned books are",Booklist,)
    
    elif Value == "4":
        USER =input("Enter the new user name: ")

        BOOK =input("Enter the book you want to ressiagn: ")
        
        USER =rem_space(USER)
        # print(check)
        
        check = my_function(USER)
        # print(check)
        
        if check==0:
            BOOK =rem_space(BOOK)
        # print(check)
        
            check = my_function(BOOK)
        # print(check)
            if check==0:
                User = USER.lower()
                Book = BOOK.lower()
                check=0
                
                for x in Userlist:
                    X = x.lower()
                    if X == User:
                        print("User",x, "Already exsists")
                        check=1
                        break

                    List=print(x)
                    if List != USER:
                        print(List)
                        for x in Booklist:
                            X = x.lower()                
                            if X == Book:
                                index = Booklist.index(x)

                                Userlist[index]=USER

                                print("User",USER,"has book", Booklist[index],)
                                check=1
                    break

    elif Value == "5":
        EXUSER =input("Enter the existing username: ")
        EXUSER =rem_space(EXUSER)
        # print(check)
        
        check = my_function(EXUSER)
        # print(check)
        
        if check==0:

            EXBOOK =input("Enter the book you want to ressiagn: ")
            
            EXBOOK =rem_space(EXBOOK)
            # print(check)
            
            check = my_function(EXBOOK)
            # print(check)
            
            if check==0:
                Exuser = EXUSER.lower()
                Exisbook = EXBOOK.lower()
                for x in Booklist:
                    X = x.lower()
                    if X == Exisbook:
                        index = Booklist.index(x)

                        Booklist[index]=0
                
                for x in Userlist:
                    X = x.lower()
                    if X == Exuser:
                        index = Userlist.index(x)

                        Booklist[index]=EXBOOK

                        print(EXBOOK, "has been ressigned to" ,Userlist[index],)
    
    elif Value == "6":
        print("User are"  ,Userlist, )
        print("Books are" ,Booklist, )
    
    elif Value == "7":
        Delete =input("Enter User you want to Delete: ")
        
        Delete =rem_space(Delete)
        # print(check)
        
        check = my_function(Delete)
        # print(check)
        
        if check==0:
            DELETE = Delete.lower()
        
            #Deleting book
            for x in Userlist:
                X = x.lower()
                if X == DELETE:
                    index = Userlist.index(x)
                    del  Booklist[index]

            #Deleting user
            for x in Userlist:
                X = x.lower()
                if X == DELETE:
                    index = Userlist.index(x)

                    # if Userlist[index] == DELETE:
                    del  Userlist[index]
                
    elif Value == "8":
        Olduser =input("Enter old user name: ")
        Olduser =rem_space(Olduser)
        # print(check)
        
        check = my_function(Olduser)
        # print(check)
        
        if check==0:
            Newuser =input("Enter New user name: ")
            Newuser =rem_space(Newuser)
        # print(check)
        
            check = my_function(Newuser)
        # print(check)
        
            if check==0:
                OLDUSER = Olduser.lower()
                for x in Userlist:
                    X = x.lower()
                    if X == OLDUSER:
                        index = Userlist.index(x)

                        # if Userlist[index] == Olduser:
                        Userlist[index]=Newuser

                        print(Userlist)
                        check=1

                    if X != OLDUSER:
                        print(Olduser,"doesnt exsists")
        
    elif Value == "9":
        Oldbook =input("Enter old book name: ")
        Oldbook =rem_space(Oldbook)
        # print(check)
        
        check = my_function(Oldbook)
        # print(check)
        
        if check==0:
            Newbook =input("Enter New book name: ")
            Newbook =rem_space(Newbook)
            # print(check)
            
            check = my_function(Newbook)
            # print(check)
            
            if check==0:
                OLDBOOK = Oldbook.lower()                    
                for x in Booklist:
                    X = x.lower()
                    if X == OLDBOOK:
                        index = Booklist.index(x)

                        Booklist[index] = Newbook

                        print(Booklist)
                        check=1

                if X != OLDBOOK:
                    print(Oldbook,"doesnt exsists")
            
    elif Value == "10":
        print(exit)

        quit()

    else:
        print(Invalid)