-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/zvRyap
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Departments" (
    "Dept_No" varchar(10)   NOT NULL,
    "Dept_Name" varchar(255)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Dept_No"
     )
);

CREATE TABLE "Dept_Emp" (
    "Emp_No" int   NOT NULL,
    "Dept_No" varchar(255)   NOT NULL,
    "From_Date" date   NOT NULL,
    "To_Date" date   NOT NULL,
    CONSTRAINT "pk_Dept_Emp" PRIMARY KEY (
        "Emp_No"
     )
);

CREATE TABLE "Dept_Manager" (
    "Emp_No" int   NOT NULL,
    "Dept_No" varchar(255)   NOT NULL,
    "From_Date" date   NOT NULL,
    "To_Date" date   NOT NULL,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        "Emp_No"
     )
);

CREATE TABLE "Employees" (
    "Emp_No" int   NOT NULL,
    "Birth_Date" date   NOT NULL,
    "First_Name" varchar(255)   NOT NULL,
    "Last_Name" varchar(255)   NOT NULL,
    "Gender" varchar(1)   NOT NULL,
    "Hire_Date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Emp_No"
     )
);

CREATE TABLE "Salaries" (
    "Emp_No" int   NOT NULL,
    "Salary" int   NOT NULL,
    "From_Date" date   NOT NULL,
    "To_Date" date   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "Emp_No"
     )
);

CREATE TABLE "Titles" (
    "Emp_No" int   NOT NULL,
    "Title" varchar(255)   NOT NULL,
    "From_Date" date   NOT NULL,
    "To_Date" date   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "Emp_No"
     )
);

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "Departments" ("Dept_No");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Emp_No_From_Date_To_Date" FOREIGN KEY("Emp_No", "From_Date", "To_Date")
REFERENCES "Dept_Emp" ("Emp_No", "From_Date", "To_Date");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "Departments" ("Dept_No");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Dept_Emp" ("Emp_No");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Emp_No_From_Date_To_Date" FOREIGN KEY("Emp_No", "From_Date", "To_Date")
REFERENCES "Dept_Emp" ("Emp_No", "From_Date", "To_Date");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_Emp_No_From_Date_To_Date" FOREIGN KEY("Emp_No", "From_Date", "To_Date")
REFERENCES "Dept_Emp" ("Emp_No", "From_Date", "To_Date");

