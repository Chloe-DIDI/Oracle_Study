SELECT USER
FROM DUAL;
--==>> HR

--�� EMPLOYEES ���̺��� ������ SALARY �� 10% �λ��Ѵ�.
--   ��, �μ����� 'IT'�� ���� �����Ѵ�.
--   (���� ������ ã�� �μ���ȣ�� �Է��ϴ� ���� �ƴ�
--    ����, ��� Ȯ�� �� ROLLBACK)


SELECT *
FROM DEPARTMENTS;
--==>>
/*
10	Administration	    200	1700
20	Marketing	        201	1800
30	Purchasing	        114	1700
40	Human Resources	    203	2400
50	Shipping	        121	1500
60	IT	                103	1400     ���������� CHECK ~ !!!
70	Public Relations	204	2700
80	Sales	            145	2500
90	Executive	        100	1700
100	Finance	            108	1700
110	Accounting	        205	1700
120	Treasury		        1700
130	Corporate Tax		    1700
140	Control And Credit		1700
150	Shareholder Services	1700
160	Benefits		        1700
170	Manufacturing		    1700
180	Construction		    1700
190	Contracting		        1700
200	Operations		        1700
210	IT Support		        1700
220	NOC		                1700
230	IT Helpdesk		        1700
240	Government Sales		1700
250	Retail Sales		    1700
260	Recruiting		        1700
270	Payroll		            1700
*/


SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, SALARY*1.1"�λ�޿�"
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60;   --> IT�� �μ� ID
--==>> 
/*
Alexander	Hunold	    9000	60	9900
Bruce	    Ernst	    6000	60	6600
David	    Austin	    4800	60	5280
Valli	    Pataballa	4800	60	5280
Diana	    Lorentz	    4200	60	4620
*/
-----------------------------------------------------

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, SALARY*1.1"�λ�޿�"
FROM EMPLOYEES
WHERE DEPARTMENT_ID=(DEPARTMENTS ���̺��� IT �μ��� �μ���ȣ);   --> IT�� �μ� ID



SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, SALARY*1.1"�λ�޿�"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID           -- (3)
                       FROM DEPARTMENTS               -- (1)
                       WHERE DEPARTMENT_NAME = 'IT'); -- (2)

-- Ȯ��
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60;
/*
Alexander	Hunold	    9000	60
Bruce   	Ernst	    6000	60
David	    Austin	    4800	60
Valli   	Pataballa	4800	60
Diana	    Lorentz	    4200	60
*/



--�� UPDATE
UPDATE EMPLOYEES 
SET SALARY= SALARY * 1.1
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS 
                       WHERE DEPARTMENT_NAME = 'IT');
--==>> 5�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

-- Ȯ��

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60;
--==>>
/*
Alexander	Hunold	    9900	60
Bruce	    Ernst	    6600	60
David	    Austin	    5280    60
Valli	    Pataballa	5280	60
Diana	    Lorentz	    4620	60
*/

ROLLBACK;
--==>> �ѹ� �Ϸ�.




--�� EMPLOYEES ���̺��� JOB_TITLE �� ��Sales Manager���� �������
--   SALARY �� �ش� ����(����)�� �ְ� �޿�(MAX_SALARY)�� �����Ѵ�.
--   ��, �Ի����� 2006�� ����(�ش� �⵵ ����) �Ի��ڿ� ���Ͽ�
--   ������ �� �ֵ��� ó���Ѵ�.
--   (��� Ȯ�� �� ROLL BACK)

SELECT *
FROM JOBS;
SELECT *
FROM EMPLOYEES;



UPDATE EMPLOYEES
SET SALARY = (Sales Manager �� MAX_SALARY)
WHERE JOB_ID = (JOB TITLE �� Sales Manager �� JOB_ID)
  AND TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) < 2006;                --> YEAR FROM HI~ �ص��ǰ�, EXTRACT �� �ص���
     
     
--> SET(����) �� �ΰ� �̻��̸�  ,
--> WHERE �� AND �Ǵ� OR


--(Sales Manager �� MAX_SALARY)
SELECT MAX_SALARY
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';
--==>> 20080


--(Sales Manager �� JOB_ID)
SELECT JOB_ID
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';
--==>> SA_MAN


--== ����


UPDATE EMPLOYEES
SET SALARY = (SELECT MAX_SALARY
                FROM JOBS
               WHERE JOB_TITLE = 'Sales Manager')
WHERE JOB_ID = (SELECT JOB_ID
                  FROM JOBS
                 WHERE JOB_TITLE = 'Sales Manager')
  AND TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) < 2006;    
--==>> 3�� �� ��(��) ������Ʈ�Ǿ����ϴ�.


-- Ȯ��
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
  AND TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) < 2006;
--==>>
/*
John	20080
Karen	20080
Alberto	20080
*/


ROLLBACK;
--==>> �ѹ� �Ϸ�.