if not EXISTS (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME ='SIS_ARQUIVO_BVBG_020' and COLUMN_NAME ='NM_MSGEM')  alter table SIS_ARQUIVO_BVBG_020 add NM_MSGEM nvarchar(64) null
if not EXISTS (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME ='SIS_ARQUIVO_BVBG_017' and COLUMN_NAME ='NM_MSGEM')  alter table SIS_ARQUIVO_BVBG_017 add NM_MSGEM nvarchar(64) null
if not EXISTS (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME ='sis_arquivo_bvbg_021' and COLUMN_NAME ='NM_MSGEM')  alter table sis_arquivo_bvbg_021 add NM_MSGEM nvarchar(64) null
if not EXISTS (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME ='sis_arquivo_bvbg_080' and COLUMN_NAME ='NM_MSGEM')  alter table sis_arquivo_bvbg_080 add NM_MSGEM nvarchar(64) null
