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
Press 5 to swap bookwith a exsisting user.
Press 6 to check Which book is assigned to which user.
press 7 to delete user.
Press 8 to edit user.
Press 9 to edit book.
press 10 to EXIT.
"""
print(Welcome)
index = 0
global Data
Data=[]
FUN=[]
values = ["1-100"]
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

def num_check(Num):
    check = True
    if  (any(char.isdigit() for char in Num)== False):
        check = False
        # print(check)
        print("Please Use Numbers only ")
    
    # if (Num.isalnum() == True):
    #     check = 1
    #     print("Please donot Use AplhaNumeric values ")
    
    if not Num:
            check = False
            print("Not input")
        
    if not (special_characters.search(Num) == None):
        check = False
        # print(check)
        print("Please dont use special characters")
    return check

def rem_space(fun):
    data = fun.split()
    # print("List",data)

    out_str = " "
    Variable=(out_str.join(data))
    # print("Checking",Variable)
    return Variable

def value_check(input):
    check = True
    
    if not input:
        check = False
        print("Not input")
    
    if not (special_characters.search(input) == None):
        check = False
        # print(check)
        print("Please dont use special characters")
        
    if not (any(char.isdigit() for char in input)== False):
        check = False
        # print(check)
        print("Please dont use Numbers ")
    return check
    
        
while not (input == "10") :
    print(Menu)
    Value = input("Please Enter a Value:")
    if Value == "1":
        Idno = input("Enter IDno: ")
                
        Idno=rem_space(Idno)

        check = num_check(Idno)
        # print(check)
        if check==True:
            Username =input("Enter Username: ")
            Username=rem_space(Username)

            check = value_check(Username)
            # print(check)
            
            
            if check==True:
                Bookname =input("Enter Bookname: ")  
                Bookname=rem_space(Bookname)

                check = value_check(Bookname)

                if check==True:
                    class Users:
                        def  __init__(self, Id,User, Book):
                            self.Id = Id
                            self.User = User
                            self.Book = Book
                    
                    

                    for x in Data:
                        if ((x.Id) == Idno):
                            print("IDno",Idno,"Already exsists")
                            check=False
                    if check==True:
                            #data = [{id:"id"},{name:name},{book:book}] 
                        Data.append (Users( Idno, Username, Bookname, ))

                        for x in Data:
                            if ((x.Id) == Idno):
                                # print(x.Id)
                                if ((x.User) == Username):
                                    # print(x.User)
                                    if ((x.Book) == Bookname): 
                                        # print(x.Book)
                                        print("Book" ,(x.Book),"has been assigned to the user",(x.User), "User Id no is:", (x.Id) )
                                        
        
    elif Value == "2":
        Id =input("Enter the User ID to check which book is assigned to user: ")
        User =input("Enter the Username to check which book is assigned to user: ")
        
        Id=rem_space(Id)

        check = num_check(Id)
        # print(check)
        if check==True:
        
            User =rem_space(User)
            # print(check)
            
            check = value_check(User)
            # print(check)
            
            if check==True:
                USERNAME = User.lower()
                for x in Data:
                    if ((x.Id) == Id):
                        check=False
                if check == True :
                    print("IDno",Id,"doesnt exsists")           
                if check == False :    
                    check=True
                    for x in Data:
                        USER = (x.User).lower()
                        if ((x.Id) == Id):
                            if (USER == USERNAME):
                                if (x.Book) == None :
                                    print(User,"has no book") 
                                    check=False
                                else:
                                    print("User",(x.User),"has book", (x.Book),)
                                    check=False
                             
                    
                    if check == True :
                        print("User",User,"doesnt exsists")    
                    
                    
                    
    elif Value == "3":
        # for value in values:
            check=True
            for x in Data:
                print("• Assigned books are",(x.Book),)# value)
                check=False
            if check==True :
                print("• No Books are Assigned yet")
        
                
    
    elif Value == "4":
        
        user_id =input("Enter the  IDno of Proviuous user: ")    

        user_id=rem_space(user_id)

        check = num_check(user_id)
        if check==True:
            Checkk=True
            for x in Data:
                if ((x.Id) == user_id):
                    Checkk=False
            if Checkk == True :
                print("IDno",user_id,"doesnt exsists")  
        
            if  Checkk==False:
                if check==True:
                    ID =input("Enter the new IDno: ")
                    ID=rem_space(ID)

                    check = num_check(ID)
                    if check==True:
                        for x in Data:
                            # print(x)
                            if ((x.Id) == ID):
                                print("IDno",ID,"Already exsists")
                                check=False
                        
                        if check==True:
                            USER =input("Enter the new user name: ")
                            USER =rem_space(USER)
                            # print(check)
                            
                            check = value_check(USER)
                            # print(check)
                        

                        if check==True:
                            # print("checkk")
                            User = USER.lower()
                            # Book = BOOK.lower()
                            check=True
                                    
                        if check==True:
                            for z in Data:
                                index = Data.index(x)
                                # print(index)
                                X = (z.Id)
                                # print(X)
                                # print(EXID)
                                if (X == user_id):
                                    Newbook=(z.Book)
                                    if (Newbook == ''):
                                        print("User has no book")
                                        check=False
                                    if check==True:
                                        Data.append(Users( ID, USER, Newbook, ))
                                        (z.Book)=''
                                        # print("CHECKKK")
                                                                      

    elif Value == "5":
        
        user_id =input("Enter the  IDno of Proviuous user: ")    

        user_id=rem_space(user_id)

        check = num_check(user_id)
        if check==True:
            Checkk=True
            for x in Data:
                if ((x.Id) == user_id):
                    Checkk=False
            if Checkk == True :
                print("IDno",user_id,"doesnt exsists")  
            if Checkk == False :
                NEWID =input("Enter the  IDno of exsistinguser: ")    

                NEWID=rem_space(NEWID)

                check = num_check(NEWID)
                if check==True:
                    Checkk=True
                    for x in Data:
                        if ((x.Id) == NEWID):
                            Checkk=False
                    if Checkk == True :
                        print("IDno",NEWID,"doesnt exsists")  
                        check=False

                    if check == True :
                        if(user_id==NEWID):
                            print("Same IDno entered")
                            check=False
                    
                    
                    
                        if check==True:
                                for z in Data:
                                    index = Data.index(x)
                                    # print(index)
                                    X = (z.Id)
                                    # print(X)
                                    # print(EXID)
                                    if (X == user_id):
                                        Newbook=(z.Book)   
                                        for v in Data:
                                            index = Data.index(x)
                                            # print(index)
                                            X = (v.Id)
                                            Y = (v.Book)
                                            # print(X)
                                            # print(EXID)
                                            if (X == NEWID):
                                                # print("check")
                                                # print(Newbook)
                                                if (Newbook == ''):
                                                    print("User has no book")
                                                    check=False
                                                    break
                                                else:         
                                                    # print("checkkk")
                                                    (v.Book)=Newbook
                                                    print(Newbook)
                                                    print(v.Book)
                                            (z.Book)= ''
                                    
                                        
                    
    elif Value == "6":
        check=True
        for x in Data:
            print("• User",(x.User),"with IDno",(x.Id),"has Book",(x.Book),)# value)
            check=False
        if check==True :
            print("• No Books are Assigned yet")
    
    elif Value == "7":
        IDDelete =input("Enter IDno of User you want to Delete: ")
        
        IDDelete =rem_space(IDDelete)

        check = num_check(IDDelete)
        # print(check)
        
        if check==True:
            Checkk=True
            for x in Data:
                if ((x.Id) == IDDelete):
                    Checkk=False
            if Checkk == True :
                print("IDno",IDDelete,"doesnt exsists") 
            
            if Checkk == False :    
                for x in Data:
                    index = Data.index(x)
                    X = (x.Id).lower()
                    if (X == IDDelete):
                        count=False
                        del Data[index]
                        print("User with IDno",IDDelete,"is deleted")
                        count=True
                        if count==False: 
                            print("IDno",IDDelete,"doesnot exsist")    
                
    elif Value == "8":
        user_id =input("Enter the  IDno of  user you want to edit: ")    

        user_id=rem_space(user_id)

        check = num_check(user_id)
        if check==True:
            Checkk=True
            for x in Data:
                if ((x.Id) == user_id):
                    Checkk=False
            if Checkk == True :
                print("IDno",user_id,"doesnt exsists") 
            
            if Checkk==False:
                if check==True:
                    Newuser =input("Enter New user name: ")
                    Newuser =rem_space(Newuser)
                                # print(check)
                                
                    check = value_check(Newuser)
        
                        
                    if check==True:
                        for z in Data:
                            index = Data.index(x)
                            X = (z.Id)
                            if ( X == user_id):                                
                                (z.User)=Newuser
                                                           

                        
                
    elif Value == "9":
        user_id =input("Enter the  IDno of  user you want to edit: ")    

        user_id=rem_space(user_id)

        check = num_check(user_id)
        
        if check==True:
            Checkk=True
            for x in Data:
                if ((x.Id) == user_id):
                    Checkk=False
            if Checkk == True :
                print("IDno",user_id,"doesnt exsists") 
        
            if Checkk==False:    
                if check==True:
                    Newbook =input("Enter New book name: ")
                    Newbook =rem_space(Newbook)
                            # print(check)
                            
                    check = value_check(Newbook)
                            # print(check)
                            
                    if check==True:
                        for z in Data:
                            index = Data.index(x)
                                    # print(z)
                            X = (z.Id).lower()
                            if ((z.Id) == user_id):
                                (z.Book)=Newbook
                
            
    elif Value == "10":
        print(exit)

        quit()

    else:
        print(Invalid)