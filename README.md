# patilgopal0008-Library-Database-Analysis-using-sql
# MySQL Library Database Analysis Project  
Project Overview
This project involves the analysis of a library database using MySQL. The database includes tables for authors, books, book copies, book loans, borrowers, library branches, and publishers. The analysis focuses on extracting valuable insights from the data and understanding the relationships between different entities in the library system.

Tables  
1. Authors    
Contains information about the authors of the books in the library.  
column's -  
   AuthorID :  
    Represents the unique identifier assigned to each author.  

  BookID :  
   Represents the book ID associated with the author.  
   It links to the Books table where information about the book is stored.  

  AuthorName (varchar(100)):  
   Stores the name of the author.  

3. Books    
Provides details about the books available in the library, including titles, genres, and publication information.          
column's -   
  BookID :  
   Represents the unique identifier assigned to each book.  

  book_title :  
   Stores the title of the book.  

  PublisherName :  
   Contains the name of the publisher.  

4. Book Copies    
Represents the individual copies of books available in the library, specifying their availability status.  
column's-  
  copies_id :  
   Represents the unique identifier assigned to each book copy.  
 
  bookid :  
   Represents the book ID associated with the copy.  
   It links to the Books table where information about the book is stored.  

  branch_id :  
   Represents the branch ID associated with the copy.  
   It links to the Library_Branch table where information about the library branch is stored.  

  no_of_copies :  
   Represents the number of copies available for the associated book at the specified branch.  

6. Book Loans    
Tracks the loans made by library patrons, including due dates and return status.  
column's -  
  loan_id :   
    Represents the unique identifier assigned to each book loan.  

  BookID :  
   Represents the book ID associated with the loan.  
   It links to the Books table where information about the book is stored.  

  branch_id :  
   Represents the branch ID associated with the loan.  
   It links to the Library_Branch table where information about the library branch is stored.  

  cardno :  
   Represents the borrower card number associated with the loan.  
   It links to the Borrowers table where information about the borrower is stored.  

  loans_DateOut :  
   Stores the date when the book is loaned out.  

  loans_DueDate :  
   Stores the due date for returning the borrowed book.  

7. Borrowers    
Contains information about the library patrons who borrow books.\  
column's -  
  CardNo :  
   Represents the unique card number assigned to each borrower.  

  BorrowerName :  
   Stores the name of the borrower.  

  BorrowerAddress :  
   Contains the address of the borrower.  

  BorrowerPhone :  
   Stores the phone number of the borrower.  

7. Library Branch    
Describes the different branches of the library, including their locations and contact information.   
column's -  
  branch_id :  
   Represents the unique identifier assigned to each library branch.  

  branch_name :  
   Stores the name of the library branch.  

  branch_address :  
   Contains the address of the library branch.  

9. Publishers    
Includes details about the publishers of the books in the library.  
column's -  
  PublisherName :  
   Represents the name of the publisher.  

  PublisherAddress :  
   Stores the address of the publisher.  

  PublisherPhone :  
   Contains the phone number of the publisher.  
 
