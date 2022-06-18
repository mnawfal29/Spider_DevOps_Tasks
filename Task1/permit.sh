#!/bin/bash
cd /home/school

chown -R . PRINCIPAL # This makes the PRINCIPAL owner of all files and hence all necessary permissions follow 

for i in {1..5}
do

class="CLASS_""$i"
cd $class

for j in {1..5} 
do
# Change permissions for Student (all read-only permissions)
student="STUD_""$i""_""$j"
setfacl -m u:$student:r marks/$student.txt
setfacl -m u:$student:r -R notices
setfacl -m u:$student:r -R /home/school/schoolnotices
done

# Change permissions for Teacher (read and write permissions for their own class and read-only access to entire-school and class-specific principal notice)
teacher="TEACHER_""$i"
setfacl -m u:$teacher:rwx -R .
setfacl -m u:$teacher:r ./notices/principalnotice.txt
setfacl -m u:$student:r -R /home/school/schoolnotices

cd ..
done
