ALTER PROCEDURE [dbo].[SP_INTEGRA_CMDF_CLCO] 
      (@DATA_DT  SMALLDATETIME)
AS
BEGIN

      SET NOCOUNT ON;
      
      IF EXISTS (SELECT * FROM Cmdf_Aux WHERE Data_Arquivo_cmdf_aux = @DATA_DT)
        BEGIN
            DELETE FROM Cmdf_Aux WHERE Data_Arquivo_cmdf_aux = @DATA_DT
        END
      
      
      BEGIN
            -- Insert statements for procedure here
            
            --Insere/Select na tabela 
            insert INTO Cmdf_Aux
                  (Data_Arquivo_cmdf_aux,
                  Tipo_Reg_cmdf_aux,
                  Ident_Lanc_cmdf_aux,
                  Num_Ref_cmdf_aux,
                  Data_cmdf_aux,
                  Cod_Cliente_cmdf_aux,
                  Cod_Lanca_cmdf_aux,
                  Descr_Lanca_cmdf_aux,
                  DebCred_cmdf_aux,
                  Cod_Grupo_cmdf_aux,
                  Descr_Grupo_cmdf_aux,
                  Descr_Ref_Lanca_cmdf_aux,
                  Valor_cmdf_aux,
                  Valor_Emprestimo_cmdf_aux,
                  Qtd_cmdf_aux,
                  Papel_cmdf_aux,
                  Isin_cmdf_aux)
            SELECT 
                  arq021.Dt_Pregao as Data_Arquivo_cmdf_aux,
                  '01' as Tipo_Reg_cmdf_aux,
                  arq020.IdCamaraLiquidacao as Ident_Lanc_cmdf_aux,
                  null as Num_Ref_cmdf_aux,
                  arq021.Dt_Pregao as Data_cmdf_aux,
                  arq021.Id_Liq_Financeira as Cod_Cliente_cmdf_aux,
                  arq021.Cd_Carac_Lanc_Financeiro as Cod_Lanca_cmdf_aux,
                  arq020.Caracteristica as Descr_Lanca_cmdf_aux,
                  left(arq020.tpCredDeb,1) as DebCred_cmdf_aux,
                  arq020.IdGrupoLancamento as Cod_Grupo_cmdf_aux,
                  arq020.NmGrupoLancamento as Descr_Grupo_cmdf_aux,
                  arq021.NM_ARQUIVO as Descr_Ref_Lanca_cmdf_aux,
                  arq021.Vl_Financeiro as Valor_cmdf_aux,
                  arq021.Vl_Financeiro as Valor_Emprestimo_cmdf_aux,
                  arq021.Qt_Ativos as Qtd_cmdf_aux,
                  arq021.Nm_MercadoriaAssociada as Papel_cmdf_aux,
                  arq021.Cd_ISIN as Isin_cmdf_aux
                  from SIS_ARQUIVO_BVBG_021 arq021
                  left join SIS_ARQUIVO_BVBG_020 arq020
                  on arq021.Cd_Carac_Lanc_Financeiro = arq020.TpCaracteristica
                  and arq021.Dt_Pregao = arq020.Data_DT
                  where arq021.Dt_Pregao = @DATA_DT
      END
            
END
