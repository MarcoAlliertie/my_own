DROP TABLE ȸ������;  -- ���̺� ����. �� PK �������� ������ �ٸ� ���̺�� ����Ǿ� ������ ���� �� ��.
DROP TABLE ȸ������ CASCADE CONSTRAINTS; -- �������ǵ���� ������ ����


CREATE SEQUENCE ȸ��ID_SEQ;

SELECT ȸ��ID_SEQ.NEXTVAL
FROM DUAL;

DROP SEQUENCE ȸ��ID_SEQ;


CREATE VIEW �μ����ְ���_VIEW AS -- �ڿ� AS �����
SELECT �μ�ID, MAX(����) AS �μ���_�ְ���
FROM ����
GROUP BY �μ�ID
ORDER BY �μ�ID;

SELECT * 
FROM �μ����ְ���_VIEW;

SELECT * 
FROM (SELECT �μ�ID, MAX(����) AS �μ���_�ְ���
FROM ����
GROUP BY �μ�ID
ORDER BY �μ�ID); -- �� ���� �� ��� ����� SELECT�� ���� �����ϹǷ� ������ ��ȣ ġ�� �״�� ����־ �۵�

SELECT A.�̸�, A.����, B.�μ���_�ְ���
FROM ���� A, �μ����ְ���_VIEW B
WHERE A.�μ�ID = B.�μ�ID
AND A.���� = B.�μ���_�ְ���;

DROP VIEW �μ����ְ���_VIEW;

INSERT INTO ����������(�л�ID, �л��̸�, �Ҽӹ�)
VALUES('S0088', '�μ�', 'H');

SELECT *
FROM ����������;
-- ������ ������ ���� Ȯ��

UPDATE ����������
SET �л�ID = 'S0089',
�л��̸� = '��μ�',
�Ҽӹ� = 'G'
WHERE �л�ID = 'S0088';

-- UPDATE ����ǥ SET ���� = 100; --WHERE���� �����Ƿ� �����ϸ� ����ǥ ���̺� �ִ� ��� ������ 100�� �ȴ�.

UPDATE ����������
SET �л�ID = 'S0010',
�л��̸� = '������',
�Ҽӹ� = 'S'
WHERE �л�ID = 'S2222'; --�ش��ϴ� �л�ID�� �����Ƿ� ������ ���� �ʰ� 0���� ������Ʈ.


--DELETE FROM ����ǥ; --WHERE�� �� �������Ƿ� ��� �� ����

INSERT INTO ����(����ID, �н�����, �̸�, ����, �Ի��Ͻ�, �ֹε�Ϲ�ȣ, ����, �μ�ID)
VALUES('A1000', 'hello1000', '��ĳ��', 29, sysdate, '950120-1566221', 3500, 'D006')
; -- ���̸� '29'�� �Է��ߴ� �ص� �����ͺ��̽��� ����ȯ �Լ� �켱����(������)�� ���� �ڵ����� ���ڷ� ��ȯ
-- ������ nullable�̹Ƿ� ���� �Է� ���ص� �ڵ����� null�� �Էµ�.
UPDATE ����
SET ���� = '��',
�μ�ID = 'D005',
�н����� = 'hello1000!!!'
WHERE ����ID = 'A1000';

COMMIT;

DELETE FROM ����
WHERE ����ID='A1000';

INSERT INTO ����(����ID, �н�����, �̸�, ����, �Ի��Ͻ�, �ֹε�Ϲ�ȣ, ����, �μ�ID)
VALUES ('A2000', 'hello222','��ȫ��',40,SYSDATE, '830220-1566221',5600,'D006'); 

INSERT INTO ��������ó(����ID, �����ڵ�, ����ó) VALUES ('A2000', '�޴���','010-5959-1111');
INSERT INTO �����ּ� (����ID, �����ڵ�, �ּ�) VALUES ('A2000', '��', '��õ�� 123');

DELETE FROM ����ǥ;

COMMIT;

INSERT INTO ��������ó (����ID, �����ڵ�, ����ó) VALUES ('A2000', '����ȭ', '062-123-1111');

COMMIT;

UPDATE ��������ó 
SET ����ó = '010-3333-5959'
WHERE �����ڵ� = '�޴���'
AND ����ID = 'A2000';

--��������ó�� WHERE�� ��Ƶ� ������ Ǯ���� Ǯ����. �ٸ� ��������ó�� �������� ���õ��� �ʾ��� ��쵵 ���� �� ����.

COMMIT;

DELETE 
FROM �����ּ�
WHERE ����ID IN ('A0011', 'A0012', 'A0013', 'A2000');

COMMIT;

DELETE
FROM ��������ó
WHERE ����ID IN ('A0011', 'A0012', 'A0013', 'A2000');

DELETE
FROM ����
WHERE ����ID IN ('A0011', 'A0012', 'A0013', 'A2000');

-- �� �� ���� ���� : �ڽ� ���̺� �ִ� �����ͺ��� �����ؾ� �Ѵٴ� �� ������ �ֱ� ����.
-- �Ʒ� �� ���� �����ϸ� ����.

INSERT INTO ����ǥ (�л�ID, ����, ����) VALUES ('S0001','����',90) ; 
INSERT INTO ����ǥ (�л�ID, ����, ����) VALUES ('S0001','����',85) ; 
INSERT INTO ����ǥ (�л�ID, ����, ����) VALUES ('S0001','����',70); 

UPDATE ����ǥ
SET ���� = 80
WHERE ���� = '����'
AND �л�ID = 'S0001';
