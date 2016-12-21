/*
------------------------------------------------
Product      : A2 (START-FIXEDASSETS)
Last updated : 15.12.2016
DB version   : 8.0.1001
------------------------------------------------
Создание и обновление структуры базы данных приложения А2 FIXEDASSETS
*/
------------------------------------------------
if DB_NAME() = N'master'
begin
		declare @err nvarchar(255);
		set @err = N'Ошибка! Нельзя использовать базу master!';
		print @err;
		raiserror (@err, 16, 1) with nowait;
    set noexec on;
end
go
------------------------------------------------
if not exists(select * from INFORMATION_SCHEMA.SCHEMATA where SCHEMA_NAME=N'a2fixedassets')
begin
	exec sp_executesql N'create schema a2fixedassets';
end
go
------------------------------------------------
if not exists(select * from a2sys.SYS_PARAMS where SP_NAME=N'APP_DB_VERSION_FIXEDASSETS')
begin
	set nocount on;
	--***APP_DB_VERSION***
	insert into a2sys.SYS_PARAMS (SP_NAME, SP_LONG) 
		values (N'APP_DB_VERSION_FIXEDASSETS', 1001);
end
go
------------------------------------------------
-- ТЕКУЩИЙ НОМЕР ВЕРСИИ (***APP_DB_VERSION***)
set nocount on;
update a2sys.SYS_PARAMS set SP_LONG=1001 where SP_NAME='APP_DB_VERSION_FIXEDASSETS';
go
------------------------------------------------
if not exists (select * from a2misc.APP_PARAMS where APRM_ID=20)
begin
	set nocount on;
	insert into a2misc.APP_PARAMS (APRM_ID, APRM_P0,APRM_CODE,APRM_NAME,APRM_TYPE,APRM_VALUE)
	values
		(20, 0, N'FIXEDASSETS', N'Основные средства', 11, N'1');
end
go
------------------------------------------------
if not exists (select * from a2misc.TREE_PARAMS where ELEM_BASE=N'template' and ELEM_ID=1000 and APRM_CODE=N'FIXEDASSETS')
begin
	set nocount on;
	insert into a2misc.TREE_PARAMS (APRM_CODE, ELEM_ID, ELEM_BASE) values (N'FIXEDASSETS', 1000, N'template');
end
go
------------------------------------------------
if not exists (select * from a2misc.TREE_PARAMS where ELEM_BASE=N'entity' and ELEM_ID=1 and APRM_CODE=N'FIXEDASSETS')
begin
	set nocount on;
	insert into a2misc.TREE_PARAMS (APRM_CODE, ELEM_ID, ELEM_BASE) values (N'FIXEDASSETS', 1, N'entity');
end
go
------------------------------------------------
--ACCOUNTS
------------------------------------------------
if not exists (select * from a2account.ACCOUNTS where ACC_ID=1000111)
	--библиотечные фонды
	insert into a2account.ACCOUNTS (ACC_ID,ACC_P0,ACC_CODE,ACC_VOID,ACC_TYPE,ACC_KIND,ACC_NAME)
	values (1000111, 1000011, N'111', 0, N'A', N'SUE ', N'@acc111');
------------------------------------------------
if not exists (select * from a2account.ACCOUNTS where ACC_ID=1000113)
	--временные (нетитульные) сооружения
	insert into a2account.ACCOUNTS (ACC_ID,ACC_P0,ACC_CODE,ACC_VOID,ACC_TYPE,ACC_KIND,ACC_NAME)
	values (1000113, 1000011, N'113', 0, N'A', N'SUE ', N'@acc113');
------------------------------------------------
if not exists (select * from a2account.ACCOUNTS where ACC_ID=1000114)
	--природные ресурсы
	insert into a2account.ACCOUNTS (ACC_ID,ACC_P0,ACC_CODE,ACC_VOID,ACC_TYPE,ACC_KIND,ACC_NAME)
	values (1000114, 1000011, N'114', 0, N'A', N'SUE ', N'@acc114');
------------------------------------------------
if not exists (select * from a2account.ACCOUNTS where ACC_ID=1000115)
	--инвентарная тара
	insert into a2account.ACCOUNTS (ACC_ID,ACC_P0,ACC_CODE,ACC_VOID,ACC_TYPE,ACC_KIND,ACC_NAME)
	values (1000115, 1000011, N'115', 0, N'A', N'SUE ', N'@acc115');
------------------------------------------------
if not exists (select * from a2account.ACCOUNTS where ACC_ID=1000116)
	--предметы проката
	insert into a2account.ACCOUNTS (ACC_ID,ACC_P0,ACC_CODE,ACC_VOID,ACC_TYPE,ACC_KIND,ACC_NAME)
	values (1000116, 1000011, N'116', 0, N'A', N'SUE ', N'@acc116');
------------------------------------------------
if not exists (select * from a2account.ACCOUNTS where ACC_ID=1000121)
	--Права пользования природными ресурсами
	insert into a2account.ACCOUNTS (ACC_ID,ACC_P0,ACC_CODE,ACC_VOID,ACC_TYPE,ACC_KIND,ACC_NAME)
	values (1000121, 1000012, N'121', 0, N'A', N'SUE ', N'@acc121');
------------------------------------------------
if not exists (select * from a2account.ACCOUNTS where ACC_ID=1000122)
	--Права пользования природными ресурсами
	insert into a2account.ACCOUNTS (ACC_ID,ACC_P0,ACC_CODE,ACC_VOID,ACC_TYPE,ACC_KIND,ACC_NAME)
	values (1000122, 1000012, N'122', 0, N'A', N'SUE ', N'@acc122');
------------------------------------------------
if not exists (select * from a2account.ACCOUNTS where ACC_ID=1000123)
	--Права пользования имуществом
	insert into a2account.ACCOUNTS (ACC_ID,ACC_P0,ACC_CODE,ACC_VOID,ACC_TYPE,ACC_KIND,ACC_NAME)
	values (1000123, 1000012, N'123', 0, N'A', N'SUE ', N'@acc123');
------------------------------------------------
if not exists (select * from a2account.ACCOUNTS where ACC_ID=1000124)
	--Права на коммерческие обозначения
	insert into a2account.ACCOUNTS (ACC_ID,ACC_P0,ACC_CODE,ACC_VOID,ACC_TYPE,ACC_KIND,ACC_NAME)
	values (1000124, 1000012, N'124', 0, N'A', N'SUE ', N'@acc124');
------------------------------------------------
if not exists (select * from a2account.ACCOUNTS where ACC_ID=1000125)
	--Авторское право и смежные с ним права
	insert into a2account.ACCOUNTS (ACC_ID,ACC_P0,ACC_CODE,ACC_VOID,ACC_TYPE,ACC_KIND,ACC_NAME)
	values (1000125, 1000012, N'125', 0, N'A', N'SUE ', N'@acc125');
------------------------------------------------
if not exists (select * from a2account.ACCOUNTS where ACC_ID=1000127)
	--Прочие нематериальные активы
	insert into a2account.ACCOUNTS (ACC_ID,ACC_P0,ACC_CODE,ACC_VOID,ACC_TYPE,ACC_KIND,ACC_NAME)
	values (1000127, 1000012, N'127', 0, N'A', N'SUE ', N'@acc127');
------------------------------------------------
if not exists (select * from a2account.ACCOUNTS where ACC_ID=1000131)
	--Износ основных средств
	insert into a2account.ACCOUNTS (ACC_ID,ACC_P0,ACC_CODE,ACC_VOID,ACC_TYPE,ACC_KIND,ACC_NAME)
	values (1000131, 1000013, N'131', 0, N'P', N'SUE ', N'@acc131');
------------------------------------------------
if not exists (select * from a2account.ACCOUNTS where ACC_ID=1000132)
	--Износ прочих необоротных материальных активов
	insert into a2account.ACCOUNTS (ACC_ID,ACC_P0,ACC_CODE,ACC_VOID,ACC_TYPE,ACC_KIND,ACC_NAME)
	values (1000132, 1000013, N'132', 0, N'P', N'SUE ', N'@acc132');
------------------------------------------------
if not exists (select * from a2account.ACCOUNTS where ACC_ID=1000133)
	--Накопленная амортизация необоротных активов
	insert into a2account.ACCOUNTS (ACC_ID,ACC_P0,ACC_CODE,ACC_VOID,ACC_TYPE,ACC_KIND,ACC_NAME)
	values (1000133, 1000013, N'133', 0, N'P', N'SUE ', N'@acc133');
------------------------------------------------
if not exists (select * from a2account.ACCOUNTS where ACC_ID=1000134)
	--Накопленная амортизация долгосрочных биологических активов
	insert into a2account.ACCOUNTS (ACC_ID,ACC_P0,ACC_CODE,ACC_VOID,ACC_TYPE,ACC_KIND,ACC_NAME)
	values (1000134, 1000013, N'134', 0, N'P', N'SUE ', N'@acc134');
------------------------------------------------
if not exists (select * from a2account.ACCOUNTS where ACC_ID=1000135)
	--Износ инвестиционной недвижимости
	insert into a2account.ACCOUNTS (ACC_ID,ACC_P0,ACC_CODE,ACC_VOID,ACC_TYPE,ACC_KIND,ACC_NAME)
	values (1000135, 1000013, N'135', 0, N'P', N'SUE ', N'@acc135');
------------------------------------------------
if not exists (select * from a2account.ACCOUNTS where ACC_ID=1000141)
	--Инвестиции связанным сторонам по методу участия в капитале
	insert into a2account.ACCOUNTS (ACC_ID,ACC_P0,ACC_CODE,ACC_VOID,ACC_TYPE,ACC_KIND,ACC_NAME)
	values (1000141, 1000014, N'141', 0, N'A', N'SUE ', N'@acc141');
------------------------------------------------
if not exists (select * from a2account.ACCOUNTS where ACC_ID=1000142)
	--Прочие инвестиции связанным сторонам
	insert into a2account.ACCOUNTS (ACC_ID,ACC_P0,ACC_CODE,ACC_VOID,ACC_TYPE,ACC_KIND,ACC_NAME)
	values (1000142, 1000014, N'142', 0, N'A', N'SUE ', N'@acc142');
------------------------------------------------
if not exists (select * from a2account.ACCOUNTS where ACC_ID=1000143)
	--Прочие инвестиции связанным сторонам
	insert into a2account.ACCOUNTS (ACC_ID,ACC_P0,ACC_CODE,ACC_VOID,ACC_TYPE,ACC_KIND,ACC_NAME)
	values (1000143, 1000014, N'143', 0, N'A', N'SUE ', N'@acc143');

------------------------------------------------
--ENTITIES
------------------------------------------------
--11
--библиотечные фонды 
if not exists (select * from a2entity.ENTITIES where ENT_ID=111)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (111, N'LBCO', N'LBCO', 11, 1111, 1000111, 1, N'111. @acc111');
--временные (нетитульные) сооружения  
if not exists (select * from a2entity.ENTITIES where ENT_ID=113)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (113, N'TECO', N'TECO', 11, 1113, 1000113, 1, N'113. @acc113');
--природные ресурсы  
if not exists (select * from a2entity.ENTITIES where ENT_ID=114)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (114, N'NLRS', N'NLRS', 11, 1114, 1000114, 1, N'114. @acc114');
--инвентарная тара  
if not exists (select * from a2entity.ENTITIES where ENT_ID=115)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (115, N'RTCR', N'RTCR', 11, 1115, 1000115, 1, N'115. @acc115');
--предметы проката  
if not exists (select * from a2entity.ENTITIES where ENT_ID=116)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (116, N'RLIM', N'RLIM', 11, 1116, 1000116, 1, N'116. @acc116');
--12
--права пользования природными ресурсами   
if not exists (select * from a2entity.ENTITIES where ENT_ID=121)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (121, N'RUNR', N'RUNR', 12, 1121, 1000121, 1, N'121. @acc121');
--права пользования имуществом    
if not exists (select * from a2entity.ENTITIES where ENT_ID=122)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (122, N'RUTP', N'RUTP', 12, 1122, 1000122, 1, N'122. @acc122');
--права на коммерческие обозначения   
if not exists (select * from a2entity.ENTITIES where ENT_ID=123)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (123, N'RTCD', N'RTCD', 12, 1123, 1000123, 1, N'123. @acc123');
--права на объекты промышленной собственности  
if not exists (select * from a2entity.ENTITIES where ENT_ID=124)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (124, N'ROIP', N'ROIP', 12, 1124, 1000124, 1, N'124. @acc124');
--авторское право и смежные с ним права  
if not exists (select * from a2entity.ENTITIES where ENT_ID=125)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (125, N'CPAR', N'CPAR', 12, 1125, 1000125, 1, N'125. @acc125');
--прочие нематериальные активы   
if not exists (select * from a2entity.ENTITIES where ENT_ID=127)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (127, N'ORIA', N'ORIA', 12, 1127, 1000127, 1, N'126. @acc127');
--13
--износ (амортизация) необоротных активов
if not exists (select * from a2entity.ENTITIES where ENT_ID=13)
insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ENT_NAME)
		values (13, N'DOFA', N'DOFA', 1, 1013, N'13. @acc13');
--износ основных средств  
if not exists (select * from a2entity.ENTITIES where ENT_ID=131)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (131, N'DEFA', N'DEFA', 13, 1131, 1000131, 1, N'131. @acc131');
--износ прочих необоротных материальных активов   
if not exists (select * from a2entity.ENTITIES where ENT_ID=132)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (132, N'DOTA', N'DOTA', 13, 1132, 1000132, 1, N'132. @acc132');
--накопленная амортизация необоротных активов   
if not exists (select * from a2entity.ENTITIES where ENT_ID=133)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (133, N'ADFA', N'ADFA', 13, 1133, 1000133, 1, N'133. @acc133');
--накопленная амортизация долгосрочных биологических активов   
if not exists (select * from a2entity.ENTITIES where ENT_ID=134)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (134, N'AABA', N'AABA', 13, 1134, 1000134, 1, N'134. @acc134');
--износ инвестиционной недвижимости    
if not exists (select * from a2entity.ENTITIES where ENT_ID=135)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (135, N'DOIP', N'DOIP', 13, 1135, 1000135, 1, N'135. @acc135');
--14
--долгосрочные финансовые инвестиции 
if not exists (select * from a2entity.ENTITIES where ENT_ID=14)
insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ENT_NAME)
		values (14, N'LTFI', N'LTFI', 1, 1014, N'14. @acc14');
--инвестиции связанным сторонам по методу участия в капитале    
if not exists (select * from a2entity.ENTITIES where ENT_ID=141)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (141, N'IREM', N'IREM', 14, 1141, 1000141, 1, N'141. @acc141');
--прочие инвестиции связанным сторонам    
if not exists (select * from a2entity.ENTITIES where ENT_ID=142)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (142, N'OIRP', N'OIRP', 14, 1142, 1000142, 1, N'142. @acc142');
--прочие инвестиции связанным сторонам    
if not exists (select * from a2entity.ENTITIES where ENT_ID=143)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (143, N'ITUP', N'ITUP', 14, 1143, 1000143, 1, N'143. @acc143');
--15
--капитальные инвестиции 
if not exists (select * from a2entity.ENTITIES where ENT_ID=15)
insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ENT_NAME)
		values (15, N'CAIN', N'CAIN', 1, 1015, N'15. @acc15');
--капитальное строительство    
if not exists (select * from a2entity.ENTITIES where ENT_ID=151)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (151, N'CABL', N'CABL', 15, 1151, 1000151, 1, N'151. @acc151');
--приобретение (изготовление) основных средств    
if not exists (select * from a2entity.ENTITIES where ENT_ID=152)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (152, N'AMPE', N'AMPE', 15, 1152, 1000152, 1, N'152. @acc152');
--приобретение (изготовление) прочих необоротных материальных активов    
if not exists (select * from a2entity.ENTITIES where ENT_ID=153)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (153, N'AOTA', N'AOTA', 15, 1153, 1000153, 1, N'153. @acc153');
--приобретение (создание) материальных активов  
if not exists (select * from a2entity.ENTITIES where ENT_ID=154)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (154, N'ACIA', N'ACIA', 15, 1154, 1000154, 1, N'154. @acc154');
--формирование основного стада 
if not exists (select * from a2entity.ENTITIES where ENT_ID=155)
		insert into a2entity.ENTITIES (ENT_ID, ENT_KIND, ENT_SYSID, ENT_P0, ENT_TYPE, ACC_ID, ENT_CANCHILD, ENT_NAME)
		values (155, N'FOBH', N'FOBH', 15, 1155, 1000155, 1, N'155. @acc155');

------------------------------------------------
--DOCUMENTS
------------------------------------------------
--1.Получение  основных средств
--cчет на приобретение оборудования
if not exists (select * from a2doc.DOC_KINDS where D_KIND=N'IFPE')
	insert into a2doc.DOC_KINDS (D_KIND,DK_SHORT,DK_NAME,DK_FILE) 
	values  (N'IFPE', N'СЧПО' ,  N'Счет',  N'..\a2fixedassets\forms\invoice_fa.form.xml')
--приходная накладная ОС,НА
if not exists (select * from a2doc.DOC_KINDS where D_KIND=N'WBFA')
	insert into a2doc.DOC_KINDS (D_KIND,DK_SHORT,DK_NAME,DK_FILE) 
	values  (N'WBFA', N'ПРОС' ,  N'Приходная накладная',  N'..\a2fixedassets\forms\waybill_fa.form.xml')
--акт выполненных работ
if not exists (select * from a2doc.DOC_KINDS where D_KIND=N'CECO')
	insert into a2doc.DOC_KINDS (D_KIND,DK_SHORT,DK_NAME,DK_FILE) 
	values  (N'CECO', N'АРОС' ,  N'Акт выполненных работ/услуг',  N'..\a2fixedassets\forms\cert_compl_fa.form.xml')
--акт ввода в эксплуатацию ОС,НА
if not exists (select * from a2doc.DOC_KINDS where D_KIND=N'TACM')
	insert into a2doc.DOC_KINDS (D_KIND,DK_SHORT,DK_NAME,DK_FILE) 
	values  (N'TACM', N'АВЕК' ,  N'Акт ввода в эксплуатацию',  N'..\a2fixedassets\forms\act_comm_fa.form.xml')
--ввод основных средств купленных ранее
if not exists (select * from a2doc.DOC_KINDS where D_KIND=N'CFAB')
	insert into a2doc.DOC_KINDS (D_KIND,DK_SHORT,DK_NAME,DK_FILE) 
	values  (N'CFAB', N'ВОКР' ,  N'Ввод ОС купленных ранее',  N'..\a2fixedassets\forms\comm_purch_before_fa.form.xml')

--2.Учет эксплуатации и использования основных средств
--перемещение ОС,НА
if not exists (select * from a2doc.DOC_KINDS where D_KIND=N'MVFA')
	insert into a2doc.DOC_KINDS (D_KIND,DK_SHORT,DK_NAME,DK_FILE) 
	values  (N'MVFA', N'ПМОС' ,  N'Перемещение ОС,НА',  N'..\a2fixedassets\forms\move_fa.form.xml')
--cписание основных средств
if not exists (select * from a2doc.DOC_KINDS where D_KIND=N'WOFA')
	insert into a2doc.DOC_KINDS (D_KIND,DK_SHORT,DK_NAME,DK_FILE) 
	values  (N'WOFA', N'СПОС' ,  N'Списание основных средств',  N'..\a2fixedassets\forms\writeoff_fa.form.xml')
------------------------------------------------
--TEMPLATES
------------------------------------------------
--шаблоны основных средств
--основные средства
if not exists (select * from a2doc.TEMPLATES where TML_ID = 1000)
	insert into a2doc.TEMPLATES (TML_ID, TML_P0, TML_KIND, TML_TYPE, TML_NAME) 
	values  (1000,1,N'TMFA',1000,N'@acc10');
	--1.Получение  основных средств
	if not exists (select * from a2doc.TEMPLATES where TML_ID = 1001)
		insert into a2doc.TEMPLATES (TML_ID, TML_P0, TML_KIND, TML_TYPE, TML_NAME) 
		values  (1001,1000,N'TFAI',1000,N'Получение  основных средств');
		--cчет на приобретение оборудования
		if not exists (select * from a2doc.TEMPLATES where TML_ID=1002)
			insert into a2doc.TEMPLATES (TML_ID, TML_P0, TML_KIND, TML_SIGN, TML_TYPE, D_KIND, TML_ORDER, TML_PARAMS, TML_FILE, TML_NAME) 
			values  (1002, 1001,	N'TIFP', N'0000', 0, N'IFPE', 70, N'', N'..\a2fixedassets\templates\invoice_fa.template.xml', N'@buy ОС,НА');
		--приходная накладная ОС,НА
		if not exists (select * from a2doc.TEMPLATES where TML_ID=1003)
			insert into a2doc.TEMPLATES (TML_ID, TML_P0, TML_KIND, TML_SIGN, TML_TYPE, D_KIND, TML_ORDER, TML_PARAMS, TML_FILE, TML_NAME) 
			values  (1003, 1001,	N'TWBF', N'0000', 0, N'WBFA', 70, N'', N'..\a2fixedassets\templates\waybill_fa.template.xml', N'@waybillin');
		--акт выполненных работ
		if not exists (select * from a2doc.TEMPLATES where TML_ID=1004)
			insert into a2doc.TEMPLATES (TML_ID, TML_P0, TML_KIND, TML_SIGN, TML_TYPE, D_KIND, TML_ORDER, TML_PARAMS, TML_FILE, TML_NAME) 
			values  (1004, 1001,	N'TCEC', N'0000', 0, N'CECO', 70, N'', N'..\a2fixedassets\templates\cert_compl_fa.template.xml', N'Акт выполненных работ/услуг');
		--акт ввода в эксплуатацию ОС,НА
		if not exists (select * from a2doc.TEMPLATES where TML_ID=1005)
			insert into a2doc.TEMPLATES (TML_ID, TML_P0, TML_KIND, TML_SIGN, TML_TYPE, D_KIND, TML_ORDER, TML_PARAMS, TML_FILE, TML_NAME) 
			values  (1005, 1001,	N'TTAC', N'0000', 0, N'TACM', 70, N'', N'..\a2fixedassets\templates\act_comm_fa.template.xml', N'Акт ввода в эксплуатацию');
delete from a2doc.TEMPLATES where TML_ID in (1001,1002,1003,1004)
--перемещение ОС,НА
--if not exists (select * from a2doc.TEMPLATES where TML_ID=1005)
--	insert into a2doc.TEMPLATES (TML_ID, TML_P0, TML_KIND, TML_SIGN, TML_TYPE, D_KIND, TML_ORDER, TML_PARAMS, TML_FILE, TML_NAME) 
--	values  (1005, 1000,	N'TMVF', N'0000', 0, N'MVFA', 70, N'', N'..\a2fixedassets\templates\move_fa.template.xml', N'Перемещение ОС,НА');
--cписание основных средств
--if not exists (select * from a2doc.TEMPLATES where TML_ID=1006)
--	insert into a2doc.TEMPLATES (TML_ID, TML_P0, TML_KIND, TML_SIGN, TML_TYPE, D_KIND, TML_ORDER, TML_PARAMS, TML_FILE, TML_NAME) 
--	values  (1006, 1000,	N'TWOF', N'0000', 0, N'WOFA', 70, N'', N'..\a2fixedassets\templates\writeoff_fa.template.xml', N'Списание основных средств');

------------------------------------------------
--RIGHTS
------------------------------------------------
grant execute on schema ::a2fixedassets	to public;
grant control on schema ::a2fixedassets	to [a2admin];
go