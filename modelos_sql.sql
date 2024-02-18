-- Table: public.dim_beneficiario

-- DROP TABLE IF EXISTS public.dim_beneficiario;

CREATE TABLE IF NOT EXISTS public.dim_beneficiario
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    data_nascimento date NOT NULL,
    sexo character varying(32) COLLATE pg_catalog."default" NOT NULL,
    raca_etnia character varying(32) COLLATE pg_catalog."default" NOT NULL,
    deficiencia_fisica character varying(32) COLLATE pg_catalog."default" NOT NULL,
    idade_atual integer NOT NULL,
    idade_concessao integer NOT NULL,
    CONSTRAINT dim_beneficiario_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dim_beneficiario
    OWNER to postgres;


-- Table: public.dim_bolsa

-- DROP TABLE IF EXISTS public.dim_bolsa;

CREATE TABLE IF NOT EXISTS public.dim_bolsa
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    tipo character varying(126) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT dim_bolsa_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dim_bolsa
    OWNER to postgres;


-- Table: public.dim_instituicao

-- DROP TABLE IF EXISTS public.dim_instituicao;

CREATE TABLE IF NOT EXISTS public.dim_instituicao
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    cod_emec integer NOT NULL,
    nome character varying(256) COLLATE pg_catalog."default" NOT NULL,
    nome_curso character varying(256) COLLATE pg_catalog."default" NOT NULL,
    turno_curso character varying(32) COLLATE pg_catalog."default" NOT NULL,
    modalidade_ensino character varying(32) COLLATE pg_catalog."default" NOT NULL,
    regiao character varying(32) COLLATE pg_catalog."default" NOT NULL,
    uf character varying(32) COLLATE pg_catalog."default" NOT NULL,
    municipio character varying(128) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT dim_instituicao_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dim_instituicao
    OWNER to postgres;

-- Table: public.dim_tempo

-- DROP TABLE IF EXISTS public.dim_tempo;

CREATE TABLE IF NOT EXISTS public.dim_tempo
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    ano integer NOT NULL,
    CONSTRAINT dim_tempo_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dim_tempo
    OWNER to postgres;



-- Table: public.fato_concessao

-- DROP TABLE IF EXISTS public.fato_concessao;

CREATE TABLE IF NOT EXISTS public.fato_concessao
(
    id_beneficiario integer NOT NULL,
    id_instituicao integer NOT NULL,
    id_tempo integer NOT NULL,
    id_bolsa integer NOT NULL,
    qtd_concessao integer NOT NULL DEFAULT 1,
    CONSTRAINT fk_beneficiario FOREIGN KEY (id_beneficiario)
        REFERENCES public.dim_beneficiario (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_bolsa FOREIGN KEY (id_bolsa)
        REFERENCES public.dim_bolsa (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_instituicao FOREIGN KEY (id_instituicao)
        REFERENCES public.dim_instituicao (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_tempo FOREIGN KEY (id_tempo)
        REFERENCES public.dim_tempo (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.fato_concessao
    OWNER to postgres;