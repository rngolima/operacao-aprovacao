-- =========================================================================
-- MIGRATION V4: CONFORMIDADE LGPD E VERIFICACAO EM DUAS ETAPAS POR E-MAIL
-- Compativel com PostgreSQL e H2 Database
-- =========================================================================

ALTER TABLE tb_usuario ADD COLUMN IF NOT EXISTS email_verificado BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE tb_usuario ADD COLUMN IF NOT EXISTS codigo_verificacao VARCHAR(6);
ALTER TABLE tb_usuario ADD COLUMN IF NOT EXISTS consentimento_lgpd BOOLEAN NOT NULL DEFAULT FALSE;
