-- ù��° SQL DEVELOPER
-- �λ�����

SELECT ����ID, �̸�, ����
FROM ����
WHERE ����ID='A0005';

UPDATE ���� SET ���� = ���� + 1000  -- ��������� +=, -= ���� �� ����Ŭ���� �� ���δ�.
WHERE ����ID='A0005';
COMMIT;

-- ������ �������� ������ �ǽ�

-- �ι�° SQL DEVELOPER
-- �ϰ� ����(����ö(A0005))

SELECT ����ID, �̸�, ����
FROM ����
WHERE ����ID='A0005'; 

-- COMMIT ���� ������ �λ����� �� ���ǿ��� ������ ������ �ݿ��� �� �ȴ�.

SELECT *
FROM ����;

-- Ʃ�õ� ���� �ӽ÷� �ο��Ǵ� ��ȣ�� ROWNUM

SELECT ROWNUM AS RN, ����ID, �̸�
FROM ����
WHERE ROWNUM<= 3;

--�ζ��� ��
SELECT *
FROM (SELECT ROWNUM AS RN, ����ID, �̸�
FROM ����)
WHERE RN = 3;

--���� ���� 5���� �̰� ���� ��� :

SELECT *
FROM ����
WHERE ���� IS NOT NULL
-- AND ROWNUM<=5
ORDER BY ���� DESC;

-- ORDER BY���� WHERE ���� ���� ����ǹǷ� �ǵ��� ��� �߻� X
-- ������ �Ŀ� 5���� ���� �������� �ǰڱ� - TOP-N ���

-- �� SQL�� ��ü�� ���̺�� �����Ͽ� �̸� SQL������ �ٽ� �����´�!

SELECT *
FROM (SELECT *
      FROM ����
      WHERE ���� IS NOT NULL
      -- AND ROWNUM<=5
      ORDER BY ���� DESC)
WHERE ROWNUM <=5;

-- �̰� �ٷ� TOP-N ���

SELECT * 
FROM (
      SELECT *  --����� ���ü��� ���ؼ��� ����.
      FROM ����
      WHERE ���� IS NOT NULL
      ORDER BY ����
      )
WHERE ROWNUM <= 3;

SELECT *
FROM (
      SELECT *
      FROM ����
      WHERE �Ի��Ͻ� IS NOT NULL
      ORDER BY �Ի��Ͻ� DESC
      ) --��¥�� �������� �����ϸ� ���� �ֱ� ��¥�� ���� �´�. (���ڰ� ũ�Ƿ�)
WHERE ROWNUM<=3;

-- �Ʒ��� �Խ��� ���̺� ����� SQL��

CREATE TABLE �Խ��� ( 
�Խ��ǹ�ȣ NUMBER(9) PRIMARY KEY , 
�ۼ���       VARCHAR2(50) NOT NULL , 
�Խù����� VARCHAR2(4000) NOT NULL  , 
�ۼ��Ͻ� DATE   NOT NULL 
) ;

INSERT INTO �Խ���
SELECT LEVEL                                -- �Խ��ǹ�ȣ
        , '���̵�' || MOD(LEVEL , 10000)     -- �ۼ��� 
        , '���̵�' || 
           MOD(LEVEL , 10000) || 
           '���� �ۼ��Ͻ� �Խù��Դϴ�. �� �Խù��� �Խ��� ��ȣ�� ' 
           || LEVEL 
           || '�Դϴ�'                       -- �Խù����� 
      , TO_DATE('20000101') + LEVEL         --2022�� 1��1�Ϻ��� �Ϸ羿 �Խù��� �ԷµǴ� ��
  FROM DUAL
CONNECT BY LEVEL <=1000000;                 --100������ ������ �Է� 

COMMIT; 

--


SELECT *
FROM �Խ���;


SELECT *
FROM (
      SELECT * 
      FROM �Խ���
      ORDER BY �ۼ��Ͻ� DESC
      )
WHERE ROWNUM<=20;

SELECT *
FROM(
      SELECT ROWNUM AS RN, A.*
      FROM(       
          SELECT *
          FROM �Խ���
          ORDER BY �ۼ��Ͻ� DESC
          ) A
      WHERE ROWNUM <=40
      ORDER BY �ۼ��Ͻ�
      )
WHERE ROWNUM<=20
ORDER BY �ۼ��Ͻ� DESC;


SELECT *
FROM(
      SELECT ROWNUM AS RN, A.*
      FROM(       
          SELECT *
          FROM �Խ���
          ORDER BY �ۼ��Ͻ� DESC
          ) A
      WHERE ROWNUM <=60
      ORDER BY �ۼ��Ͻ�
      )
WHERE RN>=41;


