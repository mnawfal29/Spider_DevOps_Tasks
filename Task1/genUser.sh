#!/bin/bash

# The directory structure is as follows:
# school
# school contains directories schoolnotices (from the principal) and classes
# Each class contains directories for students and teachers (which are empty)
# Each class also contains marks (contains marks of all students in class), attendance (for 7 days) and notices (from principal and teacher)

mkdir /home/school
useradd -m -d /home/school/PRINCIPAL PRINCIPAL
cd /home/school
mkdir ./schoolnotices

for i in {1..5}
do
class="CLASS_""$i"
mkdir ./$class
cd $class
mkdir ./marks
mkdir ./attendance

# Attendance for 7 days
for k in {1..7}
do
touch ./attendance/Day"$k".txt
done

mkdir ./notices
touch ./notices/principalnotice.txt
touch ./notices/teachernotice.txt

# Create teacher
teacher="TEACHER_""$i"
useradd -m -d /home/school/$class/$teacher $teacher

# Create students
for j in {1..5}
do
student="STUD_""$i""_""$j" # STUD_i_j i=Class name j=Student Roll
useradd -m -d /home/school/$class/$student $student
touch ./marks/$student.txt
done

cd .. # To cd back to school directory
done
