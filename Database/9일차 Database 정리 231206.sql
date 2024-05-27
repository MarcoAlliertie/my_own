SELECT A.����ID, A.����, 
A.�μ�ID,(
        SELECT �μ���
        FROM �μ�
        WHERE �μ�ID = A.�μ�ID
        ) AS �μ���
FROM ���� A
WHERE ����ID BETWEEN 'A0001' AND 'A0006';

-- ����Ŭ ����

SELECT A.����ID, A.����, A.�μ�ID, B.�μ���
FROM ���� A, �μ� B
WHERE A.�μ�ID = B.�μ�ID(+)
AND A.����ID BETWEEN 'A0001' AND 'A0006' ;

--ANSI ����

SELECT A.����ID, A.����, A.�μ�ID, B.�μ���
FROM ���� A LEFT OUTER JOIN �μ� B
ON (A.�μ�ID = B.�μ�ID)
WHERE A.����ID BETWEEN 'A0001' AND 'A0006';

/* 
SELECT A.����ID, A.����, 
A.�μ�ID,(
        SELECT �μ���
        FROM �μ�
        WHERE �μ�ID = �μ�ID
        ) AS �μ���
FROM ���� A
WHERE ����ID BETWEEN 'A0001' AND 'A0006'; 

���� ���̺��� ���� �μ�ID���� �μ� ���̺��� ���� �μ�ID���� ������ �� �Ǿ� 
�ϳ��� Ʃ�ÿ� ���� ���� ���� ���� ���� ��. ����!

SELECT A.����ID, A.����, 
A.�μ�ID,(
        SELECT �μ�ID, �μ���
        FROM �μ�
        WHERE �μ�ID = A.�μ�ID
        ) AS �μ���
FROM ���� A
WHERE ����ID BETWEEN 'A0001' AND 'A0006';

��Į�� ������������ ������ �÷��� �������� �ϹǷ� ����!
������ �÷��� ��Į�� ���������� �������� �ϸ� �ش� �÷����� ��Į�� ���������� �ۼ��� ���
*/

SELECT A.����ID, A.����, A.�μ�ID,
      (
       SELECT �μ���
       FROM �μ�
       WHERE �μ�ID = A.�μ�ID
       )AS �μ���
FROM ���� A
WHERE A.����ID BETWEEN 'A0001' AND 'A0006';

SELECT A.����ID, A.�̸�, A.�ֹε�Ϲ�ȣ,
    (
    SELECT ����ó
    FROM ��������ó 
    WHERE �����ڵ� = '�޴���'
    AND ����ID = A.����ID
    ) AS �޴�����ȣ
FROM ���� A 
WHERE A.����ID BETWEEN 'A0006' AND 'A0010'
ORDER BY A.����ID 
;



-- 2��° ���� �ƿ��� ��������

SELECT A.����ID, A.�̸�, A.�ֹε�Ϲ�ȣ, B.����ó AS �޴�����ȣ
FROM ���� A, ��������ó B
WHERE (B.�����ڵ� = '�޴���' OR B.�����ڵ� IS NULL)
AND A.����ID BETWEEN 'A0006' AND 'A0010'
AND A.����ID = B.����ID(+)
ORDER BY A.����ID
;

--NULL �κ� ������ ��ȣ ���� �ۿ� ���ָ� (+)��ȣ�� NULL���� ���ÿ� ���� �� ���ٴ� ������ ���.
--�׷��� ��ȣ�� �����ִ� ��.
--ANSI �������� �ٲٸ� (+)��ȣ�� �������Ƿ� ������ �ذ��� ��.

SELECT *
FROM (
      SELECT *
      FROM ����
      ORDER BY ����
      )
WHERE ROWNUM<=3;



SELECT *
FROM (
      SELECT *
      FROM ����
      ORDER BY ���� DESC
      )
WHERE ROWNUM<=3;

/* ���̸� ������������ �����ߴµ� �� NULL����..?
����Ŭ������ NULL���� ���� ū ������ ��. MAX ��ɾ���� NULL���� �� �������� �װ� MAX�� Ư¡. ���� �� NULL�� ���� ŭ 
�ٸ� �����ͺ��̽����� NULL���� ���� ���� ������ �� */


SELECT *
FROM ����
WHERE ����>=(SELECT AVG(����)
            FROM ����);
            
-- ��� ��������

SELECT *
FROM ���� A
WHERE ���� = (SELECT MIN(����)
             FROM ����
             WHERE �μ�ID = A.�μ�ID);
             

--�� ��� �������� ������ �μ��� ���������� �̴� ����. GROUP BY�� �ϸ�?

SELECT MIN(����), �μ�ID
FROM ����
GROUP BY �μ�ID;             

--GROUP BY������ �� �� �ִ� �÷��� �������̶�� ������ �ִ�.
             
-- ���� ��������
SELECT *
FROM ����
WHERE ���� >= (SELECT AVG(����)
             FROM ����);

SELECT *
FROM ���� A
WHERE A.���� = (SELECT MAX(����)
             FROM ����
             WHERE �μ�ID = A.�μ�ID);  
      
SELECT *
FROM ���� A
WHERE A.�Ի��Ͻ� = (SELECT MAX(�Ի��Ͻ�) 
                   FROM ����);
                   
SELECT *
FROM ����
WHERE ���� = (SELECT MAX(����)
             FROM ����);