create database library;

use library;

create table publisher (
PublisherName varchar(50) primary key,
PublisherAddress varchar(100),
PublisherPhone varchar(20));

create table borrower (
CardNo tinyint primary key auto_increment,
BorrowerName varchar(100),
BorrowerAddress varchar(200),
BorrowerPhone varchar(20));

create table library_branch (
branch_id tinyint primary key auto_increment,
branch_name varchar(20) ,
branch_address varchar(100));

create table books (
BookID tinyint primary key auto_increment,
book_title varchar(200),
PublisherName varchar(50) ,
foreign key (publishername) references publisher(publishername) on update cascade on delete cascade );

create table authors (
authorid tinyint primary key auto_increment,
BookID tinyint,
AuthorName varchar(100), 
foreign key (bookid) references books(bookid) on update cascade on delete cascade ) ;

create table book_loan (
loan_id tinyint primary key auto_increment,
BookID tinyint,
branch_id tinyint,
cardno tinyint,
loans_DateOut varchar(20),
loans_DueDate varchar(20),
foreign key (bookid) references books(bookid) on update cascade on delete cascade,
foreign key (branch_id) references library_branch(branch_id) on update cascade on delete cascade,
foreign key (CardNo) references borrower(CardNo)  on update CASCADE on delete cascade);
 
 set sql_safe_updates = 0;
select * from book_loan;
ALTER TABLE book_loan
MODIFY COLUMN loans_DateOut DATE;

ALTER TABLE book_loan
MODIFY COLUMN loans_DueDate DATE;

describe book_loan;

create table book_copies (
copies_id tinyint primary key auto_increment ,
bookid tinyint ,
branch_id tinyint ,
no_of_copies int,
foreign key (bookid) references books(bookid) on update cascade on delete cascade,
foreign key (branch_id) references library_branch(branch_id) on update cascade on delete cascade);


/*1.How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?*/

select c.no_of_copies from books b
left join book_copies c
on b.bookid = c.bookid
left join library_branch L
on c.branch_id = L.branch_id
where b.book_title = "The Lost Tribe"
and l.branch_name = "Sharpstown"; 

/*2.How many copies of the book titled "The Lost Tribe" are owned by each library branch?*/

select branch_name,c.no_of_copies from books b
left join book_copies c
on b.bookid = c.bookid
left join library_branch L
on c.branch_id = L.branch_id
where b.book_title = "The Lost Tribe";

/*3.Retrieve the names of all borrowers who do not have any books checked out.*/

select borrowername from borrower b
left join book_loan l
on b.cardno = l.cardno
where loans_dateout is null;


/*4.For each book that is loaned out from the "Sharpstown" branch and whose DueDate is 2/3/18, retrieve the book title, the borrower's name, and the borrower's address*/

select b.book_title,br.BorrowerName,br.BorrowerAddress from books b
left join book_loan bl
on b.bookid = bl.bookid
left join borrower br
on bl.cardno = br.cardno
left join library_branch lb
on bl.branch_id = lb.branch_id
where lb.branch_name = "sharpstown"
and bl.loans_DueDate =  '2018-02-03';


/*5.For each library branch, retrieve the branch name and the total number of books loaned out from that branch.*/

select lb.branch_name,count(bl.bookid) from library_branch lb
left join book_loan bl
on lb.branch_id = bl.branch_id
group by branch_name;


/*6.Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.*/

select BorrowerName,BorrowerAddress,count(bookid) as count from borrower b
left join book_loan l
on b.cardno = l.cardno
group by BorrowerName,BorrowerAddress
having count(bookid) > 5;





/*7.For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".*/

select book_title,no_of_copies from books b
left join authors a
on b.bookid = a.bookid
left join book_copies bc
on b.bookid = bc.bookid
left join library_branch lb
on bc.branch_id = lb.branch_id
where AuthorName = 'Stephen King'
and branch_name = 'central'
;

