PGDMP  	        4                w            dbmaster    10.7 #   10.9 (Ubuntu 10.9-0ubuntu0.18.04.1) �   &           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            '           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            (           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            )           1262    16395    dbmaster    DATABASE     z   CREATE DATABASE dbmaster WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE dbmaster;
             dbmasteruser    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             dbmasteruser    false            *           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  dbmasteruser    false    3            +           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO dbmasteruser;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  dbmasteruser    false    3                        3079    13920    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            ,           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16437 
   auth_group    TABLE     e   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
    DROP TABLE public.auth_group;
       public         dbmasteruser    false    3            �            1259    16435    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       dbmasteruser    false    3    203            -           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       dbmasteruser    false    202            �            1259    16447    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         dbmasteruser    false    3            �            1259    16445    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       dbmasteruser    false    205    3            .           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       dbmasteruser    false    204            �            1259    16429    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         dbmasteruser    false    3            �            1259    16427    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       dbmasteruser    false    3    201            /           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       dbmasteruser    false    200            �            1259    16455 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         dbmasteruser    false    3            �            1259    16465    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         dbmasteruser    false    3            �            1259    16463    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       dbmasteruser    false    209    3            0           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
            public       dbmasteruser    false    208            �            1259    16453    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       dbmasteruser    false    207    3            1           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
            public       dbmasteruser    false    206            �            1259    16473    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         dbmasteruser    false    3            �            1259    16471 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       dbmasteruser    false    211    3            2           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
            public       dbmasteruser    false    210            �            1259    16706    block_block    TABLE     c  CREATE TABLE public.block_block (
    index integer NOT NULL,
    id integer NOT NULL,
    time_stamp timestamp with time zone NOT NULL,
    data text NOT NULL,
    hash character varying(255) NOT NULL,
    previous_hash character varying(255) NOT NULL,
    nonce character varying(255) NOT NULL,
    chain_id integer NOT NULL,
    contract_id integer
);
    DROP TABLE public.block_block;
       public         dbmasteruser    false    3            �            1259    16704    block_block_id_seq    SEQUENCE     �   CREATE SEQUENCE public.block_block_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.block_block_id_seq;
       public       dbmasteruser    false    229    3            3           0    0    block_block_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.block_block_id_seq OWNED BY public.block_block.id;
            public       dbmasteruser    false    228            �            1259    16717    block_chain    TABLE     �   CREATE TABLE public.block_chain (
    id integer NOT NULL,
    time_stamp timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.block_chain;
       public         dbmasteruser    false    3            �            1259    16715    block_chain_id_seq    SEQUENCE     �   CREATE SEQUENCE public.block_chain_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.block_chain_id_seq;
       public       dbmasteruser    false    3    231            4           0    0    block_chain_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.block_chain_id_seq OWNED BY public.block_chain.id;
            public       dbmasteruser    false    230            �            1259    16725 
   block_peer    TABLE     �   CREATE TABLE public.block_peer (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(255) NOT NULL
);
    DROP TABLE public.block_peer;
       public         dbmasteruser    false    3            �            1259    16723    block_peer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.block_peer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.block_peer_id_seq;
       public       dbmasteruser    false    3    233            5           0    0    block_peer_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.block_peer_id_seq OWNED BY public.block_peer.id;
            public       dbmasteruser    false    232            �            1259    16738    block_transactions    TABLE       CREATE TABLE public.block_transactions (
    id integer NOT NULL,
    sender character varying(200) NOT NULL,
    receiver character varying(200) NOT NULL,
    amount integer NOT NULL,
    time_stamp timestamp with time zone NOT NULL,
    added_to_block boolean NOT NULL
);
 &   DROP TABLE public.block_transactions;
       public         dbmasteruser    false    3            �            1259    16736    block_transactions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.block_transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.block_transactions_id_seq;
       public       dbmasteruser    false    235    3            6           0    0    block_transactions_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.block_transactions_id_seq OWNED BY public.block_transactions.id;
            public       dbmasteruser    false    234            �            1259    16677    contract_contract    TABLE       CREATE TABLE public.contract_contract (
    contract_id integer NOT NULL,
    name text,
    date date,
    all_signed boolean NOT NULL,
    pdf character varying(100),
    counter_signe_id integer,
    first_auth_signe_id integer,
    second_auth_signe_id integer,
    counter_signed boolean NOT NULL,
    first_auth_signed boolean NOT NULL,
    second_auth_signed boolean NOT NULL,
    counter_signed_timestamp timestamp with time zone,
    first_auth_signed_timestamp timestamp with time zone,
    second_auth_signed_timestamp timestamp with time zone,
    class_id_sponte integer,
    class_name_sponte text,
    closing_date_sponte text,
    contract_free_class_id_sponte integer,
    contract_id_sponte integer,
    contract_number_sponte text,
    contract_type_id integer,
    contractor_sponte text,
    course_id_sponte text,
    course_name_sponte text,
    date_of_registration_sponte text,
    end_date_sponte text,
    financial_launched_sponte text,
    initial_date_sponte text,
    name_of_curricular_matrix_sponte text,
    situation_id_sponte integer,
    situation_sponte text,
    student_id_sponte integer,
    student_name_sponte text,
    type_of_registration_sponte integer,
    counter_auth_hash character varying(255),
    first_auth_hash character varying(255),
    second_auth_hash character varying(255),
    chain_id integer,
    terms_of_contract character varying(100),
    slm text,
    email_sent boolean NOT NULL,
    student_name text,
    sent_date timestamp with time zone,
    terms_of_contract_2 character varying(100)
);
 %   DROP TABLE public.contract_contract;
       public         dbmasteruser    false    3            �            1259    16675 !   contract_contract_contract_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contract_contract_contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.contract_contract_contract_id_seq;
       public       dbmasteruser    false    3    227            7           0    0 !   contract_contract_contract_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.contract_contract_contract_id_seq OWNED BY public.contract_contract.contract_id;
            public       dbmasteruser    false    226                       1259    17274    dashboard_userdashboardmodule    TABLE        CREATE TABLE public.dashboard_userdashboardmodule (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    module character varying(255) NOT NULL,
    app_label character varying(255),
    "user" integer NOT NULL,
    "column" integer NOT NULL,
    "order" integer NOT NULL,
    settings text NOT NULL,
    children text NOT NULL,
    collapsed boolean NOT NULL,
    CONSTRAINT dashboard_userdashboardmodule_column_check CHECK (("column" >= 0)),
    CONSTRAINT dashboard_userdashboardmodule_user_check CHECK (("user" >= 0))
);
 1   DROP TABLE public.dashboard_userdashboardmodule;
       public         dbmasteruser    false    3                       1259    17272 $   dashboard_userdashboardmodule_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dashboard_userdashboardmodule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.dashboard_userdashboardmodule_id_seq;
       public       dbmasteruser    false    264    3            8           0    0 $   dashboard_userdashboardmodule_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.dashboard_userdashboardmodule_id_seq OWNED BY public.dashboard_userdashboardmodule.id;
            public       dbmasteruser    false    263            �            1259    16970    data_wizard_identifier    TABLE     �  CREATE TABLE public.data_wizard_identifier (
    id integer NOT NULL,
    serializer character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    field character varying(255),
    value character varying(255),
    attr_id integer,
    resolved boolean NOT NULL,
    attr_field character varying(255),
    CONSTRAINT data_wizard_identifier_attr_id_check CHECK ((attr_id >= 0))
);
 *   DROP TABLE public.data_wizard_identifier;
       public         dbmasteruser    false    3            �            1259    16968    data_wizard_identifier_id_seq    SEQUENCE     �   CREATE SEQUENCE public.data_wizard_identifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.data_wizard_identifier_id_seq;
       public       dbmasteruser    false    3    250            9           0    0    data_wizard_identifier_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.data_wizard_identifier_id_seq OWNED BY public.data_wizard_identifier.id;
            public       dbmasteruser    false    249            �            1259    16982    data_wizard_range    TABLE     l  CREATE TABLE public.data_wizard_range (
    id integer NOT NULL,
    type character varying(10) NOT NULL,
    header_col integer NOT NULL,
    start_col integer NOT NULL,
    end_col integer,
    header_row integer NOT NULL,
    start_row integer NOT NULL,
    end_row integer,
    count integer,
    identifier_id integer NOT NULL,
    run_id integer NOT NULL
);
 %   DROP TABLE public.data_wizard_range;
       public         dbmasteruser    false    3            �            1259    16980    data_wizard_range_id_seq    SEQUENCE     �   CREATE SEQUENCE public.data_wizard_range_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.data_wizard_range_id_seq;
       public       dbmasteruser    false    3    252            :           0    0    data_wizard_range_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.data_wizard_range_id_seq OWNED BY public.data_wizard_range.id;
            public       dbmasteruser    false    251            �            1259    16990    data_wizard_record    TABLE     s  CREATE TABLE public.data_wizard_record (
    id integer NOT NULL,
    object_id integer,
    "row" integer NOT NULL,
    success boolean NOT NULL,
    fail_reason text,
    content_type_id integer,
    run_id integer NOT NULL,
    CONSTRAINT data_wizard_record_object_id_check CHECK ((object_id >= 0)),
    CONSTRAINT data_wizard_record_row_check CHECK (("row" >= 0))
);
 &   DROP TABLE public.data_wizard_record;
       public         dbmasteruser    false    3            �            1259    16988    data_wizard_record_id_seq    SEQUENCE     �   CREATE SEQUENCE public.data_wizard_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.data_wizard_record_id_seq;
       public       dbmasteruser    false    3    254            ;           0    0    data_wizard_record_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.data_wizard_record_id_seq OWNED BY public.data_wizard_record.id;
            public       dbmasteruser    false    253                        1259    17003    data_wizard_run    TABLE     @  CREATE TABLE public.data_wizard_run (
    id integer NOT NULL,
    record_count integer,
    loader character varying(255),
    serializer character varying(255),
    object_id integer,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT data_wizard_run_object_id_check CHECK ((object_id >= 0))
);
 #   DROP TABLE public.data_wizard_run;
       public         dbmasteruser    false    3            �            1259    17001    data_wizard_run_id_seq    SEQUENCE     �   CREATE SEQUENCE public.data_wizard_run_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.data_wizard_run_id_seq;
       public       dbmasteruser    false    3    256            <           0    0    data_wizard_run_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.data_wizard_run_id_seq OWNED BY public.data_wizard_run.id;
            public       dbmasteruser    false    255                       1259    17015    data_wizard_runlog    TABLE     �   CREATE TABLE public.data_wizard_runlog (
    id integer NOT NULL,
    event character varying(100) NOT NULL,
    date timestamp with time zone NOT NULL,
    run_id integer NOT NULL
);
 &   DROP TABLE public.data_wizard_runlog;
       public         dbmasteruser    false    3                       1259    17013    data_wizard_runlog_id_seq    SEQUENCE     �   CREATE SEQUENCE public.data_wizard_runlog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.data_wizard_runlog_id_seq;
       public       dbmasteruser    false    3    258            =           0    0    data_wizard_runlog_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.data_wizard_runlog_id_seq OWNED BY public.data_wizard_runlog.id;
            public       dbmasteruser    false    257            �            1259    16533    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         dbmasteruser    false    3            �            1259    16531    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       dbmasteruser    false    213    3            >           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       dbmasteruser    false    212            �            1259    16419    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         dbmasteruser    false    3            �            1259    16417    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       dbmasteruser    false    3    199            ?           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       dbmasteruser    false    198            �            1259    16408    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         dbmasteruser    false    3            �            1259    16406    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       dbmasteruser    false    3    197            @           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       dbmasteruser    false    196            �            1259    16957    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         dbmasteruser    false    3            
           1259    17287    jet_bookmark    TABLE       CREATE TABLE public.jet_bookmark (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    "user" integer NOT NULL,
    date_add timestamp with time zone NOT NULL,
    CONSTRAINT jet_bookmark_user_check CHECK (("user" >= 0))
);
     DROP TABLE public.jet_bookmark;
       public         dbmasteruser    false    3            	           1259    17285    jet_bookmark_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jet_bookmark_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.jet_bookmark_id_seq;
       public       dbmasteruser    false    3    266            A           0    0    jet_bookmark_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.jet_bookmark_id_seq OWNED BY public.jet_bookmark.id;
            public       dbmasteruser    false    265                       1259    17349    jet_django_token    TABLE     �   CREATE TABLE public.jet_django_token (
    id integer NOT NULL,
    project character varying(30) NOT NULL,
    token uuid NOT NULL,
    date_add timestamp with time zone NOT NULL
);
 $   DROP TABLE public.jet_django_token;
       public         dbmasteruser    false    3                       1259    17347    jet_django_token_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jet_django_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jet_django_token_id_seq;
       public       dbmasteruser    false    3    270            B           0    0    jet_django_token_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.jet_django_token_id_seq OWNED BY public.jet_django_token.id;
            public       dbmasteruser    false    269                       1259    17296    jet_pinnedapplication    TABLE     
  CREATE TABLE public.jet_pinnedapplication (
    id integer NOT NULL,
    app_label character varying(255) NOT NULL,
    "user" integer NOT NULL,
    date_add timestamp with time zone NOT NULL,
    CONSTRAINT jet_pinnedapplication_user_check CHECK (("user" >= 0))
);
 )   DROP TABLE public.jet_pinnedapplication;
       public         dbmasteruser    false    3                       1259    17294    jet_pinnedapplication_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jet_pinnedapplication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.jet_pinnedapplication_id_seq;
       public       dbmasteruser    false    3    268            C           0    0    jet_pinnedapplication_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.jet_pinnedapplication_id_seq OWNED BY public.jet_pinnedapplication.id;
            public       dbmasteruser    false    267            �            1259    16793    school_class    TABLE     �   CREATE TABLE public.school_class (
    class_id integer NOT NULL,
    class_name text NOT NULL,
    class_unit character varying(500),
    enrollment_class_year integer NOT NULL,
    slm text
);
     DROP TABLE public.school_class;
       public         dbmasteruser    false    3            �            1259    16791    school_class_class_id_seq    SEQUENCE     �   CREATE SEQUENCE public.school_class_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.school_class_class_id_seq;
       public       dbmasteruser    false    3    237            D           0    0    school_class_class_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.school_class_class_id_seq OWNED BY public.school_class.class_id;
            public       dbmasteruser    false    236            �            1259    16804    school_class_students    TABLE     �   CREATE TABLE public.school_class_students (
    id integer NOT NULL,
    class_id integer NOT NULL,
    student_id integer NOT NULL
);
 )   DROP TABLE public.school_class_students;
       public         dbmasteruser    false    3            �            1259    16802    school_class_students_id_seq    SEQUENCE     �   CREATE SEQUENCE public.school_class_students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.school_class_students_id_seq;
       public       dbmasteruser    false    239    3            E           0    0    school_class_students_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.school_class_students_id_seq OWNED BY public.school_class_students.id;
            public       dbmasteruser    false    238            �            1259    16812    school_class_teachers    TABLE     �   CREATE TABLE public.school_class_teachers (
    id integer NOT NULL,
    class_id integer NOT NULL,
    teacher_id integer NOT NULL
);
 )   DROP TABLE public.school_class_teachers;
       public         dbmasteruser    false    3            �            1259    16810    school_class_teachers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.school_class_teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.school_class_teachers_id_seq;
       public       dbmasteruser    false    3    241            F           0    0    school_class_teachers_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.school_class_teachers_id_seq OWNED BY public.school_class_teachers.id;
            public       dbmasteruser    false    240            �            1259    16820    school_school    TABLE     5  CREATE TABLE public.school_school (
    school_id integer NOT NULL,
    school_name text NOT NULL,
    head_id integer,
    city text,
    country text,
    sponte_client_number integer,
    state text,
    adminorsupervisor_id integer,
    sponte_token text,
    tell_me_school_id text,
    app_name text
);
 !   DROP TABLE public.school_school;
       public         dbmasteruser    false    3            �            1259    16831    school_school_chains    TABLE     �   CREATE TABLE public.school_school_chains (
    id integer NOT NULL,
    school_id integer NOT NULL,
    chain_id integer NOT NULL
);
 (   DROP TABLE public.school_school_chains;
       public         dbmasteruser    false    3            �            1259    16829    school_school_chains_id_seq    SEQUENCE     �   CREATE SEQUENCE public.school_school_chains_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.school_school_chains_id_seq;
       public       dbmasteruser    false    245    3            G           0    0    school_school_chains_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.school_school_chains_id_seq OWNED BY public.school_school_chains.id;
            public       dbmasteruser    false    244            �            1259    16839    school_school_classes    TABLE     �   CREATE TABLE public.school_school_classes (
    id integer NOT NULL,
    school_id integer NOT NULL,
    class_id integer NOT NULL
);
 )   DROP TABLE public.school_school_classes;
       public         dbmasteruser    false    3            �            1259    16837    school_school_classes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.school_school_classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.school_school_classes_id_seq;
       public       dbmasteruser    false    3    247            H           0    0    school_school_classes_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.school_school_classes_id_seq OWNED BY public.school_school_classes.id;
            public       dbmasteruser    false    246                       1259    17500    school_school_parents    TABLE     �   CREATE TABLE public.school_school_parents (
    id integer NOT NULL,
    school_id integer NOT NULL,
    parent_id integer NOT NULL
);
 )   DROP TABLE public.school_school_parents;
       public         dbmasteruser    false    3                       1259    17498    school_school_parents_id_seq    SEQUENCE     �   CREATE SEQUENCE public.school_school_parents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.school_school_parents_id_seq;
       public       dbmasteruser    false    3    276            I           0    0    school_school_parents_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.school_school_parents_id_seq OWNED BY public.school_school_parents.id;
            public       dbmasteruser    false    275            �            1259    16818    school_school_school_id_seq    SEQUENCE     �   CREATE SEQUENCE public.school_school_school_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.school_school_school_id_seq;
       public       dbmasteruser    false    3    243            J           0    0    school_school_school_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.school_school_school_id_seq OWNED BY public.school_school.school_id;
            public       dbmasteruser    false    242                       1259    17440    school_school_students    TABLE     �   CREATE TABLE public.school_school_students (
    id integer NOT NULL,
    school_id integer NOT NULL,
    student_id integer NOT NULL
);
 *   DROP TABLE public.school_school_students;
       public         dbmasteruser    false    3                       1259    17438    school_school_students_id_seq    SEQUENCE     �   CREATE SEQUENCE public.school_school_students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.school_school_students_id_seq;
       public       dbmasteruser    false    272    3            K           0    0    school_school_students_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.school_school_students_id_seq OWNED BY public.school_school_students.id;
            public       dbmasteruser    false    271                       1259    17448    school_school_teachers    TABLE     �   CREATE TABLE public.school_school_teachers (
    id integer NOT NULL,
    school_id integer NOT NULL,
    teacher_id integer NOT NULL
);
 *   DROP TABLE public.school_school_teachers;
       public         dbmasteruser    false    3                       1259    17446    school_school_teachers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.school_school_teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.school_school_teachers_id_seq;
       public       dbmasteruser    false    274    3            L           0    0    school_school_teachers_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.school_school_teachers_id_seq OWNED BY public.school_school_teachers.id;
            public       dbmasteruser    false    273            �            1259    16563    school_users_admin    TABLE     �   CREATE TABLE public.school_users_admin (
    admin_id integer NOT NULL,
    name character varying(750),
    profile_id integer,
    tell_me_user_id integer
);
 &   DROP TABLE public.school_users_admin;
       public         dbmasteruser    false    3            �            1259    16561    school_users_admin_admin_id_seq    SEQUENCE     �   CREATE SEQUENCE public.school_users_admin_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.school_users_admin_admin_id_seq;
       public       dbmasteruser    false    215    3            M           0    0    school_users_admin_admin_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.school_users_admin_admin_id_seq OWNED BY public.school_users_admin.admin_id;
            public       dbmasteruser    false    214            �            1259    16574    school_users_head    TABLE     �   CREATE TABLE public.school_users_head (
    head_id integer NOT NULL,
    name character varying(750),
    profile_id integer,
    tell_me_user_id integer
);
 %   DROP TABLE public.school_users_head;
       public         dbmasteruser    false    3            �            1259    16572    school_users_head_head_id_seq    SEQUENCE     �   CREATE SEQUENCE public.school_users_head_head_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.school_users_head_head_id_seq;
       public       dbmasteruser    false    217    3            N           0    0    school_users_head_head_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.school_users_head_head_id_seq OWNED BY public.school_users_head.head_id;
            public       dbmasteruser    false    216            �            1259    16585    school_users_parent    TABLE     G  CREATE TABLE public.school_users_parent (
    parent_id integer NOT NULL,
    name character varying(750),
    authorised boolean NOT NULL,
    profile_id integer,
    relationship text,
    address_number_sponte text,
    address_sponte text,
    bithday_sponte text,
    cell_phone_sponte text,
    cep_sponte text,
    city_sponte text,
    cpf_or_cnpj_sponte text,
    gender_sponte text,
    kind_of_person text,
    neighborhood_sponte text,
    note_sponte text,
    responsible_id_sponte integer,
    rg_sponte text,
    telephone_sponte text,
    tell_me_user_id integer
);
 '   DROP TABLE public.school_users_parent;
       public         dbmasteruser    false    3            �            1259    16583 !   school_users_parent_parent_id_seq    SEQUENCE     �   CREATE SEQUENCE public.school_users_parent_parent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.school_users_parent_parent_id_seq;
       public       dbmasteruser    false    3    219            O           0    0 !   school_users_parent_parent_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.school_users_parent_parent_id_seq OWNED BY public.school_users_parent.parent_id;
            public       dbmasteruser    false    218            �            1259    16596    school_users_student    TABLE     �  CREATE TABLE public.school_users_student (
    student_id integer NOT NULL,
    name character varying(750),
    profile_id integer,
    first_parent_id integer,
    second_parent_id integer,
    "RA_sponte" text,
    address_number_sponte text,
    address_sponte text,
    bithday_sponte text,
    cell_phone_sponte text,
    cep_sponte text,
    city_sponte text,
    course_of_interest_sponte text,
    cpf_sponte text,
    current_class_id text,
    didatic_responsible_id_sponte integer,
    financial_responsible_id_sponte integer,
    gender_sponte text,
    hometown_sponte text,
    midia_sponte text,
    neighborhood_sponte text,
    note_sponte text,
    origin_sponte text,
    original_name_sponte text,
    overdue_sponte text,
    register_date_sponte text,
    registration_number_sponte text,
    rg_sponte text,
    situation_sponte text,
    student_id_sponte integer,
    telephone_sponte text,
    tell_me_user_id integer
);
 (   DROP TABLE public.school_users_student;
       public         dbmasteruser    false    3            �            1259    16594 #   school_users_student_student_id_seq    SEQUENCE     �   CREATE SEQUENCE public.school_users_student_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.school_users_student_student_id_seq;
       public       dbmasteruser    false    221    3            P           0    0 #   school_users_student_student_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.school_users_student_student_id_seq OWNED BY public.school_users_student.student_id;
            public       dbmasteruser    false    220            �            1259    16607    school_users_supervisor    TABLE     �   CREATE TABLE public.school_users_supervisor (
    supervisor_id integer NOT NULL,
    name character varying(750),
    profile_id integer,
    tell_me_user_id integer
);
 +   DROP TABLE public.school_users_supervisor;
       public         dbmasteruser    false    3            �            1259    16605 )   school_users_supervisor_supervisor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.school_users_supervisor_supervisor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.school_users_supervisor_supervisor_id_seq;
       public       dbmasteruser    false    3    223            Q           0    0 )   school_users_supervisor_supervisor_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.school_users_supervisor_supervisor_id_seq OWNED BY public.school_users_supervisor.supervisor_id;
            public       dbmasteruser    false    222            �            1259    16618    school_users_teacher    TABLE       CREATE TABLE public.school_users_teacher (
    teacher_id integer NOT NULL,
    name character varying(750),
    profile_id integer,
    add_on_address_sponte text,
    address_number_sponte text,
    address_sponte text,
    admission_date_sponte text,
    bithday_sponte text,
    cell_phone_sponte text,
    cep_sponte text,
    city_sponte text,
    cpf_sponte text,
    employee_id_sponte integer,
    gender_sponte text,
    hometown_sponte text,
    job_role_sponte text,
    maritial_status_sponte text,
    neighborhood_sponte text,
    note_sponte text,
    pis_sponte text,
    registration_number_spontet text,
    resignation_date_sponte text,
    rg_sponte text,
    situation_sponte text,
    telephone_sponte text,
    work_register_booklet text,
    tell_me_user_id integer
);
 (   DROP TABLE public.school_users_teacher;
       public         dbmasteruser    false    3            �            1259    16616 #   school_users_teacher_teacher_id_seq    SEQUENCE     �   CREATE SEQUENCE public.school_users_teacher_teacher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.school_users_teacher_teacher_id_seq;
       public       dbmasteruser    false    3    225            R           0    0 #   school_users_teacher_teacher_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.school_users_teacher_teacher_id_seq OWNED BY public.school_users_teacher.teacher_id;
            public       dbmasteruser    false    224                       1259    17071    sources_filesource    TABLE     �   CREATE TABLE public.sources_filesource (
    id integer NOT NULL,
    name character varying(255),
    file character varying(100) NOT NULL,
    date timestamp with time zone NOT NULL
);
 &   DROP TABLE public.sources_filesource;
       public         dbmasteruser    false    3                       1259    17069    sources_filesource_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sources_filesource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.sources_filesource_id_seq;
       public       dbmasteruser    false    3    260            S           0    0    sources_filesource_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.sources_filesource_id_seq OWNED BY public.sources_filesource.id;
            public       dbmasteruser    false    259                       1259    17079    sources_urlsource    TABLE     �   CREATE TABLE public.sources_urlsource (
    id integer NOT NULL,
    name character varying(255),
    url character varying(200) NOT NULL,
    date timestamp with time zone NOT NULL
);
 %   DROP TABLE public.sources_urlsource;
       public         dbmasteruser    false    3                       1259    17077    sources_urlsource_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sources_urlsource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.sources_urlsource_id_seq;
       public       dbmasteruser    false    262    3            T           0    0    sources_urlsource_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.sources_urlsource_id_seq OWNED BY public.sources_urlsource.id;
            public       dbmasteruser    false    261            U           2604    16440    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    203    202    203            V           2604    16450    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    204    205    205            T           2604    16432    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    201    200    201            W           2604    16458    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    207    206    207            X           2604    16468    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    208    209    209            Y           2604    16476    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    211    210    211            c           2604    16709    block_block id    DEFAULT     p   ALTER TABLE ONLY public.block_block ALTER COLUMN id SET DEFAULT nextval('public.block_block_id_seq'::regclass);
 =   ALTER TABLE public.block_block ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    228    229    229            d           2604    16720    block_chain id    DEFAULT     p   ALTER TABLE ONLY public.block_chain ALTER COLUMN id SET DEFAULT nextval('public.block_chain_id_seq'::regclass);
 =   ALTER TABLE public.block_chain ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    230    231    231            e           2604    16728    block_peer id    DEFAULT     n   ALTER TABLE ONLY public.block_peer ALTER COLUMN id SET DEFAULT nextval('public.block_peer_id_seq'::regclass);
 <   ALTER TABLE public.block_peer ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    233    232    233            f           2604    16741    block_transactions id    DEFAULT     ~   ALTER TABLE ONLY public.block_transactions ALTER COLUMN id SET DEFAULT nextval('public.block_transactions_id_seq'::regclass);
 D   ALTER TABLE public.block_transactions ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    235    234    235            b           2604    16680    contract_contract contract_id    DEFAULT     �   ALTER TABLE ONLY public.contract_contract ALTER COLUMN contract_id SET DEFAULT nextval('public.contract_contract_contract_id_seq'::regclass);
 L   ALTER TABLE public.contract_contract ALTER COLUMN contract_id DROP DEFAULT;
       public       dbmasteruser    false    226    227    227            x           2604    17277     dashboard_userdashboardmodule id    DEFAULT     �   ALTER TABLE ONLY public.dashboard_userdashboardmodule ALTER COLUMN id SET DEFAULT nextval('public.dashboard_userdashboardmodule_id_seq'::regclass);
 O   ALTER TABLE public.dashboard_userdashboardmodule ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    264    263    264            m           2604    16973    data_wizard_identifier id    DEFAULT     �   ALTER TABLE ONLY public.data_wizard_identifier ALTER COLUMN id SET DEFAULT nextval('public.data_wizard_identifier_id_seq'::regclass);
 H   ALTER TABLE public.data_wizard_identifier ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    250    249    250            o           2604    16985    data_wizard_range id    DEFAULT     |   ALTER TABLE ONLY public.data_wizard_range ALTER COLUMN id SET DEFAULT nextval('public.data_wizard_range_id_seq'::regclass);
 C   ALTER TABLE public.data_wizard_range ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    252    251    252            p           2604    16993    data_wizard_record id    DEFAULT     ~   ALTER TABLE ONLY public.data_wizard_record ALTER COLUMN id SET DEFAULT nextval('public.data_wizard_record_id_seq'::regclass);
 D   ALTER TABLE public.data_wizard_record ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    254    253    254            s           2604    17006    data_wizard_run id    DEFAULT     x   ALTER TABLE ONLY public.data_wizard_run ALTER COLUMN id SET DEFAULT nextval('public.data_wizard_run_id_seq'::regclass);
 A   ALTER TABLE public.data_wizard_run ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    256    255    256            u           2604    17018    data_wizard_runlog id    DEFAULT     ~   ALTER TABLE ONLY public.data_wizard_runlog ALTER COLUMN id SET DEFAULT nextval('public.data_wizard_runlog_id_seq'::regclass);
 D   ALTER TABLE public.data_wizard_runlog ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    257    258    258            Z           2604    16536    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    212    213    213            S           2604    16422    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    198    199    199            R           2604    16411    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    197    196    197            {           2604    17290    jet_bookmark id    DEFAULT     r   ALTER TABLE ONLY public.jet_bookmark ALTER COLUMN id SET DEFAULT nextval('public.jet_bookmark_id_seq'::regclass);
 >   ALTER TABLE public.jet_bookmark ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    266    265    266                       2604    17352    jet_django_token id    DEFAULT     z   ALTER TABLE ONLY public.jet_django_token ALTER COLUMN id SET DEFAULT nextval('public.jet_django_token_id_seq'::regclass);
 B   ALTER TABLE public.jet_django_token ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    270    269    270            }           2604    17299    jet_pinnedapplication id    DEFAULT     �   ALTER TABLE ONLY public.jet_pinnedapplication ALTER COLUMN id SET DEFAULT nextval('public.jet_pinnedapplication_id_seq'::regclass);
 G   ALTER TABLE public.jet_pinnedapplication ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    268    267    268            g           2604    16796    school_class class_id    DEFAULT     ~   ALTER TABLE ONLY public.school_class ALTER COLUMN class_id SET DEFAULT nextval('public.school_class_class_id_seq'::regclass);
 D   ALTER TABLE public.school_class ALTER COLUMN class_id DROP DEFAULT;
       public       dbmasteruser    false    236    237    237            h           2604    16807    school_class_students id    DEFAULT     �   ALTER TABLE ONLY public.school_class_students ALTER COLUMN id SET DEFAULT nextval('public.school_class_students_id_seq'::regclass);
 G   ALTER TABLE public.school_class_students ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    239    238    239            i           2604    16815    school_class_teachers id    DEFAULT     �   ALTER TABLE ONLY public.school_class_teachers ALTER COLUMN id SET DEFAULT nextval('public.school_class_teachers_id_seq'::regclass);
 G   ALTER TABLE public.school_class_teachers ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    240    241    241            j           2604    16823    school_school school_id    DEFAULT     �   ALTER TABLE ONLY public.school_school ALTER COLUMN school_id SET DEFAULT nextval('public.school_school_school_id_seq'::regclass);
 F   ALTER TABLE public.school_school ALTER COLUMN school_id DROP DEFAULT;
       public       dbmasteruser    false    242    243    243            k           2604    16834    school_school_chains id    DEFAULT     �   ALTER TABLE ONLY public.school_school_chains ALTER COLUMN id SET DEFAULT nextval('public.school_school_chains_id_seq'::regclass);
 F   ALTER TABLE public.school_school_chains ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    244    245    245            l           2604    16842    school_school_classes id    DEFAULT     �   ALTER TABLE ONLY public.school_school_classes ALTER COLUMN id SET DEFAULT nextval('public.school_school_classes_id_seq'::regclass);
 G   ALTER TABLE public.school_school_classes ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    246    247    247            �           2604    17503    school_school_parents id    DEFAULT     �   ALTER TABLE ONLY public.school_school_parents ALTER COLUMN id SET DEFAULT nextval('public.school_school_parents_id_seq'::regclass);
 G   ALTER TABLE public.school_school_parents ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    275    276    276            �           2604    17443    school_school_students id    DEFAULT     �   ALTER TABLE ONLY public.school_school_students ALTER COLUMN id SET DEFAULT nextval('public.school_school_students_id_seq'::regclass);
 H   ALTER TABLE public.school_school_students ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    272    271    272            �           2604    17451    school_school_teachers id    DEFAULT     �   ALTER TABLE ONLY public.school_school_teachers ALTER COLUMN id SET DEFAULT nextval('public.school_school_teachers_id_seq'::regclass);
 H   ALTER TABLE public.school_school_teachers ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    274    273    274            \           2604    16566    school_users_admin admin_id    DEFAULT     �   ALTER TABLE ONLY public.school_users_admin ALTER COLUMN admin_id SET DEFAULT nextval('public.school_users_admin_admin_id_seq'::regclass);
 J   ALTER TABLE public.school_users_admin ALTER COLUMN admin_id DROP DEFAULT;
       public       dbmasteruser    false    214    215    215            ]           2604    16577    school_users_head head_id    DEFAULT     �   ALTER TABLE ONLY public.school_users_head ALTER COLUMN head_id SET DEFAULT nextval('public.school_users_head_head_id_seq'::regclass);
 H   ALTER TABLE public.school_users_head ALTER COLUMN head_id DROP DEFAULT;
       public       dbmasteruser    false    217    216    217            ^           2604    16588    school_users_parent parent_id    DEFAULT     �   ALTER TABLE ONLY public.school_users_parent ALTER COLUMN parent_id SET DEFAULT nextval('public.school_users_parent_parent_id_seq'::regclass);
 L   ALTER TABLE public.school_users_parent ALTER COLUMN parent_id DROP DEFAULT;
       public       dbmasteruser    false    219    218    219            _           2604    16599    school_users_student student_id    DEFAULT     �   ALTER TABLE ONLY public.school_users_student ALTER COLUMN student_id SET DEFAULT nextval('public.school_users_student_student_id_seq'::regclass);
 N   ALTER TABLE public.school_users_student ALTER COLUMN student_id DROP DEFAULT;
       public       dbmasteruser    false    220    221    221            `           2604    16610 %   school_users_supervisor supervisor_id    DEFAULT     �   ALTER TABLE ONLY public.school_users_supervisor ALTER COLUMN supervisor_id SET DEFAULT nextval('public.school_users_supervisor_supervisor_id_seq'::regclass);
 T   ALTER TABLE public.school_users_supervisor ALTER COLUMN supervisor_id DROP DEFAULT;
       public       dbmasteruser    false    223    222    223            a           2604    16621    school_users_teacher teacher_id    DEFAULT     �   ALTER TABLE ONLY public.school_users_teacher ALTER COLUMN teacher_id SET DEFAULT nextval('public.school_users_teacher_teacher_id_seq'::regclass);
 N   ALTER TABLE public.school_users_teacher ALTER COLUMN teacher_id DROP DEFAULT;
       public       dbmasteruser    false    224    225    225            v           2604    17074    sources_filesource id    DEFAULT     ~   ALTER TABLE ONLY public.sources_filesource ALTER COLUMN id SET DEFAULT nextval('public.sources_filesource_id_seq'::regclass);
 D   ALTER TABLE public.sources_filesource ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    260    259    260            w           2604    17082    sources_urlsource id    DEFAULT     |   ALTER TABLE ONLY public.sources_urlsource ALTER COLUMN id SET DEFAULT nextval('public.sources_urlsource_id_seq'::regclass);
 C   ALTER TABLE public.sources_urlsource ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    262    261    262            �          0    16437 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       dbmasteruser    false    203   =      �          0    16447    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       dbmasteruser    false    205   /=      �          0    16429    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       dbmasteruser    false    201   L=      �          0    16455 	   auth_user 
   TABLE DATA               �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       dbmasteruser    false    207   �A      �          0    16465    auth_user_groups 
   TABLE DATA               A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public       dbmasteruser    false    209   ��      �          0    16473    auth_user_user_permissions 
   TABLE DATA               P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       dbmasteruser    false    211   ��      �          0    16706    block_block 
   TABLE DATA               u   COPY public.block_block (index, id, time_stamp, data, hash, previous_hash, nonce, chain_id, contract_id) FROM stdin;
    public       dbmasteruser    false    229   ��      �          0    16717    block_chain 
   TABLE DATA               ;   COPY public.block_chain (id, time_stamp, name) FROM stdin;
    public       dbmasteruser    false    231   �0      �          0    16725 
   block_peer 
   TABLE DATA               7   COPY public.block_peer (id, name, address) FROM stdin;
    public       dbmasteruser    false    233   �3      �          0    16738    block_transactions 
   TABLE DATA               f   COPY public.block_transactions (id, sender, receiver, amount, time_stamp, added_to_block) FROM stdin;
    public       dbmasteruser    false    235   �3      �          0    16677    contract_contract 
   TABLE DATA               k  COPY public.contract_contract (contract_id, name, date, all_signed, pdf, counter_signe_id, first_auth_signe_id, second_auth_signe_id, counter_signed, first_auth_signed, second_auth_signed, counter_signed_timestamp, first_auth_signed_timestamp, second_auth_signed_timestamp, class_id_sponte, class_name_sponte, closing_date_sponte, contract_free_class_id_sponte, contract_id_sponte, contract_number_sponte, contract_type_id, contractor_sponte, course_id_sponte, course_name_sponte, date_of_registration_sponte, end_date_sponte, financial_launched_sponte, initial_date_sponte, name_of_curricular_matrix_sponte, situation_id_sponte, situation_sponte, student_id_sponte, student_name_sponte, type_of_registration_sponte, counter_auth_hash, first_auth_hash, second_auth_hash, chain_id, terms_of_contract, slm, email_sent, student_name, sent_date, terms_of_contract_2) FROM stdin;
    public       dbmasteruser    false    227   �3                0    17274    dashboard_userdashboardmodule 
   TABLE DATA               �   COPY public.dashboard_userdashboardmodule (id, title, module, app_label, "user", "column", "order", settings, children, collapsed) FROM stdin;
    public       dbmasteruser    false    264   �T      	          0    16970    data_wizard_identifier 
   TABLE DATA               s   COPY public.data_wizard_identifier (id, serializer, name, field, value, attr_id, resolved, attr_field) FROM stdin;
    public       dbmasteruser    false    250   yV                0    16982    data_wizard_range 
   TABLE DATA               �   COPY public.data_wizard_range (id, type, header_col, start_col, end_col, header_row, start_row, end_row, count, identifier_id, run_id) FROM stdin;
    public       dbmasteruser    false    252   0]                0    16990    data_wizard_record 
   TABLE DATA               q   COPY public.data_wizard_record (id, object_id, "row", success, fail_reason, content_type_id, run_id) FROM stdin;
    public       dbmasteruser    false    254   \`                0    17003    data_wizard_run 
   TABLE DATA               t   COPY public.data_wizard_run (id, record_count, loader, serializer, object_id, content_type_id, user_id) FROM stdin;
    public       dbmasteruser    false    256   е                0    17015    data_wizard_runlog 
   TABLE DATA               E   COPY public.data_wizard_runlog (id, event, date, run_id) FROM stdin;
    public       dbmasteruser    false    258   ��      �          0    16533    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       dbmasteruser    false    213   �      �          0    16419    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       dbmasteruser    false    199   ��      �          0    16408    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       dbmasteruser    false    197   F�                0    16957    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       dbmasteruser    false    248   ��                0    17287    jet_bookmark 
   TABLE DATA               H   COPY public.jet_bookmark (id, url, title, "user", date_add) FROM stdin;
    public       dbmasteruser    false    266   �                0    17349    jet_django_token 
   TABLE DATA               H   COPY public.jet_django_token (id, project, token, date_add) FROM stdin;
    public       dbmasteruser    false    270   u�                0    17296    jet_pinnedapplication 
   TABLE DATA               P   COPY public.jet_pinnedapplication (id, app_label, "user", date_add) FROM stdin;
    public       dbmasteruser    false    268   ��      �          0    16793    school_class 
   TABLE DATA               d   COPY public.school_class (class_id, class_name, class_unit, enrollment_class_year, slm) FROM stdin;
    public       dbmasteruser    false    237   �      �          0    16804    school_class_students 
   TABLE DATA               I   COPY public.school_class_students (id, class_id, student_id) FROM stdin;
    public       dbmasteruser    false    239   `�                 0    16812    school_class_teachers 
   TABLE DATA               I   COPY public.school_class_teachers (id, class_id, teacher_id) FROM stdin;
    public       dbmasteruser    false    241   ��                0    16820    school_school 
   TABLE DATA               �   COPY public.school_school (school_id, school_name, head_id, city, country, sponte_client_number, state, adminorsupervisor_id, sponte_token, tell_me_school_id, app_name) FROM stdin;
    public       dbmasteruser    false    243   �                0    16831    school_school_chains 
   TABLE DATA               G   COPY public.school_school_chains (id, school_id, chain_id) FROM stdin;
    public       dbmasteruser    false    245   ~�                0    16839    school_school_classes 
   TABLE DATA               H   COPY public.school_school_classes (id, school_id, class_id) FROM stdin;
    public       dbmasteruser    false    247   ��      #          0    17500    school_school_parents 
   TABLE DATA               I   COPY public.school_school_parents (id, school_id, parent_id) FROM stdin;
    public       dbmasteruser    false    276   n�                0    17440    school_school_students 
   TABLE DATA               K   COPY public.school_school_students (id, school_id, student_id) FROM stdin;
    public       dbmasteruser    false    272   ��      !          0    17448    school_school_teachers 
   TABLE DATA               K   COPY public.school_school_teachers (id, school_id, teacher_id) FROM stdin;
    public       dbmasteruser    false    274   �      �          0    16563    school_users_admin 
   TABLE DATA               Y   COPY public.school_users_admin (admin_id, name, profile_id, tell_me_user_id) FROM stdin;
    public       dbmasteruser    false    215   G�      �          0    16574    school_users_head 
   TABLE DATA               W   COPY public.school_users_head (head_id, name, profile_id, tell_me_user_id) FROM stdin;
    public       dbmasteruser    false    217   y�      �          0    16585    school_users_parent 
   TABLE DATA               a  COPY public.school_users_parent (parent_id, name, authorised, profile_id, relationship, address_number_sponte, address_sponte, bithday_sponte, cell_phone_sponte, cep_sponte, city_sponte, cpf_or_cnpj_sponte, gender_sponte, kind_of_person, neighborhood_sponte, note_sponte, responsible_id_sponte, rg_sponte, telephone_sponte, tell_me_user_id) FROM stdin;
    public       dbmasteruser    false    219   W�      �          0    16596    school_users_student 
   TABLE DATA               b  COPY public.school_users_student (student_id, name, profile_id, first_parent_id, second_parent_id, "RA_sponte", address_number_sponte, address_sponte, bithday_sponte, cell_phone_sponte, cep_sponte, city_sponte, course_of_interest_sponte, cpf_sponte, current_class_id, didatic_responsible_id_sponte, financial_responsible_id_sponte, gender_sponte, hometown_sponte, midia_sponte, neighborhood_sponte, note_sponte, origin_sponte, original_name_sponte, overdue_sponte, register_date_sponte, registration_number_sponte, rg_sponte, situation_sponte, student_id_sponte, telephone_sponte, tell_me_user_id) FROM stdin;
    public       dbmasteruser    false    221   ��      �          0    16607    school_users_supervisor 
   TABLE DATA               c   COPY public.school_users_supervisor (supervisor_id, name, profile_id, tell_me_user_id) FROM stdin;
    public       dbmasteruser    false    223   Z8      �          0    16618    school_users_teacher 
   TABLE DATA                 COPY public.school_users_teacher (teacher_id, name, profile_id, add_on_address_sponte, address_number_sponte, address_sponte, admission_date_sponte, bithday_sponte, cell_phone_sponte, cep_sponte, city_sponte, cpf_sponte, employee_id_sponte, gender_sponte, hometown_sponte, job_role_sponte, maritial_status_sponte, neighborhood_sponte, note_sponte, pis_sponte, registration_number_spontet, resignation_date_sponte, rg_sponte, situation_sponte, telephone_sponte, work_register_booklet, tell_me_user_id) FROM stdin;
    public       dbmasteruser    false    225   �8                0    17071    sources_filesource 
   TABLE DATA               B   COPY public.sources_filesource (id, name, file, date) FROM stdin;
    public       dbmasteruser    false    260   $l                0    17079    sources_urlsource 
   TABLE DATA               @   COPY public.sources_urlsource (id, name, url, date) FROM stdin;
    public       dbmasteruser    false    262   m      U           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       dbmasteruser    false    202            V           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       dbmasteruser    false    204            W           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 120, true);
            public       dbmasteruser    false    200            X           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
            public       dbmasteruser    false    208            Y           0    0    auth_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.auth_user_id_seq', 1162, true);
            public       dbmasteruser    false    206            Z           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, true);
            public       dbmasteruser    false    210            [           0    0    block_block_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.block_block_id_seq', 298, true);
            public       dbmasteruser    false    228            \           0    0    block_chain_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.block_chain_id_seq', 24, true);
            public       dbmasteruser    false    230            ]           0    0    block_peer_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.block_peer_id_seq', 1, false);
            public       dbmasteruser    false    232            ^           0    0    block_transactions_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.block_transactions_id_seq', 1, false);
            public       dbmasteruser    false    234            _           0    0 !   contract_contract_contract_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.contract_contract_contract_id_seq', 108, true);
            public       dbmasteruser    false    226            `           0    0 $   dashboard_userdashboardmodule_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.dashboard_userdashboardmodule_id_seq', 20, true);
            public       dbmasteruser    false    263            a           0    0    data_wizard_identifier_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.data_wizard_identifier_id_seq', 144, true);
            public       dbmasteruser    false    249            b           0    0    data_wizard_range_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.data_wizard_range_id_seq', 212, true);
            public       dbmasteruser    false    251            c           0    0    data_wizard_record_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.data_wizard_record_id_seq', 3311, true);
            public       dbmasteruser    false    253            d           0    0    data_wizard_run_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.data_wizard_run_id_seq', 17, true);
            public       dbmasteruser    false    255            e           0    0    data_wizard_runlog_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.data_wizard_runlog_id_seq', 172, true);
            public       dbmasteruser    false    257            f           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 66, true);
            public       dbmasteruser    false    212            g           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 37, true);
            public       dbmasteruser    false    198            h           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 75, true);
            public       dbmasteruser    false    196            i           0    0    jet_bookmark_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.jet_bookmark_id_seq', 1, true);
            public       dbmasteruser    false    265            j           0    0    jet_django_token_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.jet_django_token_id_seq', 1, true);
            public       dbmasteruser    false    269            k           0    0    jet_pinnedapplication_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.jet_pinnedapplication_id_seq', 1, true);
            public       dbmasteruser    false    267            l           0    0    school_class_class_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.school_class_class_id_seq', 24, true);
            public       dbmasteruser    false    236            m           0    0    school_class_students_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.school_class_students_id_seq', 51, true);
            public       dbmasteruser    false    238            n           0    0    school_class_teachers_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.school_class_teachers_id_seq', 14, true);
            public       dbmasteruser    false    240            o           0    0    school_school_chains_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.school_school_chains_id_seq', 24, true);
            public       dbmasteruser    false    244            p           0    0    school_school_classes_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.school_school_classes_id_seq', 24, true);
            public       dbmasteruser    false    246            q           0    0    school_school_parents_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.school_school_parents_id_seq', 1, false);
            public       dbmasteruser    false    275            r           0    0    school_school_school_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.school_school_school_id_seq', 19, true);
            public       dbmasteruser    false    242            s           0    0    school_school_students_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.school_school_students_id_seq', 1235, true);
            public       dbmasteruser    false    271            t           0    0    school_school_teachers_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.school_school_teachers_id_seq', 6, true);
            public       dbmasteruser    false    273            u           0    0    school_users_admin_admin_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.school_users_admin_admin_id_seq', 1, true);
            public       dbmasteruser    false    214            v           0    0    school_users_head_head_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.school_users_head_head_id_seq', 15, true);
            public       dbmasteruser    false    216            w           0    0 !   school_users_parent_parent_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.school_users_parent_parent_id_seq', 1085, true);
            public       dbmasteruser    false    218            x           0    0 #   school_users_student_student_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.school_users_student_student_id_seq', 1212, true);
            public       dbmasteruser    false    220            y           0    0 )   school_users_supervisor_supervisor_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.school_users_supervisor_supervisor_id_seq', 8, true);
            public       dbmasteruser    false    222            z           0    0 #   school_users_teacher_teacher_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.school_users_teacher_teacher_id_seq', 147, true);
            public       dbmasteruser    false    224            {           0    0    sources_filesource_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.sources_filesource_id_seq', 4, true);
            public       dbmasteruser    false    259            |           0    0    sources_urlsource_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sources_urlsource_id_seq', 1, true);
            public       dbmasteruser    false    261            �           2606    16444    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         dbmasteruser    false    203            �           2606    16499 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         dbmasteruser    false    205    205            �           2606    16452 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         dbmasteruser    false    205            �           2606    16442    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         dbmasteruser    false    203            �           2606    16485 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         dbmasteruser    false    201    201            �           2606    16434 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         dbmasteruser    false    201            �           2606    16470 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         dbmasteruser    false    209            �           2606    16514 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public         dbmasteruser    false    209    209            �           2606    16460    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         dbmasteruser    false    207            �           2606    16478 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         dbmasteruser    false    211            �           2606    16528 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public         dbmasteruser    false    211    211            �           2606    16556     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         dbmasteruser    false    207            �           2606    16714    block_block block_block_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.block_block
    ADD CONSTRAINT block_block_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.block_block DROP CONSTRAINT block_block_pkey;
       public         dbmasteruser    false    229            �           2606    16722    block_chain block_chain_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.block_chain
    ADD CONSTRAINT block_chain_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.block_chain DROP CONSTRAINT block_chain_pkey;
       public         dbmasteruser    false    231            �           2606    16735 !   block_peer block_peer_address_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.block_peer
    ADD CONSTRAINT block_peer_address_key UNIQUE (address);
 K   ALTER TABLE ONLY public.block_peer DROP CONSTRAINT block_peer_address_key;
       public         dbmasteruser    false    233            �           2606    16733    block_peer block_peer_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.block_peer
    ADD CONSTRAINT block_peer_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.block_peer DROP CONSTRAINT block_peer_pkey;
       public         dbmasteruser    false    233            �           2606    16743 *   block_transactions block_transactions_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.block_transactions
    ADD CONSTRAINT block_transactions_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.block_transactions DROP CONSTRAINT block_transactions_pkey;
       public         dbmasteruser    false    235            �           2606    16685 (   contract_contract contract_contract_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.contract_contract
    ADD CONSTRAINT contract_contract_pkey PRIMARY KEY (contract_id);
 R   ALTER TABLE ONLY public.contract_contract DROP CONSTRAINT contract_contract_pkey;
       public         dbmasteruser    false    227                       2606    17284 @   dashboard_userdashboardmodule dashboard_userdashboardmodule_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.dashboard_userdashboardmodule
    ADD CONSTRAINT dashboard_userdashboardmodule_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.dashboard_userdashboardmodule DROP CONSTRAINT dashboard_userdashboardmodule_pkey;
       public         dbmasteruser    false    264            �           2606    16979 2   data_wizard_identifier data_wizard_identifier_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.data_wizard_identifier
    ADD CONSTRAINT data_wizard_identifier_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.data_wizard_identifier DROP CONSTRAINT data_wizard_identifier_pkey;
       public         dbmasteruser    false    250                       2606    16987 (   data_wizard_range data_wizard_range_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.data_wizard_range
    ADD CONSTRAINT data_wizard_range_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.data_wizard_range DROP CONSTRAINT data_wizard_range_pkey;
       public         dbmasteruser    false    252                       2606    17000 *   data_wizard_record data_wizard_record_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.data_wizard_record
    ADD CONSTRAINT data_wizard_record_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.data_wizard_record DROP CONSTRAINT data_wizard_record_pkey;
       public         dbmasteruser    false    254            	           2606    17012 $   data_wizard_run data_wizard_run_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.data_wizard_run
    ADD CONSTRAINT data_wizard_run_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.data_wizard_run DROP CONSTRAINT data_wizard_run_pkey;
       public         dbmasteruser    false    256                       2606    17020 *   data_wizard_runlog data_wizard_runlog_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.data_wizard_runlog
    ADD CONSTRAINT data_wizard_runlog_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.data_wizard_runlog DROP CONSTRAINT data_wizard_runlog_pkey;
       public         dbmasteruser    false    258            �           2606    16542 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         dbmasteruser    false    213            �           2606    16426 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         dbmasteruser    false    199    199            �           2606    16424 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         dbmasteruser    false    199            �           2606    16416 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         dbmasteruser    false    197            �           2606    16964 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         dbmasteruser    false    248                       2606    17293    jet_bookmark jet_bookmark_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.jet_bookmark
    ADD CONSTRAINT jet_bookmark_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.jet_bookmark DROP CONSTRAINT jet_bookmark_pkey;
       public         dbmasteruser    false    266                       2606    17354 &   jet_django_token jet_django_token_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jet_django_token
    ADD CONSTRAINT jet_django_token_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jet_django_token DROP CONSTRAINT jet_django_token_pkey;
       public         dbmasteruser    false    270                       2606    17302 0   jet_pinnedapplication jet_pinnedapplication_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.jet_pinnedapplication
    ADD CONSTRAINT jet_pinnedapplication_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.jet_pinnedapplication DROP CONSTRAINT jet_pinnedapplication_pkey;
       public         dbmasteruser    false    268            �           2606    16801    school_class school_class_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.school_class
    ADD CONSTRAINT school_class_pkey PRIMARY KEY (class_id);
 H   ALTER TABLE ONLY public.school_class DROP CONSTRAINT school_class_pkey;
       public         dbmasteruser    false    237            �           2606    16856 M   school_class_students school_class_students_class_id_student_id_d02cfeb2_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.school_class_students
    ADD CONSTRAINT school_class_students_class_id_student_id_d02cfeb2_uniq UNIQUE (class_id, student_id);
 w   ALTER TABLE ONLY public.school_class_students DROP CONSTRAINT school_class_students_class_id_student_id_d02cfeb2_uniq;
       public         dbmasteruser    false    239    239            �           2606    16809 0   school_class_students school_class_students_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.school_class_students
    ADD CONSTRAINT school_class_students_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.school_class_students DROP CONSTRAINT school_class_students_pkey;
       public         dbmasteruser    false    239            �           2606    16870 M   school_class_teachers school_class_teachers_class_id_teacher_id_d6f20c8b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.school_class_teachers
    ADD CONSTRAINT school_class_teachers_class_id_teacher_id_d6f20c8b_uniq UNIQUE (class_id, teacher_id);
 w   ALTER TABLE ONLY public.school_class_teachers DROP CONSTRAINT school_class_teachers_class_id_teacher_id_d6f20c8b_uniq;
       public         dbmasteruser    false    241    241            �           2606    16817 0   school_class_teachers school_class_teachers_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.school_class_teachers
    ADD CONSTRAINT school_class_teachers_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.school_class_teachers DROP CONSTRAINT school_class_teachers_pkey;
       public         dbmasteruser    false    241            �           2606    16836 .   school_school_chains school_school_chains_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.school_school_chains
    ADD CONSTRAINT school_school_chains_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.school_school_chains DROP CONSTRAINT school_school_chains_pkey;
       public         dbmasteruser    false    245            �           2606    16890 J   school_school_chains school_school_chains_school_id_chain_id_1980388f_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.school_school_chains
    ADD CONSTRAINT school_school_chains_school_id_chain_id_1980388f_uniq UNIQUE (school_id, chain_id);
 t   ALTER TABLE ONLY public.school_school_chains DROP CONSTRAINT school_school_chains_school_id_chain_id_1980388f_uniq;
       public         dbmasteruser    false    245    245            �           2606    16844 0   school_school_classes school_school_classes_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.school_school_classes
    ADD CONSTRAINT school_school_classes_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.school_school_classes DROP CONSTRAINT school_school_classes_pkey;
       public         dbmasteruser    false    247            �           2606    16904 L   school_school_classes school_school_classes_school_id_class_id_10abb699_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.school_school_classes
    ADD CONSTRAINT school_school_classes_school_id_class_id_10abb699_uniq UNIQUE (school_id, class_id);
 v   ALTER TABLE ONLY public.school_school_classes DROP CONSTRAINT school_school_classes_school_id_class_id_10abb699_uniq;
       public         dbmasteruser    false    247    247            (           2606    17505 0   school_school_parents school_school_parents_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.school_school_parents
    ADD CONSTRAINT school_school_parents_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.school_school_parents DROP CONSTRAINT school_school_parents_pkey;
       public         dbmasteruser    false    276            +           2606    17517 M   school_school_parents school_school_parents_school_id_parent_id_86902fda_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.school_school_parents
    ADD CONSTRAINT school_school_parents_school_id_parent_id_86902fda_uniq UNIQUE (school_id, parent_id);
 w   ALTER TABLE ONLY public.school_school_parents DROP CONSTRAINT school_school_parents_school_id_parent_id_86902fda_uniq;
       public         dbmasteruser    false    276    276            �           2606    16828     school_school school_school_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.school_school
    ADD CONSTRAINT school_school_pkey PRIMARY KEY (school_id);
 J   ALTER TABLE ONLY public.school_school DROP CONSTRAINT school_school_pkey;
       public         dbmasteruser    false    243                       2606    17445 2   school_school_students school_school_students_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.school_school_students
    ADD CONSTRAINT school_school_students_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.school_school_students DROP CONSTRAINT school_school_students_pkey;
       public         dbmasteruser    false    272                       2606    17465 P   school_school_students school_school_students_school_id_student_id_494d2d60_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.school_school_students
    ADD CONSTRAINT school_school_students_school_id_student_id_494d2d60_uniq UNIQUE (school_id, student_id);
 z   ALTER TABLE ONLY public.school_school_students DROP CONSTRAINT school_school_students_school_id_student_id_494d2d60_uniq;
       public         dbmasteruser    false    272    272            !           2606    17453 2   school_school_teachers school_school_teachers_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.school_school_teachers
    ADD CONSTRAINT school_school_teachers_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.school_school_teachers DROP CONSTRAINT school_school_teachers_pkey;
       public         dbmasteruser    false    274            $           2606    17479 P   school_school_teachers school_school_teachers_school_id_teacher_id_f232f5e5_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.school_school_teachers
    ADD CONSTRAINT school_school_teachers_school_id_teacher_id_f232f5e5_uniq UNIQUE (school_id, teacher_id);
 z   ALTER TABLE ONLY public.school_school_teachers DROP CONSTRAINT school_school_teachers_school_id_teacher_id_f232f5e5_uniq;
       public         dbmasteruser    false    274    274            �           2606    16571 *   school_users_admin school_users_admin_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.school_users_admin
    ADD CONSTRAINT school_users_admin_pkey PRIMARY KEY (admin_id);
 T   ALTER TABLE ONLY public.school_users_admin DROP CONSTRAINT school_users_admin_pkey;
       public         dbmasteruser    false    215            �           2606    16916 >   school_users_admin school_users_admin_profile_id_63c45b75_uniq 
   CONSTRAINT        ALTER TABLE ONLY public.school_users_admin
    ADD CONSTRAINT school_users_admin_profile_id_63c45b75_uniq UNIQUE (profile_id);
 h   ALTER TABLE ONLY public.school_users_admin DROP CONSTRAINT school_users_admin_profile_id_63c45b75_uniq;
       public         dbmasteruser    false    215            �           2606    16582 (   school_users_head school_users_head_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.school_users_head
    ADD CONSTRAINT school_users_head_pkey PRIMARY KEY (head_id);
 R   ALTER TABLE ONLY public.school_users_head DROP CONSTRAINT school_users_head_pkey;
       public         dbmasteruser    false    217            �           2606    16923 <   school_users_head school_users_head_profile_id_1d5b9e68_uniq 
   CONSTRAINT     }   ALTER TABLE ONLY public.school_users_head
    ADD CONSTRAINT school_users_head_profile_id_1d5b9e68_uniq UNIQUE (profile_id);
 f   ALTER TABLE ONLY public.school_users_head DROP CONSTRAINT school_users_head_profile_id_1d5b9e68_uniq;
       public         dbmasteruser    false    217            �           2606    16593 ,   school_users_parent school_users_parent_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.school_users_parent
    ADD CONSTRAINT school_users_parent_pkey PRIMARY KEY (parent_id);
 V   ALTER TABLE ONLY public.school_users_parent DROP CONSTRAINT school_users_parent_pkey;
       public         dbmasteruser    false    219            �           2606    16930 @   school_users_parent school_users_parent_profile_id_2f551006_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.school_users_parent
    ADD CONSTRAINT school_users_parent_profile_id_2f551006_uniq UNIQUE (profile_id);
 j   ALTER TABLE ONLY public.school_users_parent DROP CONSTRAINT school_users_parent_profile_id_2f551006_uniq;
       public         dbmasteruser    false    219            �           2606    16604 .   school_users_student school_users_student_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.school_users_student
    ADD CONSTRAINT school_users_student_pkey PRIMARY KEY (student_id);
 X   ALTER TABLE ONLY public.school_users_student DROP CONSTRAINT school_users_student_pkey;
       public         dbmasteruser    false    221            �           2606    16937 B   school_users_student school_users_student_profile_id_79899508_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.school_users_student
    ADD CONSTRAINT school_users_student_profile_id_79899508_uniq UNIQUE (profile_id);
 l   ALTER TABLE ONLY public.school_users_student DROP CONSTRAINT school_users_student_profile_id_79899508_uniq;
       public         dbmasteruser    false    221            �           2606    16615 4   school_users_supervisor school_users_supervisor_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.school_users_supervisor
    ADD CONSTRAINT school_users_supervisor_pkey PRIMARY KEY (supervisor_id);
 ^   ALTER TABLE ONLY public.school_users_supervisor DROP CONSTRAINT school_users_supervisor_pkey;
       public         dbmasteruser    false    223            �           2606    16944 H   school_users_supervisor school_users_supervisor_profile_id_ff81a803_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.school_users_supervisor
    ADD CONSTRAINT school_users_supervisor_profile_id_ff81a803_uniq UNIQUE (profile_id);
 r   ALTER TABLE ONLY public.school_users_supervisor DROP CONSTRAINT school_users_supervisor_profile_id_ff81a803_uniq;
       public         dbmasteruser    false    223            �           2606    16626 .   school_users_teacher school_users_teacher_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.school_users_teacher
    ADD CONSTRAINT school_users_teacher_pkey PRIMARY KEY (teacher_id);
 X   ALTER TABLE ONLY public.school_users_teacher DROP CONSTRAINT school_users_teacher_pkey;
       public         dbmasteruser    false    225            �           2606    16951 B   school_users_teacher school_users_teacher_profile_id_1c32fe9e_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.school_users_teacher
    ADD CONSTRAINT school_users_teacher_profile_id_1c32fe9e_uniq UNIQUE (profile_id);
 l   ALTER TABLE ONLY public.school_users_teacher DROP CONSTRAINT school_users_teacher_profile_id_1c32fe9e_uniq;
       public         dbmasteruser    false    225                       2606    17076 *   sources_filesource sources_filesource_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.sources_filesource
    ADD CONSTRAINT sources_filesource_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.sources_filesource DROP CONSTRAINT sources_filesource_pkey;
       public         dbmasteruser    false    260                       2606    17084 (   sources_urlsource sources_urlsource_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.sources_urlsource
    ADD CONSTRAINT sources_urlsource_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.sources_urlsource DROP CONSTRAINT sources_urlsource_pkey;
       public         dbmasteruser    false    262            �           1259    16487    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         dbmasteruser    false    203            �           1259    16500 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         dbmasteruser    false    205            �           1259    16501 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         dbmasteruser    false    205            �           1259    16486 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         dbmasteruser    false    201            �           1259    16516 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public         dbmasteruser    false    209            �           1259    16515 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public         dbmasteruser    false    209            �           1259    16530 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public         dbmasteruser    false    211            �           1259    16529 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public         dbmasteruser    false    211            �           1259    16557     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         dbmasteruser    false    207            �           1259    16745    block_block_chain_id_c6a27d9f    INDEX     Y   CREATE INDEX block_block_chain_id_c6a27d9f ON public.block_block USING btree (chain_id);
 1   DROP INDEX public.block_block_chain_id_c6a27d9f;
       public         dbmasteruser    false    229            �           1259    16751     block_block_contract_id_aee9622f    INDEX     _   CREATE INDEX block_block_contract_id_aee9622f ON public.block_block USING btree (contract_id);
 4   DROP INDEX public.block_block_contract_id_aee9622f;
       public         dbmasteruser    false    229            �           1259    16744     block_peer_address_0a2790a1_like    INDEX     n   CREATE INDEX block_peer_address_0a2790a1_like ON public.block_peer USING btree (address varchar_pattern_ops);
 4   DROP INDEX public.block_peer_address_0a2790a1_like;
       public         dbmasteruser    false    233            �           1259    17266 #   contract_contract_chain_id_c4fbc2de    INDEX     e   CREATE INDEX contract_contract_chain_id_c4fbc2de ON public.contract_contract USING btree (chain_id);
 7   DROP INDEX public.contract_contract_chain_id_c4fbc2de;
       public         dbmasteruser    false    227            �           1259    17107 +   contract_contract_counter_signe_id_7fd8d63d    INDEX     u   CREATE INDEX contract_contract_counter_signe_id_7fd8d63d ON public.contract_contract USING btree (counter_signe_id);
 ?   DROP INDEX public.contract_contract_counter_signe_id_7fd8d63d;
       public         dbmasteruser    false    227            �           1259    17113 .   contract_contract_first_auth_signe_id_54114955    INDEX     {   CREATE INDEX contract_contract_first_auth_signe_id_54114955 ON public.contract_contract USING btree (first_auth_signe_id);
 B   DROP INDEX public.contract_contract_first_auth_signe_id_54114955;
       public         dbmasteruser    false    227            �           1259    17119 /   contract_contract_second_auth_signe_id_6bdf03a9    INDEX     }   CREATE INDEX contract_contract_second_auth_signe_id_6bdf03a9 ON public.contract_contract USING btree (second_auth_signe_id);
 C   DROP INDEX public.contract_contract_second_auth_signe_id_6bdf03a9;
       public         dbmasteruser    false    227            �           1259    17026 (   data_wizard_range_identifier_id_95d321ae    INDEX     o   CREATE INDEX data_wizard_range_identifier_id_95d321ae ON public.data_wizard_range USING btree (identifier_id);
 <   DROP INDEX public.data_wizard_range_identifier_id_95d321ae;
       public         dbmasteruser    false    252                       1259    17063 !   data_wizard_range_run_id_9710f2b9    INDEX     a   CREATE INDEX data_wizard_range_run_id_9710f2b9 ON public.data_wizard_range USING btree (run_id);
 5   DROP INDEX public.data_wizard_range_run_id_9710f2b9;
       public         dbmasteruser    false    252                       1259    17032 +   data_wizard_record_content_type_id_f2a3c06c    INDEX     u   CREATE INDEX data_wizard_record_content_type_id_f2a3c06c ON public.data_wizard_record USING btree (content_type_id);
 ?   DROP INDEX public.data_wizard_record_content_type_id_f2a3c06c;
       public         dbmasteruser    false    254                       1259    17057 "   data_wizard_record_run_id_fac342f0    INDEX     c   CREATE INDEX data_wizard_record_run_id_fac342f0 ON public.data_wizard_record USING btree (run_id);
 6   DROP INDEX public.data_wizard_record_run_id_fac342f0;
       public         dbmasteruser    false    254                       1259    17048 (   data_wizard_run_content_type_id_70de43ee    INDEX     o   CREATE INDEX data_wizard_run_content_type_id_70de43ee ON public.data_wizard_run USING btree (content_type_id);
 <   DROP INDEX public.data_wizard_run_content_type_id_70de43ee;
       public         dbmasteruser    false    256            
           1259    17050     data_wizard_run_user_id_c1617f52    INDEX     _   CREATE INDEX data_wizard_run_user_id_c1617f52 ON public.data_wizard_run USING btree (user_id);
 4   DROP INDEX public.data_wizard_run_user_id_c1617f52;
       public         dbmasteruser    false    256                       1259    17056 "   data_wizard_runlog_run_id_4614c618    INDEX     c   CREATE INDEX data_wizard_runlog_run_id_4614c618 ON public.data_wizard_runlog USING btree (run_id);
 6   DROP INDEX public.data_wizard_runlog_run_id_4614c618;
       public         dbmasteruser    false    258            �           1259    16553 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         dbmasteruser    false    213            �           1259    16554 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         dbmasteruser    false    213            �           1259    16966 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         dbmasteruser    false    248            �           1259    16965 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         dbmasteruser    false    248            �           1259    16857 '   school_class_students_class_id_8f6f64de    INDEX     m   CREATE INDEX school_class_students_class_id_8f6f64de ON public.school_class_students USING btree (class_id);
 ;   DROP INDEX public.school_class_students_class_id_8f6f64de;
       public         dbmasteruser    false    239            �           1259    16858 )   school_class_students_student_id_4d3556b2    INDEX     q   CREATE INDEX school_class_students_student_id_4d3556b2 ON public.school_class_students USING btree (student_id);
 =   DROP INDEX public.school_class_students_student_id_4d3556b2;
       public         dbmasteruser    false    239            �           1259    16871 '   school_class_teachers_class_id_348acaea    INDEX     m   CREATE INDEX school_class_teachers_class_id_348acaea ON public.school_class_teachers USING btree (class_id);
 ;   DROP INDEX public.school_class_teachers_class_id_348acaea;
       public         dbmasteruser    false    241            �           1259    16872 )   school_class_teachers_teacher_id_444b6861    INDEX     q   CREATE INDEX school_class_teachers_teacher_id_444b6861 ON public.school_class_teachers USING btree (teacher_id);
 =   DROP INDEX public.school_class_teachers_teacher_id_444b6861;
       public         dbmasteruser    false    241            �           1259    17396 +   school_school_adminorsupervisor_id_49840b13    INDEX     u   CREATE INDEX school_school_adminorsupervisor_id_49840b13 ON public.school_school USING btree (adminorsupervisor_id);
 ?   DROP INDEX public.school_school_adminorsupervisor_id_49840b13;
       public         dbmasteruser    false    243            �           1259    16892 &   school_school_chains_chain_id_1d7d2a2d    INDEX     k   CREATE INDEX school_school_chains_chain_id_1d7d2a2d ON public.school_school_chains USING btree (chain_id);
 :   DROP INDEX public.school_school_chains_chain_id_1d7d2a2d;
       public         dbmasteruser    false    245            �           1259    16891 '   school_school_chains_school_id_959d4273    INDEX     m   CREATE INDEX school_school_chains_school_id_959d4273 ON public.school_school_chains USING btree (school_id);
 ;   DROP INDEX public.school_school_chains_school_id_959d4273;
       public         dbmasteruser    false    245            �           1259    16906 '   school_school_classes_class_id_9366e2a1    INDEX     m   CREATE INDEX school_school_classes_class_id_9366e2a1 ON public.school_school_classes USING btree (class_id);
 ;   DROP INDEX public.school_school_classes_class_id_9366e2a1;
       public         dbmasteruser    false    247            �           1259    16905 (   school_school_classes_school_id_dbc35c01    INDEX     o   CREATE INDEX school_school_classes_school_id_dbc35c01 ON public.school_school_classes USING btree (school_id);
 <   DROP INDEX public.school_school_classes_school_id_dbc35c01;
       public         dbmasteruser    false    247            �           1259    16878    school_school_head_id_fa8cc5b4    INDEX     [   CREATE INDEX school_school_head_id_fa8cc5b4 ON public.school_school USING btree (head_id);
 2   DROP INDEX public.school_school_head_id_fa8cc5b4;
       public         dbmasteruser    false    243            &           1259    17519 (   school_school_parents_parent_id_f34599ba    INDEX     o   CREATE INDEX school_school_parents_parent_id_f34599ba ON public.school_school_parents USING btree (parent_id);
 <   DROP INDEX public.school_school_parents_parent_id_f34599ba;
       public         dbmasteruser    false    276            )           1259    17518 (   school_school_parents_school_id_113b4447    INDEX     o   CREATE INDEX school_school_parents_school_id_113b4447 ON public.school_school_parents USING btree (school_id);
 <   DROP INDEX public.school_school_parents_school_id_113b4447;
       public         dbmasteruser    false    276                       1259    17466 )   school_school_students_school_id_e95bbfe4    INDEX     q   CREATE INDEX school_school_students_school_id_e95bbfe4 ON public.school_school_students USING btree (school_id);
 =   DROP INDEX public.school_school_students_school_id_e95bbfe4;
       public         dbmasteruser    false    272                       1259    17467 *   school_school_students_student_id_61838cd1    INDEX     s   CREATE INDEX school_school_students_student_id_61838cd1 ON public.school_school_students USING btree (student_id);
 >   DROP INDEX public.school_school_students_student_id_61838cd1;
       public         dbmasteruser    false    272            "           1259    17480 )   school_school_teachers_school_id_d04b5901    INDEX     q   CREATE INDEX school_school_teachers_school_id_d04b5901 ON public.school_school_teachers USING btree (school_id);
 =   DROP INDEX public.school_school_teachers_school_id_d04b5901;
       public         dbmasteruser    false    274            %           1259    17481 *   school_school_teachers_teacher_id_4ab46e3c    INDEX     s   CREATE INDEX school_school_teachers_teacher_id_4ab46e3c ON public.school_school_teachers USING btree (teacher_id);
 >   DROP INDEX public.school_school_teachers_teacher_id_4ab46e3c;
       public         dbmasteruser    false    274            �           1259    17125 -   school_users_student_first_parent_id_acb7705a    INDEX     y   CREATE INDEX school_users_student_first_parent_id_acb7705a ON public.school_users_student USING btree (first_parent_id);
 A   DROP INDEX public.school_users_student_first_parent_id_acb7705a;
       public         dbmasteruser    false    221            �           1259    17131 .   school_users_student_second_parent_id_e515b80e    INDEX     {   CREATE INDEX school_users_student_second_parent_id_e515b80e ON public.school_users_student USING btree (second_parent_id);
 B   DROP INDEX public.school_users_student_second_parent_id_e515b80e;
       public         dbmasteruser    false    221            .           2606    16493 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       dbmasteruser    false    205    201    3981            -           2606    16488 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       dbmasteruser    false    203    205    3986            ,           2606    16479 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       dbmasteruser    false    3976    201    199            0           2606    16508 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       dbmasteruser    false    209    203    3986            /           2606    16503 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       dbmasteruser    false    3994    207    209            2           2606    16522 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       dbmasteruser    false    3981    211    201            1           2606    16517 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       dbmasteruser    false    211    3994    207            A           2606    16746 ;   block_block block_block_chain_id_c6a27d9f_fk_block_chain_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.block_block
    ADD CONSTRAINT block_block_chain_id_c6a27d9f_fk_block_chain_id FOREIGN KEY (chain_id) REFERENCES public.block_chain(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.block_block DROP CONSTRAINT block_block_chain_id_c6a27d9f_fk_block_chain_id;
       public       dbmasteruser    false    4051    231    229            B           2606    16752 9   block_block block_block_contract_id_aee9622f_fk_contract_    FK CONSTRAINT     �   ALTER TABLE ONLY public.block_block
    ADD CONSTRAINT block_block_contract_id_aee9622f_fk_contract_ FOREIGN KEY (contract_id) REFERENCES public.contract_contract(contract_id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.block_block DROP CONSTRAINT block_block_contract_id_aee9622f_fk_contract_;
       public       dbmasteruser    false    227    229    4044            @           2606    17542 G   contract_contract contract_contract_chain_id_c4fbc2de_fk_block_chain_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract_contract
    ADD CONSTRAINT contract_contract_chain_id_c4fbc2de_fk_block_chain_id FOREIGN KEY (chain_id) REFERENCES public.block_chain(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.contract_contract DROP CONSTRAINT contract_contract_chain_id_c4fbc2de_fk_block_chain_id;
       public       dbmasteruser    false    4051    227    231            ?           2606    17430 J   contract_contract contract_contract_counter_signe_id_7fd8d63d_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract_contract
    ADD CONSTRAINT contract_contract_counter_signe_id_7fd8d63d_fk_school_us FOREIGN KEY (counter_signe_id) REFERENCES public.school_users_head(head_id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.contract_contract DROP CONSTRAINT contract_contract_counter_signe_id_7fd8d63d_fk_school_us;
       public       dbmasteruser    false    217    4019    227            =           2606    17114 M   contract_contract contract_contract_first_auth_signe_id_54114955_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract_contract
    ADD CONSTRAINT contract_contract_first_auth_signe_id_54114955_fk_school_us FOREIGN KEY (first_auth_signe_id) REFERENCES public.school_users_parent(parent_id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.contract_contract DROP CONSTRAINT contract_contract_first_auth_signe_id_54114955_fk_school_us;
       public       dbmasteruser    false    227    219    4023            >           2606    17120 N   contract_contract contract_contract_second_auth_signe_id_6bdf03a9_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract_contract
    ADD CONSTRAINT contract_contract_second_auth_signe_id_6bdf03a9_fk_school_us FOREIGN KEY (second_auth_signe_id) REFERENCES public.school_users_parent(parent_id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.contract_contract DROP CONSTRAINT contract_contract_second_auth_signe_id_6bdf03a9_fk_school_us;
       public       dbmasteruser    false    227    4023    219            M           2606    17021 G   data_wizard_range data_wizard_range_identifier_id_95d321ae_fk_data_wiza    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_wizard_range
    ADD CONSTRAINT data_wizard_range_identifier_id_95d321ae_fk_data_wiza FOREIGN KEY (identifier_id) REFERENCES public.data_wizard_identifier(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.data_wizard_range DROP CONSTRAINT data_wizard_range_identifier_id_95d321ae_fk_data_wiza;
       public       dbmasteruser    false    4094    250    252            N           2606    17064 I   data_wizard_range data_wizard_range_run_id_9710f2b9_fk_data_wizard_run_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_wizard_range
    ADD CONSTRAINT data_wizard_range_run_id_9710f2b9_fk_data_wizard_run_id FOREIGN KEY (run_id) REFERENCES public.data_wizard_run(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.data_wizard_range DROP CONSTRAINT data_wizard_range_run_id_9710f2b9_fk_data_wizard_run_id;
       public       dbmasteruser    false    256    4105    252            O           2606    17027 K   data_wizard_record data_wizard_record_content_type_id_f2a3c06c_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_wizard_record
    ADD CONSTRAINT data_wizard_record_content_type_id_f2a3c06c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.data_wizard_record DROP CONSTRAINT data_wizard_record_content_type_id_f2a3c06c_fk_django_co;
       public       dbmasteruser    false    199    3976    254            P           2606    17058 K   data_wizard_record data_wizard_record_run_id_fac342f0_fk_data_wizard_run_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_wizard_record
    ADD CONSTRAINT data_wizard_record_run_id_fac342f0_fk_data_wizard_run_id FOREIGN KEY (run_id) REFERENCES public.data_wizard_run(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.data_wizard_record DROP CONSTRAINT data_wizard_record_run_id_fac342f0_fk_data_wizard_run_id;
       public       dbmasteruser    false    256    4105    254            Q           2606    17033 E   data_wizard_run data_wizard_run_content_type_id_70de43ee_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_wizard_run
    ADD CONSTRAINT data_wizard_run_content_type_id_70de43ee_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.data_wizard_run DROP CONSTRAINT data_wizard_run_content_type_id_70de43ee_fk_django_co;
       public       dbmasteruser    false    256    3976    199            R           2606    17043 @   data_wizard_run data_wizard_run_user_id_c1617f52_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_wizard_run
    ADD CONSTRAINT data_wizard_run_user_id_c1617f52_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.data_wizard_run DROP CONSTRAINT data_wizard_run_user_id_c1617f52_fk_auth_user_id;
       public       dbmasteruser    false    3994    256    207            S           2606    17051 K   data_wizard_runlog data_wizard_runlog_run_id_4614c618_fk_data_wizard_run_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_wizard_runlog
    ADD CONSTRAINT data_wizard_runlog_run_id_4614c618_fk_data_wizard_run_id FOREIGN KEY (run_id) REFERENCES public.data_wizard_run(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.data_wizard_runlog DROP CONSTRAINT data_wizard_runlog_run_id_4614c618_fk_data_wizard_run_id;
       public       dbmasteruser    false    4105    256    258            3           2606    16543 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       dbmasteruser    false    199    213    3976            4           2606    16548 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       dbmasteruser    false    213    207    3994            C           2606    16845 I   school_class_students school_class_student_class_id_8f6f64de_fk_school_cl    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_class_students
    ADD CONSTRAINT school_class_student_class_id_8f6f64de_fk_school_cl FOREIGN KEY (class_id) REFERENCES public.school_class(class_id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.school_class_students DROP CONSTRAINT school_class_student_class_id_8f6f64de_fk_school_cl;
       public       dbmasteruser    false    237    4060    239            D           2606    16850 K   school_class_students school_class_student_student_id_4d3556b2_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_class_students
    ADD CONSTRAINT school_class_student_student_id_4d3556b2_fk_school_us FOREIGN KEY (student_id) REFERENCES public.school_users_student(student_id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.school_class_students DROP CONSTRAINT school_class_student_student_id_4d3556b2_fk_school_us;
       public       dbmasteruser    false    239    221    4028            E           2606    16859 I   school_class_teachers school_class_teacher_class_id_348acaea_fk_school_cl    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_class_teachers
    ADD CONSTRAINT school_class_teacher_class_id_348acaea_fk_school_cl FOREIGN KEY (class_id) REFERENCES public.school_class(class_id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.school_class_teachers DROP CONSTRAINT school_class_teacher_class_id_348acaea_fk_school_cl;
       public       dbmasteruser    false    4060    237    241            F           2606    16864 K   school_class_teachers school_class_teacher_teacher_id_444b6861_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_class_teachers
    ADD CONSTRAINT school_class_teacher_teacher_id_444b6861_fk_school_us FOREIGN KEY (teacher_id) REFERENCES public.school_users_teacher(teacher_id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.school_class_teachers DROP CONSTRAINT school_class_teacher_teacher_id_444b6861_fk_school_us;
       public       dbmasteruser    false    241    4037    225            G           2606    17402 F   school_school school_school_adminorsupervisor_id_49840b13_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school
    ADD CONSTRAINT school_school_adminorsupervisor_id_49840b13_fk_school_us FOREIGN KEY (adminorsupervisor_id) REFERENCES public.school_users_supervisor(supervisor_id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.school_school DROP CONSTRAINT school_school_adminorsupervisor_id_49840b13_fk_school_us;
       public       dbmasteruser    false    243    223    4033            J           2606    16884 M   school_school_chains school_school_chains_chain_id_1d7d2a2d_fk_block_chain_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_chains
    ADD CONSTRAINT school_school_chains_chain_id_1d7d2a2d_fk_block_chain_id FOREIGN KEY (chain_id) REFERENCES public.block_chain(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.school_school_chains DROP CONSTRAINT school_school_chains_chain_id_1d7d2a2d_fk_block_chain_id;
       public       dbmasteruser    false    231    4051    245            I           2606    16879 I   school_school_chains school_school_chains_school_id_959d4273_fk_school_sc    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_chains
    ADD CONSTRAINT school_school_chains_school_id_959d4273_fk_school_sc FOREIGN KEY (school_id) REFERENCES public.school_school(school_id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.school_school_chains DROP CONSTRAINT school_school_chains_school_id_959d4273_fk_school_sc;
       public       dbmasteruser    false    245    243    4076            L           2606    16898 I   school_school_classes school_school_classe_class_id_9366e2a1_fk_school_cl    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_classes
    ADD CONSTRAINT school_school_classe_class_id_9366e2a1_fk_school_cl FOREIGN KEY (class_id) REFERENCES public.school_class(class_id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.school_school_classes DROP CONSTRAINT school_school_classe_class_id_9366e2a1_fk_school_cl;
       public       dbmasteruser    false    247    237    4060            K           2606    16893 J   school_school_classes school_school_classe_school_id_dbc35c01_fk_school_sc    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_classes
    ADD CONSTRAINT school_school_classe_school_id_dbc35c01_fk_school_sc FOREIGN KEY (school_id) REFERENCES public.school_school(school_id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.school_school_classes DROP CONSTRAINT school_school_classe_school_id_dbc35c01_fk_school_sc;
       public       dbmasteruser    false    4076    243    247            H           2606    17407 I   school_school school_school_head_id_fa8cc5b4_fk_school_users_head_head_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school
    ADD CONSTRAINT school_school_head_id_fa8cc5b4_fk_school_users_head_head_id FOREIGN KEY (head_id) REFERENCES public.school_users_head(head_id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.school_school DROP CONSTRAINT school_school_head_id_fa8cc5b4_fk_school_users_head_head_id;
       public       dbmasteruser    false    217    243    4019            Y           2606    17511 J   school_school_parents school_school_parent_parent_id_f34599ba_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_parents
    ADD CONSTRAINT school_school_parent_parent_id_f34599ba_fk_school_us FOREIGN KEY (parent_id) REFERENCES public.school_users_parent(parent_id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.school_school_parents DROP CONSTRAINT school_school_parent_parent_id_f34599ba_fk_school_us;
       public       dbmasteruser    false    219    4023    276            X           2606    17506 J   school_school_parents school_school_parent_school_id_113b4447_fk_school_sc    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_parents
    ADD CONSTRAINT school_school_parent_school_id_113b4447_fk_school_sc FOREIGN KEY (school_id) REFERENCES public.school_school(school_id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.school_school_parents DROP CONSTRAINT school_school_parent_school_id_113b4447_fk_school_sc;
       public       dbmasteruser    false    276    243    4076            T           2606    17454 K   school_school_students school_school_studen_school_id_e95bbfe4_fk_school_sc    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_students
    ADD CONSTRAINT school_school_studen_school_id_e95bbfe4_fk_school_sc FOREIGN KEY (school_id) REFERENCES public.school_school(school_id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.school_school_students DROP CONSTRAINT school_school_studen_school_id_e95bbfe4_fk_school_sc;
       public       dbmasteruser    false    4076    272    243            U           2606    17459 L   school_school_students school_school_studen_student_id_61838cd1_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_students
    ADD CONSTRAINT school_school_studen_student_id_61838cd1_fk_school_us FOREIGN KEY (student_id) REFERENCES public.school_users_student(student_id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.school_school_students DROP CONSTRAINT school_school_studen_student_id_61838cd1_fk_school_us;
       public       dbmasteruser    false    221    4028    272            V           2606    17468 K   school_school_teachers school_school_teache_school_id_d04b5901_fk_school_sc    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_teachers
    ADD CONSTRAINT school_school_teache_school_id_d04b5901_fk_school_sc FOREIGN KEY (school_id) REFERENCES public.school_school(school_id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.school_school_teachers DROP CONSTRAINT school_school_teache_school_id_d04b5901_fk_school_sc;
       public       dbmasteruser    false    4076    274    243            W           2606    17473 L   school_school_teachers school_school_teache_teacher_id_4ab46e3c_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_teachers
    ADD CONSTRAINT school_school_teache_teacher_id_4ab46e3c_fk_school_us FOREIGN KEY (teacher_id) REFERENCES public.school_users_teacher(teacher_id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.school_school_teachers DROP CONSTRAINT school_school_teache_teacher_id_4ab46e3c_fk_school_us;
       public       dbmasteruser    false    4037    274    225            5           2606    16917 I   school_users_admin school_users_admin_profile_id_63c45b75_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_users_admin
    ADD CONSTRAINT school_users_admin_profile_id_63c45b75_fk_auth_user_id FOREIGN KEY (profile_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.school_users_admin DROP CONSTRAINT school_users_admin_profile_id_63c45b75_fk_auth_user_id;
       public       dbmasteruser    false    3994    207    215            6           2606    16924 G   school_users_head school_users_head_profile_id_1d5b9e68_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_users_head
    ADD CONSTRAINT school_users_head_profile_id_1d5b9e68_fk_auth_user_id FOREIGN KEY (profile_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.school_users_head DROP CONSTRAINT school_users_head_profile_id_1d5b9e68_fk_auth_user_id;
       public       dbmasteruser    false    207    3994    217            7           2606    16931 K   school_users_parent school_users_parent_profile_id_2f551006_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_users_parent
    ADD CONSTRAINT school_users_parent_profile_id_2f551006_fk_auth_user_id FOREIGN KEY (profile_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.school_users_parent DROP CONSTRAINT school_users_parent_profile_id_2f551006_fk_auth_user_id;
       public       dbmasteruser    false    207    219    3994            9           2606    17487 O   school_users_student school_users_student_first_parent_id_acb7705a_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_users_student
    ADD CONSTRAINT school_users_student_first_parent_id_acb7705a_fk_school_us FOREIGN KEY (first_parent_id) REFERENCES public.school_users_parent(parent_id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.school_users_student DROP CONSTRAINT school_users_student_first_parent_id_acb7705a_fk_school_us;
       public       dbmasteruser    false    221    219    4023            8           2606    16938 M   school_users_student school_users_student_profile_id_79899508_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_users_student
    ADD CONSTRAINT school_users_student_profile_id_79899508_fk_auth_user_id FOREIGN KEY (profile_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.school_users_student DROP CONSTRAINT school_users_student_profile_id_79899508_fk_auth_user_id;
       public       dbmasteruser    false    207    3994    221            :           2606    17547 P   school_users_student school_users_student_second_parent_id_e515b80e_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_users_student
    ADD CONSTRAINT school_users_student_second_parent_id_e515b80e_fk_school_us FOREIGN KEY (second_parent_id) REFERENCES public.school_users_parent(parent_id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.school_users_student DROP CONSTRAINT school_users_student_second_parent_id_e515b80e_fk_school_us;
       public       dbmasteruser    false    221    4023    219            ;           2606    16945 S   school_users_supervisor school_users_supervisor_profile_id_ff81a803_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_users_supervisor
    ADD CONSTRAINT school_users_supervisor_profile_id_ff81a803_fk_auth_user_id FOREIGN KEY (profile_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.school_users_supervisor DROP CONSTRAINT school_users_supervisor_profile_id_ff81a803_fk_auth_user_id;
       public       dbmasteruser    false    207    223    3994            <           2606    16952 M   school_users_teacher school_users_teacher_profile_id_1c32fe9e_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_users_teacher
    ADD CONSTRAINT school_users_teacher_profile_id_1c32fe9e_fk_auth_user_id FOREIGN KEY (profile_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.school_users_teacher DROP CONSTRAINT school_users_teacher_profile_id_1c32fe9e_fk_auth_user_id;
       public       dbmasteruser    false    207    3994    225            �      xڋ���� � �      �      xڋ���� � �      �   e  x�m�ێ�0������ʱ����J+�)*�Y��o�Cl3������vq�~7ө��8��i[�]�B�7�����L��pI����͂�$`	����3X\�Jʞ��9��0O.i��k-΀�N��ϰ$P�W�hHШ�[R��̯�+@ <���q�t�iM��Br�� ��t���~q%��>+�����������r6��hL^���<m��N���w(���Ⳬ��I��oZ׎'}���"sG�\�fI���� �"��C:f�.�K��@�*!���qn�z������'-�_3B:Qvf 4PZ\�<L�W�}a\�y�5D���BD���L�ڃ�nT��fEiK���#Pٺ Utj]̐�2�Iq�4�ڴ[��Յ���/���8i�;���;H��Q*/�yPmiqs;6k��yC�Kc���!c|��<d�����yq����yt6j�|iL,�Q��BqE��,7ӗ��[��HM)ƾ:�;c�!��{��!��.�\jAH�ӛ�3�A�_�'�Dc���C��|"@������\�M;>�ʸ��$	�j&H �r1��x̊k��:�˰c�k�[A��2��K�(�]a���P��^؂)����@l`欃�c3�=,��q��
_�:/.��,+�b�lQ��h�fK�HE+G[�*R\��M{M6�N��g+��&s�݊�fɜr���E2#.�:��ʱ�ˊ��[��iڸ��$R�WU	�����X�.�^����H �#�TDbH1�R(/հ���t.�^����Z��e*A(�B��aPR�+|c��f|OI�����c^y��xp���8����C�o��pfD `�Nc���Ha�� "N~�P��ki��aێK��o��;��i�xy��J�gg��r+~~-c"�Ӈ��g[��E�[�GE+�[�EVf�:u�z���;}��k{.i�J9L���~�:ܯf�����g��W����+�vZ;|A��~n�Z{���g�<\��7�yՔ��x&�T�Fy6T�qFLM	�4�������`8��2*���p+[����n��8ح��ý�-r�SM&�\A#IB�#L��)Av�`��K��sB���?����ME      �      xڜ�k��F�6�Y���4�{�o�6�0C��u��Z��J���v�_�'/R2ǻ��������R���ֳ�n��V��h�5�ϟ��!4ͰO��8��~x�/�aڷ������N����/����_u�+c[+�V�]��i����mz��v?������D������:�:oLoc�t��#c�zau`������u:L�����Z�Ҷ��N�d)��Ǐ�'�p~��?�����������7�_���?��o���W|����}��_���_|g��q���<��~#������>���]^י�u�+���uR[��:,��pl���޿��f���o���D��p_	��������{+\�o��i���0����}Y��`*�^v����7���}���]7��8�6�~>��q���������*.��7���o�����n���o~���?����N�j��ۿ�a�v��?�_��}����_�]�;����_����W�=����4�p���_���6?��WR|�|۫^�N������w����ߘ�����u��_���������۟����w��7߻���;}{����i����v��y�N���xz���9��g��RV��%+.YX�M�A��K���~��K������3��a����8�q����qy�����oo?N���o�����������?Ӓ����?��}e��Z�L�����.Le��]<9?���y��)����鮱��Lj��Q��j<��������~֥k��R��Y4δNzЉ�*�p�@�N���y�o*+%[�<e���H+�vY~
BӼ�Ӵ���~���P����Z�������}�ç�=�J~�W?�����?�n��ӷ�R���W�/�<�����N������&�oO߽������q��S5�.�t�τ���.h�(f�t'E6-%!~������w�y�c&������?]w?���?���?=����W��Ϳ?=���˧�������<}�I~�ח���o��~7��;~�{�:#���I|��<���pvTg�r�V8~�4<�������]<L�8�^i�L֯ �-2p�O��2���iZ%4�*N[�������P��=A���~�}h=-��R렑�k��U0�.������p����N�tε��p)���o���頽}�<%!�g�U����I������Ez�XڒP,����c���鬓���`����l��_	MC��C'��U��x)�%c|�������_�'������O�?���M7�#L�;l�����>���{��7��?N���>n����e��L���k�Ɗ��|�Z�o��e<��)�ᖗ�4I�<eL��n����X^?]���n�OӦbY�Z��I��%zX�f�6���y��&���y�q�/sm��W�k;+�h���:o,\clZzA�+vO�'��z�i��;vD
����2�/	\��p�N�vS_1T��3a+$�V�:- �*���@�Ћ��r��e?�o�6P {`����N�h�@I��
��]O�q_5���k�k�(�Rc�Ї���d�aY��eڝ�z@ә�+p��m	!�'������י	1		�l��[��_P�J���g8���B�3�]'���C�e�� �E��f{��>t�*�sN��p��#�)Kk���7��>M�繾X('$��%t�C��� �9���t��U���ƪk�襀�]�f%�rwEh���o0d�y�p��7������� �
#,W���� ��Ä�-Ѱ^����F�q��u6%��n����v��xs��Ἇ�8�/�t�e���鴛�����C3��G3�}p��)�旬�h$��y��Ǻ-�Wu�W.���X�{�@����P�������a�Ddv	;�h�A:3�b��Ŷ���<V=|S��q��j�n�|JBӼ\if>�i/�f>�ﹽj|[D6�/�	��gg;=�~�~�jG�emyի�Q���W�:O��Y>�~z���Xur��l�h[`��>�ľ��W�f݌��i������֪Ί �0��z�Â�]⭅���/�l��ӑ�TU��_	�j��"�<��V^x�6���e�mޒ��ZL��:���w`T��P�9nX	��q���uKn��]8}V4�xas���D9��|����3dvI��ή�zX`�-�|!$��|��h��mU�%���]���+	���:^�+>|ϸ����q�������9�eP}m�F��j���wQT����ʴ��ϴ�����郵��DL�Yf<c�h�@�����a�����F����n��;�n���Dl̼���#�ý;?ϯ��qw��2̈o�`:(X��nq�VBӤ(o�a�*?Bt_u�������A�|�1�Q��m��a�A@|�[%_�:�}��8����O
}��a8ח�T��*��.r'�^=�aI��8��O�+vd;oh�ns��4΅�[�)��I��v��xw;D���۹q�4"̊Q\��D�>yPF���C`��}�1ٷ5uPHNq�vmk�'h�C�#�7�π3���9R뼙8Y���}+O�(��8ۘ^z�a/�S�c����ә��__k�+}2V�1#��fW��� ^_��[xo]:T�1
���\�]��5�|��9ݱ-F������?�K����w����z�����/���x�����i3������_��}>���<����;)���?m�\��?
�A?b�>s	_�\\��w�����80�O��vRRj�=.������w�?6�����_���|<����׿��_��|��o��7����'��?���������;K�~&]K��Ar����!-y�ssN�a:�?��i�S�&._�ɉ'·�]�̥禁�q9M��
�5{�LB�-�h��<��_��B�%���[0b��ň^\Gh�lU$B>p�_w�������cfY�8$���Ԃ�4��8���Q~}�´�i�G�����RzNL�]N��f��Xv����R�N�R-t�ؖ�eŰ�o_��Yy�V�,��f���.�*>���v�p7�Cյ�Ȣ\{x���V��wn%�O��c���ɹ��ф *������-��J�6l�k�pMYY8����z�35H;P�!n�a?T��-o%c��C�z٩%/	��^�4���̗���"�a�\T�����;f�\xAoh��i�j���	��2�wnl�dZ�SXi�c�H��ы�W�{v���i�<W�FRʅ6^K���0
HjNo���~<�H&�C��@��!��S�'�L�/���J	T�5�5��!"�� WX~%�ɜ���:LoC�=����l>0g�G�Y�P��+���7N��C^\^�AS�\NA���ד�cˡz	�
�.i���
�/��涮��0_�V��L�c��3�B2F�ˍ�J���>�Bꦲ�Z�$:�:3��<���8� 4�������vhۚ^�X e�Ԟ���Ȉ%׷��y���ݩm���`�4�uH#:^hc�!��a�<��s}��">W1A)��(���}�����ð�7֫xG��b�/:�fM�pK˼L�X�����X�~����5L:I�z�8YQ)�N��u�E�5kY<��n��q9�화�_��~h���tO���Ct�xC�r�DfyY	�-��i՚�(fnru}���\�����}��X��O�q���)�p��#�!&WF���Mo���h�ŕ��9?�����}ۢd�Ð?gO������ �}yO���|���q�}UūFHF|<`ɸY簯��Io����&�e��PK�PBŒ! ��ZN�u��b��6\�o�;��N��T���V�/{Q�	����Pgo$y���^50,�2?�$�B����X�yXƫ�8��&f>��!���X���Z	X~{�~��n4s�L�K�F:X�|��'�a{q�Ɗc~�u}ob�F�"�t�5{I��������esmw��βf�7�1'�k��]���(�%    ~k+��蝁?9�F(a{����4���^���?O�픪���i;!r�\`D�Y���{�O��0�xeŐg�@�:Y�c���G�����|�.잎79��Q+�~���b���vh�⼼�>�/��?������c����������n�p����!ж7ɕ��=On��"�+!�y�s��j/�H;ַ�'uܭ��g�}6��f�x��}��/��w:��I�(IH9��(lFp�.�������t/�ӭ��0��Xp�n��ؤ��󆜆��?�3�t,�1 x�-��;X�%[Q����TM�a��Uq��;%��8E˱������r����i�0�=������K�&=�L�ȝ��}7�&�� ��i�Υ�%�i�K��S='d�RP!�.Ed.`9�NK(���X�i?��*�	%���U<
>��ۜ-#���v�������b�Z��������9c���%!%Z��f~����}+�e%۪`���
�zq�
��z?\Ow�6��x����i8���5K��BhB⑵G�!z�
��eU�
E}KԒ��/���v�5[��1��y-�\��a����:gB��6]�p!:l�q:_p�g���7ƭuλt^|�0_.���7�p.{�p=j	#K�T��>����p@`
�_�V�?�_N/�C}c�Qkş8��A��pq���uw=��"�|��ͅr�c�/��	-��b&KE�u��m�oߥ��������� ��O���a�)ߏ����ZvT�V���=�|6
6��r�o��N2�_�~�����.����1��b���T_.l,b��O�5�v��b�����[�m`�mv�a3Ǜ���A�I�����_�K���@�S[����l@�Eh�&��Pzn���<���Է��A�|l=ķ���=��,�+k�
߷�����nwzO�W"jX������v~ڄB˚�x�)��X� �Sz׈yQ)	�
�>��q�i����F\��&�s�5N�z�7�#F�o�;*C�ԷP�.�0
#�.���J	�R��x����xӸ:n��0�s3N�Z~I�r��!����V��t�d@�����%A%!q��U����`�mǛ����+g<�\Y2�{O,�����1�RV.ec%��ߡ��Z��~;)�v�5��PR�&&<S�Ӊ�f��o��]�x,b�i��b��!��O�+�y��<O���$��Rhk�PxI�F������6���b곡��I�@��ٕ.	M�8<N�~~��%��V�sm��@�%�#CM�=<>n�`�C�����?������|�~J����m��V5����a���۷��e:���T�˞E�*�ӎ���7ϑ��,�0*]���)r�"	�ӕx�)�{ؾ�֘� ,�73�s}Ū�g����,#)����L���p~=а>V��+>H����g�,v��8�������8�W���>C��:[�����<�l;����Z�$��ҥ4�Ŝ��]	�R��a�<��V����1��v�grsV�L<l�w�ajj����->V�z�h��|m��������i�U���U�Z��$��]S׹�2� d���X՗,T�2-Y5��� ��^���N� :Ǟ��r�(��1K�!�[�:	� v�1��ֹ�lI�?SG�����)����Y�>��CU�h~�mb~Z떺ѕ������!�wMF�ܴ�w&16u������Z����8���<|�|xϗ����Χ�O��cR�4�����g�05k������n�����ek��\�_�PF�
9=3�u:���N��x܌�����<�Ŋ <���xoHaMA`�>��S��gG���JiJ/u(����3� ��L���';^�Ct]ꔒM�Z�
�7��/֪������R������хJ����@VB���Z�/���h9X,��8#:�K��!���r�ڮ�%�V�v��P��.�i%��Ϗ���t|_�.Ԉ��>�x���gg�� d��<�C�����_1.^��Z����$(����PE��?�}�J��Y}��j�i�ի$0��O��f>_��7���ce:������s��^	��ag~`5�i?�׏�-la���h��e;��K�&�����Yv'd;����lh{��A��q��#ԗ�~x�����O`q��sZ��5��ھ\�ΩWQѪB屏�,fv!0�y��̶Mւ7��7�D�,F!�u�\��V?��O��&(₅�QJzT&o%�V�	i���yX܃�^����H�|V�Xr�\���1����8����H�B��H��z���Z	�=p��s,��}���xO_��{�e2=����p�ݱf��ޤ	���@�>�Ra��[���رIM�t�/;J;�z��y��x��M�ղU�cKMd/�ૉER����p�}`u�^�0d,��e|b�W�~�b�ℳ������^ŦV�'��]��������D��3T�IK�$Ka:��12[��+!�����<�����YJj�u25�����o���d��Pޮ}�����F�T�$F��ެ�%����Ɖ�fX�nhX����Cc����+��7g>3�����fp��k%<�Bn�M�)�z��Q���nz�v��tt!�/WB�$��L�9<��?�����h�Y�������S�%^!Er�X�b�뱝8$*�WB�a8Ӄ����gC�Ի��c���;
Bf���ě��ӥ	��<֊�-�U�xY���:,]�쒐�������@é�?AQ�~|<!B7}9��.��$�/�n��󊂯��i�1%<�3�A��L,��9o��մ�BdXØ��6�eD���9�ĕ�R�=Yl0��s#Z�p���pz	_�:���Ad�Ȩ��{d�C%�����Z�	k���f��󃨿�C$��j�K�C��b%,���Ån�ժ<{�]tE����n)���iY����"n�$�c0�B��z)p-+�|N��j��l��*f����jr_p>���8�N7�.0��r�2�������K�FA �;:����p���0XޙX���P�^Hg��7]_uZ5�!��ps?���6��_o�S�E�Kj�8b�>�a�6��^F����$`���<�g�1��ܰ�H%�F������{Ap�	��pjO���c��j�����I���f.�{A �g����Ä3w8��)*}JC�o�	U>��LO�y��VuX��s՝
%�,��v������|�SgOIѩ.A�лisǃ���(n&zK#�k<|�]��J�BI3'�F����~ލGx��̖���P��B*�Nkc���%!��=�J������}e�����`l%�e�dQ�9UY^W��4Ƿ:ly&
M:���ȥ���Pg��ǆ�'8���0?R���`Mx�VY:��5Kӄ�I���X�/�k{l3���.$5�Ax����!;w�����z�T/D��^��FKIW8��+!���q��K�7�� �IPzv�,���i�aC��@dl|�aN˅mF��C(V����4܏�y����:���d��=��4J/����WYi;��u�o��	�(�J/��Ɩ���~?Wʒ�ʶ=��x3���р-��$���0^N����PI�/�64G�C�'κ1�����m��sB��c�^e�ڵ�c1}|�i�eK]��I)�;����N��#[At���e���_����׌�� �	k:�h�5��>a��kB���`����Y��z�},���Dy��E:
�SҺ�Ӳ�
,=s��vf��p�`I5��U�R�!F@�-r����
�?]_��Wb����5	7A(,헻˕ ���4����ZC� ������$	����.�j5������z"���$�~#�E�$x�.n^a�+Z���7��.0�\j���{�����Z�8��Kq��+	fS�kh:�q��V�Ҳ��7|�]χ�zL�k=�E��1t~{XhCt��/�����k��ߔh'G�V԰��E��/�    +�x?^��!�T�C��3S��6=CC�\��y��6��t*�;��J����i��C�VUR�"O�2�#ӇB�\	����8��SH��S]F�e�"��tćb�%� �Wߟ���ہ(�.x�O7^�+;U�e#}n+�lLI����T[=��r}�쒕Q=0��s�$�(A��V��6k��$�,���x��f����8�A8Zlp�)��%bH���/� E�����ݶp�S
��8��(�Z���p!,�[��齶=�����	b�62D:���nV�s�׫1��O�������tF�qY`JB^��q��:V�[��&XI� ���÷$�V���P�Ȗޖ���ò#n�K�`|�,����O���V����}Ϻሷ���Bd!�z2��,����j�.x�*w0Oa1:_Q����U��S։���!	��G��.����x�b��T��*V,'tmy/����Y�N�k#��
�:�X���a�>��Al�o��(+��Ib!�$��U����~�~�����5��c���׫Z32A}����Cv�M,Z!�����\O��ç+Þ�wM:�����=E�"�e�ayC�Ok�6D��L��Z�y9��+!q����kȂ�/J�=Q�'��^�hϜQ��Ђ�A�'�S�X�2�����gx�U�-�5��eߛ�6���"���5��yA����d�}.��P4�C���d�	/	\�۴m�%}���v�����7��F ��}d�_��.!�a3 Z�֗iW��9k,<B�ga,���~:�YC�-��>��β��JvwJ#q��]�J2�r�A��V��o�v��@�7��	�;ڥ��˒��h���a؞��������)�SY�B���d��r�R�\���Cm�����.�>" ����㱢����=�Uh��[��*�zm�b�L���X��]�� $(�I���ٞhDg�N�h�$,���;X�VJ�D��_%l�V����y�ךT �D��Gn��s�1��G�l�����\�'Mw`8(߀�gr|?����J��:O�Zv~�x��Mo��1izn�������̮b�iu6�X�s̘��v>��0T�E�e��'8�b/�(�X
x�DJ�?��/�;~��5�K��5��?��� ��]�����Ϗ�9k���������\R t|��G�������[/3x�b��@�@�^�d8oLO��4�vڰ>rZ����&'CK��(�9#�Rɴ���7ޥ9E���"k���-�����x���+�ZyY��s�-�ŀc��ٞ��uܷ��������c��4N;x��wXA�����UYl������Q�m��f�d�]F�ly�z~��g��)�v9���P��6Ѯ���xϡx~���nv�@o%�(,2�Z�%+��a��������o P��*���ֱ��M�M�]7���`�tK@�X��(\�K*��0.�m�UJU�ϳ&���U�?EQ�	`���ʮ�[k�����l{����w/�/5v,�\�8�K��34b7Qn�+`幹�nVB�6�qɥP"��;z�+�\A����Jbj�s�uE��fz����:P`����q�|�.]R�94!��%aS��$p��~�q{�m�H=�}�LCCI��s�����t$&��m��s6߫� @5wi�'�e<��]�L~��a�\���8c�9=���ө�B��^J'���*���hj��
Bd�{��原�8a�$
�m$��wv���s�w��#g=�7��_~��(lpTAR6����WT�7��ꎶk��o3��%*4������� �%��ee�&���n�7��NG�� ���db_ ��%+��@p�P��k�d�
IA �O�	��x�
��M���S$����W�պ�@����|���qWi� wB��A�xr���b�/�~�p>�+�'�>"����ިt��X��ق%�Xɂ���i�i�v�]�
�}�d3z|G��f� �aC�y����G�����Eo����А���u��C�h��C��|29���fmQD^�w0��G�:?�8i�R�s O3=��x���0���\�8��Q�HK��G.��$��~���f�WQáЏ�9I�X�g��w	F²1��S}C�h���!n`{|��Sq{�Ç��P����$��7:ͭ���2�qz�$f7�oě��S��[��E)��x�;6,��
Bb�Rn�S��v�u"��p ��#�D�]��6p`# C�'��e�Sq���}i�޺h��������m�vZ��AO��-��$��~�
\��nΜ������ؘwSa�&�٘[zsVBZ�@p�S}'�m��"�:�=�[ԛ"v_	�9򗇹��J��<ĝ�Hs�D��넶���pm�Q�ez��q��Ӷ�M<Q�iA��ҡ�#pk�Ї*�2��GD8?��������3>ڱ��5�\�4Ii��,��y���5��9]�9�r�R���Ω�]�-�5���g��6����m8�
Np��Fɺ����F��in�.�U(졭�t\{��
��,M�%!���� ��?��c*H��c'�dnz�7V��[�|e�Ψ��h:~�����yxv�����f��)��&��(��8ڟ�ZG��4�1$䥪��S⛧y�8�����B����4* $T���*��H,<�0�Q@h�'S���*�R;^kM�������΅�-6�tǡ��:~�VzJY� $ѐ�V�<__�-��p[�3C�O�	hގWek�bAX^�\���_ ��������|-�B~��r&�Z��n�?z���o:�Af��3�Y������L��S��v�d�'~.�/�D�?��Xk�����@��*�Sc�&q�z���gCd��.m�Z	�|���B�(�!�Wm�e��y�ڦ<��q�%!�}��8�SKoyx���9Է��z��MΪ%��~�%ٱ�b���}��a�/!ޞ%�r|	K�z����y�����D���j]�
�y�-��N˰�@���Z�0���+*��*��!VV)L�6���3����@]o�5�7�&��FDa��� �W �sr��~[^@��Xk�\�8�FPa�w��Z	,Ak�/���������h�����+(�JH�!��ւ5�kC�bI)�P���T�m���ܛ�Χ�������Y�bm.�9A7����2��F��4bJ����(J_	+k(�����p�	#rk�$qU�YT����8���)k%�o���]�5��x�H�Bɒ�|���~$�E{~%���cV��*-��t��rRے}/�E�����M/��)x͞�,9^9��1�W�>T���M�ؘ^P�(�X���7��X�ogP�q�lh�������?P�&����p{
a(��0�>9×k%����l݌�e�a��N�y��&±|���26)z9�W�)����·WB��w��W�n	�6��Z�G<������:G�^8&��!����0��JX�����/��P�Õ[B��n9��9�k�@�:x�
x�V�bP�t�3@Vk#qAX>��es����B��ZMJ����t��I�)9sd�ڼ�1�G�?�跚Ӎ#�>��e8x��q2�9_�P6��	{�a�q�	p����M鰅��a[������1)y��7����J]/
���o�^���-�@(6�0�\zq+4�t0<W��P���PƚG@o�R�VO�u�&;BOW�Z����2�n����y廹T�~� y�U�F	E��P�J���ڽݏ��cu���̮�϶�ȕ��yY����%KŔ�O�D���k��@���-w0�3��&E\�[^,^%a]�c�x�{󴰘1g
g��a�=l��b�5��y��۠O�c�+��G�>B�3�
Cȹ��J�k�:=B
[�,V�h#�[I��$B)���	O�!�r    ����v6ŻT�����^�8�
� ��[��K(��q7>ފ��2|������]�;�����o|�EU*��Y�C)S�1_A�9��e���0��rw��t����P��8"�ķ@@Uw�8X�`B~K��+ $:��J5����`
f���X������@��JK�u��K=O|<���|k��|:�E�E{�?��J�k=���n�_�2|��cy�^U2�3�3Z�c3 �N�dq(�闼$E/��������*W�t�`-���aoڒ��:�j��所Εs�R=��B�;�+�����82��~����*��K5��h�A�d�]���wp�[��4�eD�2,�Xf����鼙�=/T�c�ӡV�6MLg�1v��][��G^�U�D��X�ҲiŒ�O��b70��T��wi=Ϭ��Z��r7x�X���X��[&����g��9{��b�Xj:�����V���n�E0Bk�`$��6�0ߍ3�ˇa�c��o	�!9
2��� < �ݕ�+����Pf�YJ�2�l��s��f7��mK
~�È}J����-��OIh��x��G!n���k��Oʋy�H�s>�f�P���;����H<4iL�{ͦ)��ۙ�4��������X)r����D9��¨~I��]��i3�����VB-��2�X8�K��u �J�^���<�n�AպoȞ�]�l���?*0JB|A�}�Lm傸��ۢ�}c�Z(̪�P	š�a��\�Lm�-5�D���Y �o��6<�o��v}�$r\arx��V��-.V�'�S���̓!�"������k���I�q�P1�x���Pɖ�x�����0�giX,��m��#�ԩ��70�d̙i�������� �׀j<s�ѐ޷k�C��]�>�J�`���u+�?�!ۧ�����K��hc{��E�bA�F�Pt�k�6�IX����jc��e�VA ��c�ƽ�8;6ptIFX����k��B࢏�S¡���toaU��#&�|.�-)	�HM���ʞ+��_�B�@ q��j-	x���6����,d��8����e��)���C,��.�Yo$�uB`���h� ,��Λy~ިF���Jټ��cG���m:]��w0wm�;��\7�0�ez�H������Q1�ā#�O�a�eYfF�\	�۩�|G+1��/�������3ٞ�P��2���;���Bh����a�c^wI/8���9A}��
Fo��y<
J΃�S|&��u?1k�a`r{��ű�K[��b?
N�:�|!����Jv�<�s�o�A�&��m謬ey���ω�R{p=^���������Ҥ���=g�uB-ʤ ����!�������$��9�ׂՎ�FIh��S���4���P-�]%
1��s�u��Np'��Z��Z�^^�F8A���1�Q�#�ܪ��"�8�u�g���K;I���S�\���<���|ӾE��Sak��]���D��*o�ᛚJ���w�cy�0u�#�}7�X3T�D־����g!>g���!V�ݱ���h:��խR�Ko�J�6���u_[��[F#��¼ş�,�(�����u3����K�ȗ�)ˡ�YR
º!�,�iw�#Ig��w�ڈU5^�le%~����/.V*m���D� n��k�⑮�?���a7O��Y�3:�:_��q�	����j%0�{[��w�m�8ŉ�����qP|�Ղ������TC!�����5��*�K����u��6��Q�m�Z� *ZC���
����)��pB���r�X�*�8"&��8D�ܾ��4|��,��������)N���Mh`�v͊������6[�&'���3�x�ۯƶ 4�����@=���Pi�g�.B�9�+岗�@ ��zûO:}���]�H��ñR��^�dI��W^��	S��<�Lj��Qy���F���ْ���e?Ԯ�ȷg�oR8�8��Q���yY���ӡ��n���8J䪖���<�(�u֐�Ť���֔M�R�&��ί��[gK)w��+kΟ捬a��
(�����a��0�C����ƙ&D˾���|�a��3�����y��4��kgr���4Ya ��!~��(d�߿���>_/�y�x���;Yu����
�\�
p>ޅ��m� ?Y2l����|,V�$�=���Xc��Nƽ�H{K��'�$������@8q���z�=�%�>^��_���mye�o�
�N���jVf8�"%����)�^�����3��mΆC`L��a}����q��	����-�zX�_a<�$H��]��<K�5��xܶ����v�v癳��]#k��tK�iA�N0�@T���\_�d'2�_:ޞ�e��@�W���W�@�lFFH�Kk�[�9�Mؐ���2�6O��@gE�O���b	��3ؽ��^��y�ͧS8؊WQWcA�,Z�x��W�3S��P$ۛ_���R&]�r��X�%�(	`=�"�MD��n1�c#�Pi��Yq��Zƚ	����|�O"�E~-$Ǚ�!����.��r��#���T��Y��1��[�	a£:��mQۂ8i.K���ml��EO�`���v����
GĠ"�k2C�8�!7��g0�K�Ag��W	Y��Eo�H5�%!ZKQjA���T�Y�'v ��X����B(d#�\��!��3�s��+N̵	/���i~�N�u�\� u��k}��d\/:ͬ!nA���kƷfK�ZX'�i�I⣻�0�g�<�� �/��}�.���S,*�c����8��+'x@�?V��0��E���$E��]����7��ч�j>UKKuH���rn�A��pet��L�ә�'���c��:�6���r�1���Z��)�xġ����8V]�jՀ������=��鎵��ϸ}&�`Ǎ]�(B`�8�7�7�:��DS���J[�Q���&�u�Bȯ�CU���z�!��h��V��$�G��s�^�E���O�L�����b�㰩K^E�Y�7\Ȇ�;;��9���
ǹ��)��j#K��,�3�KCU&���)�O}}8���ۊ�H�
6cY�A�JB\;���0��z88�� �"��0߈���9'�Bӌǧ��;6.�Sޙ�)��%w�(�[	4��{�MR��_#��l��΂�m���*C�n�4!�pV�����_>fA ��HI��������[#�>@�`q~�-d�
;�U�'����"kB�p` ��� �5b�� �Z��7q-g=F�!9��p�F�����:��X_:�Ѳ�8J�i���^���oñ=?���J�4��*��f.fLϑ�p~��+h���0p/�dLuF-��9��aA�>TO.��^�C#M�������L��v8T�BM�8�9�=��A�Q�6�ȋ� Ο���{��*s���,`��]  �t5�i^�ͧ�x���u��˶K����H8vK�gI �	f�(p#Z��i�Ტc�ޚ�/�Z>U�0ݶ�i��Q��0E�`[�w���|x������q�Ͱ�F�^Z6�/�J�>�o{��;v���1zн���K`AH�����:ѷ�� �
����(^�k�����]� 4�Ȱ��^S�v��9��&:�ޢU���1`�*_c�F!�M������[��B`==!��i�S}7�#$q��l�$�>KBӼ>�șʲ����M�4J�Xb��Ya���.���dO�k�F���6#�rɴD`
	�T���l���B�Rԥ�v筷�#Z�|JV`1oy8��h�*q���p%�>6?K�@l��*|^�C�Fy�VvV�d���;��5u/��䊱����˒�N��T*L�'�^.-������"u��\'Ns���!o�^�ip_͘�3Oϑ�;ª�C-�6���])��쿗�$��.0�+�̷��2������&T�A�d_5�B�)JUWB�.?"̙��L�1]iX9ëټh�q    !�zy�_�.�����ʴ�Q���=B4� ����a�<lgQ_.��-+�#{�!�a�Y�?Bd���C�M(�#DTrB!�x��+�AI��٬R;����G�`ùO��\��?,���M(3��9��I�e3&>�w$�V�I�']�2W�TM(�S��x!m8�	K��ך(q�e��m��6%3�tJ�O�n%0%3����� ��t�O�,�X��0���Ґ�]'<ǅ�x��ƶ����PrǦ��`���'W�(!B���z~�C&��kK����,�B/=@�9.�u��	p8y�֤q*��U�6�hk�S�P��H�뽣��|]�z듒7��������dz�ܐډ�14"��v��\7Q��H���1:��S�
7f3�c��C�8w-�qZ�e��:�c%��x��z�C`�&	�I�u��J ��ѡM�����0ޮ�@İjFIV���x%d��PMYG��c���pE���T������iE��6,�O���M�`������n��֫jU4�VJEH"c�x`�.��x��������Jvj\3�eXH䛮�k��Һϧ岸�͒��&^���(�#L��%2\	M����w��Q%B���1���E �\��qD5�i��Rz�X4� P�X!
����h�nvZ��:�(�ep�.8]��� ₨�P;����ǎE��k�֤��������+���hX��]~'� ,x���ZI�\m���Ir��	XքYN�P�+�HI��;������D�aY-"���e�S���˝qA0�'&(�m4+r�J-֡؀���&>/�-���Xj�+T�9!)�;4�%���y����km�·D.��e����'�,�ꖺ�������w�՗��Z����Cq��5+�����|���9&&۱�ѧ�7�aK]���G��e�dڍ��&Tֱ� �t�;x'saZz��߰y?��/U�O���ÈI�F�<�-<��f�ݑO5��/4CE���]��3x�O�J�X�/�qdXm���u�9��u�+�i�ז�?H�M?Y�~A���A��;&I'��nBᝳVt���g� [��XF ��ԍ_
�!\��ku����gX��9��n'0��γ�#�@�p�_���8���P�2;aZš����C?��?� ��q����u֒x�^����^]F.I�M�C(�?�{�Y�Fd��i=��ȱ� ���d��p�!�m����潿����:	��F();�3�`��0���+�cT�=![�LN�W:N���lT
��c�:<2ʸ=�̰��#�R|�W�myZ��
�o8:�qB\t�ڵӆRn�׍���_�K
"��vHEכ�p��-�\�ķ��Ҫ�1xz�z�1lb�ʫ�`�rSN�gK`�*/�
�����4���m�w��z��tQ�{�yzG��� �_в/�����c��y�S����+��]�Ү�e>��p�ކ�̅�G`�NbhB�ڱ�p.Y	M�:�`�	�6j#8�>h0�2��K����ݺ`��]��0QW���D��1,�ȓ�s�{=nw��X�D��K��m'	���aB���)��R�F#su��YW��^k�`���eNO?�i\�|C�##&Q�(#�:� �+����)��+x%Ǫ��+3j��F�G⺟󡫬�>QӲ)���!�,ƒ�l�y�ᲹBs�}�#��ĕN�kw����,`/D���K�~����wDύ<}c�E�������X|��5i�}����r$#�ۜxf_�fz? �N��G�qKa�3�֒�(����O�SmB*^$T+���a��܂ �a?�
�*�� �G@0�X��:�fy#shU�ٹs��Gz0U���ҙ���K�²bx�DhI����|�e���-��er�,[����kyAh��ؙ�yx}����-*��Z`�{��,M!0��Cj���[CVص�[�"8��7�2q%���C�-��<�0J�p��3�X9Y����o����}���_���������2��e2"�Ù�.$^c�nW��2��p=��@=�5i�}�7N|�bx�JHo��xs��d���"t�.9��4@��1��w�I=�L:(�d��vj�S����m��фٹ�w�RG/�(q�6L�s}}@��/�!D������b��#UB����y���`a�Su�� �:�q�%��%�W���G�EC�����Mf�K��g�WF�[p�W����'��*w�J{��'��a�Z.!��ǰ���~���҄����e�D�C���̯΄��|��;δ�m��0�{�`�e����3�%\�I�T>�dZ��a�jNO�ND$ҏL[�`���\<ݰ4���Zt�-�b��"$�:�b%�Wlv���R����>r�R޲��g���i3~���>�/��O-4r���.�9��P��b�ˡ��4{l�v�#7Z`-G���(|w��k|���[�Ǫ�
SɫS)��7�_p`d[e���t�ዀ��~��-�um�>&�
���]�:!���f�4++V�弋��,i!�VȾ�|�JX���=��`]�����-��i�ü3���_Ah
���{O#Px���)��!��غ������{Хw�P�2I"�)�v��T���p]�JV��PNX�8�ǡ�^+���dB�}���s|42煂�6�'A�d3��]�{G�1�����F�7���/M��|?��e�<W��"O߂a��N� Q�����h,p��������9y�&��9W)�~��P�{F��0�,��-�-�ʤ�Ȗ�.8�hE�.wq����v���l��L[[�����QX�k><q��/o�����`�Kg��Q�p:-�ԅ�2���XW��=}^;����p����2�^�0�s��"��~�����3T�?Bh�'�gd
a�|�G�۸�9�?�>�>��-�$��
in�^G}����a�
s �����6�:8�5��9�>�m`.�1�i9m���x���ྸن#E���{Z���Ǌs_dAX_��9��4\�a*�;�����^��bae��9�ˬ@�Wp�/���+4��ω���2>�ƜI��St��}j�����z�6b��ʄ��|���k;"L�y�:-7$q��M� �G��9׎������&ߕ2L�y��z��^�:��q�=��p�L��b4> �u����������3�P�;�H�>!�eX�c�T��*�r��p�ax�n�2�����Z�D0���F��Nc�b�o�����؛]J�Ģ���n%�%��5����;λfÇ�I�[�p�Y�L���d��<�0ʋ����6>^!�i�	�!b]j�k�h�C��'FQ���İ|ƀ��+�RI��#��&��7�L�`-��p�&Q߯9��@�����������2�M0�������I&��~�no����N%���$�6h���/;�գf�Ҩ�(:��1pY|����a3^`ƍ�C`Ʉ6�RZ�#�A6:Y��~ �*к��i�m�b̈0r�-�J%!r�_tw`f�z� ��sz���N��+ZMb�p���n��/0�B#S����*��+��L�Z��zC�hW;�.������|�]�p�ü?� �R�_a[H^�����T� ���n<<<VA��^�zVHFT%눍�-�����0nO�;���M�*B�����zA))	+{�P<s�]M�4���]�[-���[zs��
|��0���-��y�Y�-�,�H`%�=M�Pg���c�Ij�P�_[�²nDF��8�� ��fg�X�m}�V�1��_IX^�du ���� v�X�X�2�Fzάa�baB�'/��`LxH���[[ί�P�+�i�������������͟�������o_̶�6��i��eU�g��ӗa�+!.��C���{oء
g=�w��3(Da�
��4�V2�����vT���i�t����`����y[M&G��Sz�]�m@?f��ZcY�:xϗL_/?�2)8�#<�. ��x���*[�����v���¼G�Jc�{�%    �Q�����x��=���&���M��e���;�a>�,-!#�>tZ�fW��.���s�L���u\*���n��Iy��J���Y�
;~߰%s}�s���9yv�s{�)&kߜiy+>I�u�9�5��^!�F�+9�����"EM�e��ERf������[vM�-��w�^�<��s}?�U��&}K��d�'|�E�w|����x;��Ui2�e���W�,�n-	̄����x�+���f-��S�D��]5��ЀC%bf���-���R��*��Y���e�2�-�[�_?gQ�踛"�%��(·\�^�w�����@Ǻ���KII�(�T�pL;�,�
�x�;b����^���w	��u��B�����	d�և�k}�J�@�h�\�� ���ۤ$�3{�6O���p�~(Ǿ�!���"44l��~]A��G��k�4^>2&4�2�$<��^�=wc;`����^��>�-�8���������x���w����4�qV�wPi��,<G�`q�/b�	z1��X�C��<#>��iQV%�d�������=��L��J�\]hp~�=�~.���U��iv|q�h��q�$,�_���J�sD�P�#{����?��Slw���-;(�)u��QLX9�,yɅ����i��;�2\.�*;!�$=�y��íq���#��!���{;mb|��N��iڶ�W�B_�M��˪�|�W��[c�:�o��<_%I�0�,��g�$�=wTv�������b_9(ȬJ�$�_0[��w�6F���V�����~%�!�%!�`uG��ʍ�����g�uB*B.Uƙ�Y����6ܚ��1ϼm���D:&}�5�4���DH�Yv��'"u�����G��X��d:�:�V���4[�%�6����e:�ݸ�^pX!a�#{��g�[��KBZ<��p=V�y�d��dt�E|���$4��|f���\g�gNZ���F["�f����o�������U���Pω�Dq�,}�y�!��|n���#/���Q�tet,��Lm�,Í�3���"|����TZ������[�<K����!��(ΩTy� ��8�Ա8� ���X��ox�o��!T���Kz�k&I	?:�yd�t�XOig`�D�)��2^y|����rz��4��Iq�{�B�-��ـ�I��#,���#G�2#�%Oǁ2���Ƚo9\*��8V�P*8�f-\]	�D����^��t�/���J��a��$v/����� ������#=��}�l��Şn��rATzfu�]	ZXg.ֻ4�P"����Y\�T����M�!��8<T�M�w�~����J;z�����@����ix.{���P���F����(���[F������:�Ww=/5�f�)x�:a���'xږ���vX�@ς��V*��B��.X=�iJ
{1���q�c�'(�t�'`�Xҙ�&���{��-��|<��^�������m����1����0t���z�V�����|��>$9�m�z�m�v�9vC�eGVBhT�� 뜅i!!	e���ၳ봫��A֧���v ^F'j�5���k&H���ZpZ�+���S��i	?�	�wl��|�:��T���O	f��mx���8/;�:���h��koA�>�p����2�9�����3~iI ��aw��SmKtךE�>����\��c���ݗ�B9Ǘ��lި9�h�8�)��$"תoB��c�^B��7�6z��04��?4k�aI�h���g%���X���=�I�"UAH���j��Rݘ k';|��^6�ap.�ρ���{���N�2�S��M|�A�V²\��Ϗ��/q�ğ���/��7���:�˕�isϟ�Sթ'c�jի�� v��meb�X]�2�e:��K��m��ƘD+H�;@[��9N~�m�@�}2p�؂��N����S;�/��p��2��s������B�&� ����8?���~("5���.��p�ւn��u��cȂVYjIa��4�5��,+wB	�����q�L�v���6{ǗU���v:m�k}�F�!r�{�k1��R������g�Ҝں9�RC_G���O����/=�!�
"������<#�L��'7 /Ju!D�Gz������ĲᜮȞ�RXA�����f�g)�W��ZI�>+�L�/�5�93>CI����턏�y�Z9�L4#و�Wϻ ��렣
w�7�hZߨ�t*��eข ����gߴ4�2i�א>''ZX/������0>�E�lm�Z�bKF@"�b��WE�	���puNg^�6�}�2�,�a��R�����zp�Ϟ1��N?�V�C��\	M*�$�T]I �н�.'D���|�:Xt�u&�;kY�!X�XkY3!���_͇R���	����@�˧g���������~����wR&6��ql��r&>���vO�U��Da���ag�]�2�(*.T��ǯ�+ayMB_�'��U&��;�X]OX��ȼ p�2�<8\�m���S���DE����ּ���_Cr��8߷�4���<� �%~?_B�=��0C��8�6&T��|X|�k1��Sz���k@��ɼ�҆�O?�4��=<����8r��N��KKa�S����L�e�D�C�Sq��<nGȦ�'3�������Ke�BX�q�,�����ؔt�H���HŬnW��LB���ҋ:g�v��b� (�"p�w��ȖX��?f��V����z�c}�z�P�����/�K��3(V	k�n8q��F���������u�,3��vN��Z<>��ǁL+�.���DVL���ƴ��gn��l���Ĵ��X�ð �R�H���n���c��B�z2^LI��a��/ ϩcm��K�J2|/��\�R�b]yA��T(�[�s*�f��3��pG$f5i��������9a�U7'�G�J?����ift\�'%�l��W���Ɯs�t��t����oA`���sto�rsr�Y��K���g�>�����F����PJ�I��N�T�[k��x�A�����>�8ΉbW{/��}X2�P&��͙�,��' �p�+�����G
��/�8Q2c)󶐘#��:CC4Y��mvCh��)-��1��kz���v�w.	�KD���8�#�����C�Y��� �g`U3|�P�q^�E6&� 
�2Kl�ɔ�5�����9�n5�c��A�V��yC��U�!l0��L�׾3/�3�������uޏÜq��q;�>��>L�Ȼm��,��kJ� �=?nn�&�P⦽NuF���@���	M�������_���ժ�E���^t�����0��+>s?�����K�3$��@�d��7�3P����B�W<������;�>ezY:wPs�jƂ@�A���/�����:�,	!���t��)c����S�x�5�y3����9�=j��e)�Y��
���Ӽ�e�	�����/`E��[g� ܅nm5,ܜ���cv�x�� 4�y ����K~� ����=�U���Z��e��0�� ���0�[��n`�v5��F�	�b�(84��g���@���ex���#����VIҡ��åL��L�4�8ޟ�NH�QCj��'YT��� �p����"�)�
������#=��%��屾�R������Qg�0��^Ж������o�jD��h��;^��A�%�H�:�|04�*��&w>}z�3T��k#C"<?�A8KL]�zڌӰ;��Yya��X�U����1�[��%ŕe�1�+��Y�%����5��KzHz�gV&@� !����w�{�PS����78��n�\N(w��BW6��t�����fIx��&�)�%.����1LB �}ǆC��`)g��E**?T(g?�I'#�z�3x5�}�2�IC2FIG�R�!1p�"d�H��=x���<$��R�ipZibV����{8��GLp4�8Ar� �I"��s�zNGn�`�&:���36��I�?�1?[    �i�*/KC�VC��(R�eBY|�d2��k4v�r#���/�)O�b�e�'!@����]��oٯ�f���-́fX��a�Ѵ�tID���>�j6r�����K
�@a/�b�H�6�\���ݦ^z��+�����p�
�#,v����US����&��[��4�|cB+"��,$ʓ�֘q�F�����_0V�sV_+g�'ϩ��;!_���3S��[x8�C���DgC,@ͧ��pm���w�:"���"�bډc�/<�b{���X$����F�
q�
�0�LN
��Ü�,i�4l�r�:H��*aq^�ܘ���xs�NҌ��N��"��1v$"'q�p�|Pr�KLU����O�'��	�X+�a�}8ۗ����o�Z��Lo^���T����*%!�f���aϤk�R�^�� ��.b쀷��)r�]\p�K&�8���*��X�LX�#��BH7'��<�K-�i�L�4�jl�BL-$�����^��n��b��N�z9I����~�Lt��Y���H���;��aZs���p�)$X�l�`j̱*�p�>�nʑ�f����Q%W,��%��o��yo���p�U�f��|32��#�[���F��g�͕b4�,���t�A>:YS�FǄ@`�
��Wr|�3�"�9��3�L�e�c� �~<4,�t���1���c:��z|���zq>�S�j«�(C�@%� .�;$B���&��MA�� Hd
R6kJL߬)N1��Y�4F��J�RCL<�2��8�=F�ß���P���4�p4ab�D�3h�t��~w#�vME:<1��U�. �a�?{㱥��� ��j� r�7����K�̓�콆E���\�U��yRYG_=��H��
�ӵc�QЎ�AECc�� �xṇ���)�ש��#f�ʏ=�*�/����5!jְT9P�d޲�ЊgT���+��4FM���6�I�R%�P��si�N��ŝ���JȪ:���;��ƌ�	h^��O/�F� +AN��u�W5&Kp�ݱ�8��L[�r�� _F|;�)� p�Ads,85wg{e���㝵��-/A�m���8��@֠����G������"����Ti��ڬ�@�ߞ�T�Xj���>�-�8!�B�m#)�n�s��<6�3 ���L�Ǆ7!��.�nu���18vB��'��"=K�dg�#_%�!'Å�Xϱ�U*6!��AA�@%��IAr�W?!����,���#а�N�X}Ѡa`�Y:pݷ�2M7��c}C�X��L5$���\�g�%���V��`��W�-[fb0� +�aϨw�����,]#AA&5u���|d9~�����z�V���E�X��x�b�JU�4���<I/�Z�S��O8Z,A��@/:�6l&PK�p0~�<D'�^���Ւ�R��g�py��r8�{S�C�)4g����9���L�$�8IB3ac;�^X�]���X��!r����5��}˃��LW��j�����~`��ĕa��{�L;� x:�ػ+J$��FA���	O�� ���&�w��wX��bVАu9 %�l-jL����Q������#X�j�LI�h<GJ�&��i�MyV�~1QXU$M`�Ă@}n�Z�h��<ft�z��(�(#����+4��<#�@�a�����܍]M��9U�]����4�JX��q"bu�IHa2G��� �*���q�Ů1YT醔a��Fw!��'4sp5weji�c.�hF�4��5�a��=D/@
n����A�yA�q�`�S&$G�CI��vLϳ��z�f?f	w,X^���{e��s����OT��h�Un:#����F<�����^�;�Ъ�| ����`x���J��N2s7� �<��%e�(<5�Xx��!p�E�(�	A&�C���y�j���T�^�N��VDAxԈ���%U��bz�LG�CZ�C|���CC���TC�a�0r�%"^p�j>�3���O����Jaݰx�˙57]A��j%�a�&U�R�6UI�M���L(��¡˜A�� p�xE��A�J��1�������6n���PdC҂5� �*���#��� �Y�v���[�p`�W�W�h��`UE4�	ڼ1a��g)�����w��@3�/�WD,�	jޛ{���|��d�|$(�6�x
��x�U�&��ޟ`�+-�\�!�����K�{�cb$��1��艦��E�@�A�;�� EA�J&��a�|�B8/*bY	�����I�m�4R��\؟}��&�%p��oL<�T�i>A/ �L�G��� x!Y+!��aŻ�Hl��=_�T,b�IRa��S��HH��ѸO8!�]�n�SˉR8�2�(����o��bB�z�"���b#�C�L2�u���Q#:$1�������S5U��!��xC !&��]wl��@'((����5�d�
�����짔���jР��@�"3��FB T���?/���	�iU^���3����b#ؿ� ��5��64�ν`��Fy�R��_	�?j����)+�K5G|Kx�p�kch�6KT\�p*��2�6q7�v��1��Q%�cN�'��9*���A�a!_J�fE�I�L��X���<�p�$�`/�r��IS͐	�Q�!��2�z��"!�滗��O~��x^�X/�|��ݩ�$�ţq�Y����zL=U�%�(�W�k�"����W��r��K(�D�E�LS�;
����;���.x�7�7+�	Oӈ-�T�
B�9!l�� T��%�[4e~sNT	��5ls����,)@�����+�ӡ�8���o�ѸT+)@��f�������d(�b�O���؈�C��:�hF&i3L�-m�1C�E��H@���a=4��@��R�%�d�p�:�R~7g��[$���rg^x�t��H�
^V0?��h004:�4��X?�3}�:��7�}��I�_� �«�0��ϑރ9_�S5�9S��f�d9W´|R������;K%CPF B��!zH^��P#�,/�����P��o3k&�5���zk�¼�xͫyj�(�1��#y���jV����ᤀ�+�>S��X �!�*�)i������������AzU�a`�"6k\��D}�?���Qo�!j�[���lB�%hI2w~ޙ)�o��TdI2V��d��O��N�����L�У�;�'�B�Di�X ��S:�#�p�)�;�閑	��4���-p�?� \�V�'+źP`������}��tvL۸�4}x�W�Xg:E�$���ʃ���)�:��B081$ZD�Hp�c�X���]���5��H�
�W �0�AqBϊ���;���K�q9ʬV�V�j���y"e�6%�[�|;8�`R�Ձ��2dr��wV#SZ������������B�^ �NK�Ʉ��'z��*Lד~K$����ɝ��o��hX�.mS8�'&Lb*�� �d�ᗬ)�A	�t�$6ON#�����=!�iU�B��Mj�ᑧ����L��̈��lB j9m�p�S�_b�iXZd����!.�u�j�5�Y�`K�~>M�c�:�AP��2�~��]\YN�̰�	bw�d��a��s������?�~A��$�
BdG���P'N�E���=��bi�+�=�s�J��,��/
�GA��(m	2���0O/���j�`����V�p�`��^xC��h�y��jX3��*bd(G'�
�3k�o�)�B�JS���̱�Y\�z��!�C�q��U��`��e��^8��H
0���%II�x�f�3��!~�
a$�t"�#��ζ��68�VڏGc*�w�3�@x���zL	
2����Ec�B��B�+�IV�X�3D��3����٩�бzP���N�S�/�<���dC�\lΩ7~�ӝ2Č���(��3�8�P�<�|�r�S��X�    ͱgdd����ǂ@�=h�I1�Ӝ�Ȏ8qX��YJp��B�� t�m$��"'��}��r�S-D���]�VYF����7����H�+����=Ԍ �}R�O
P3l���9���9�~�+��H!��X	���@(?�s�����&��$F#ח��K�;��ʜ�LO�U����M�T�`��P=�a��ܻ�{�r� M� �14=�Ը�D<�J남d���R:/(�6��s����PI�42��K�ދm.���	K7ZA��05�K$��`7Uú� ^ ��o�y�6�1?�J ����B�)�8�a�F,���-L*�n:&�eCp'a�?�H+�g�О;X{��S�fFN�	�!V����I�I���^�	��%�^��;����t��=�zN(��W6Ğ��4᮷zb3��������2��u�"��� ���|�������/����H��IjB�c���Jr�YL83E�p�s��(5<�zsk{�����[��˔�ׄ:D��%���@����¬������x����x7-i2��^�gŃ���qR��&��Y�9
��X�Ɂ�.����N׉���;�(d�3��%��M
B�$e���㞯���30{��d�J�pnBX�n3R�%�"�f ��jTtɟq�7��Di*i@a5�L�	
�2��VHdk,��a�۝�J�U�~�C��`�08Z�����DR����t�����P1D��2�wA���/λ%ʶ͕��^�CԨ ��@�l@���M8!�7���)�o��Ό�@�'.�lF��"�ŐG� ;svXh�5��9�z�r�"�Vrx���p�	�n/ܽ����g5�G�$C��b�+�Ǖ`:&ЊcA���/̗�EΓ���N�[�2�DǌJ���#�����)4`GE~_M�%�X�lİ�� �p�uv��Q�����`,_����b?-!@݈θ����-"Dq���/PJ�`	��X����#�{H}:3���@�,���)�����D�M�����*�YJA�
!���$Qk����.R]WΑJtb����J��sG�L,�����O��Qy9`8�z�2���I*촁ҋu2nww�쿠TEoGp{�R#��ްī?) ������4we.�˪��Y�Ί���*��Gà�d����)�dt�D�Y�8�^�1NR��q;<z��ڹi��$1j�'%��V"а� �{mP4��_Ū�p�@D�!�	G�R�vA�w�"s�g]��{za~ 3#��,֋�dxBc�ЗJ
�-'�j�۴x���E�,��S�[p���X���͜���}��$An�w��Ũ��Lم��JW�a��FB����f��	A�D_I]�#:��L�mD�1" {6�'^����{�m��<�_ �F����?�^���Df�*]3�7k0c�@`q#�`��c$��C�L��p��Qf�Y�pH�h=�#�����v���K�X�؃CT��i��������Zm�Z}`��؆#1���N�D�ب�.!�oqxs�c�D6�H�����JB��Po��*��=����+��@v�3�ĈgԆ>��<�}��pT��|3Ir�H +�q=�	^p��٫�H��EsN� p$A¤��1)�d�ӏf��hT|~����Q���Y����Ž�� ��i`tT�b:&,!4�D01������Vr=o�*�(������z����mCB~BL"�{�fԎ�Nr�[K��(�L�iD��4u��V,6NE���F�$���vHz�X�'kY�Ĥ6���U���\�?�Jgg�>ٹ`�n2� 3L�6�Ǳ����J��i� #�V���>e����1��xH�l�2qJSD��5�NX�C	�r>�����To��S�B��փ�.Rmp�k)������&=�u���T�@(�߄v�ܛ���˫���L���Hqgi ��S�������dJN��6iE��԰V� �@�����p�N�[.���;9���4"�����ڬ`N1��s23M�8e֕pG��	A&�N���~E5l��14��a!�~��".:�#A&�a��vb���ui��
�,\ʊ���Hqܐ��1�¦͉�|��z�s"���0z�ݜįȽ�yE9��Sg	��H�j��� ���-�r�;���>,ҙ♤�Def,��#ux�s?�vdc�E�
��`�FN\��DMF�aױ���RY�,��dd���b��hwo�cڏT���Q'b�p&Hi
��=���&mJb�,�z�Jy���P��},@�sAmPʮ�s�ǰ�J�}���<G�����^&i��y(P�����51�/t#�u�D	�� ސ�oHC� ���A�Tl~2�cse�6@Sb�s6"����7�cA���H3vYY�¥� Gh��z���+�b}?�x�@�V� cBO$���	̼�kA�"�<S���I����!�JXf���}D��}P�j 4ܱ��N��lOB�����t�[���AI��z��B@��,�	A�F$�_�7x����T83Q���()xI4��狯��>D�w3Z�� m�V`���(�_��oFt^��9JG1z��
�'s�s�z�P�#�)�Ft1�*�(LZTQψ��w��3�-#'�7��끗��X����V㻎��'��Z�b}1A9���O�F���0�8�H�h���;�c!㥝�H8�f�E<4�k�*7�ܝ�k� L!�D˨:�VCGwѱ �c����YvZiG����'��g�mȼ<G:��<M!�@oRh-��(�+���>l�!��"�
��i[bA��s"U?��iF8�8����k�V0&��9(^����w��a.O#7���@�x�h�	�$q��
�؃\��ƻ��FT<�����~�^��A��!++��</�x���^�k�������SQ�
�`T��;N<�B8LN'�����N6U�F(Tyt�����q�
2�_��{��-�s ���`$���`)=�W'w�:[����+�G�Z�Zwh��WC�䘬*!��rh�jp��L�m&�F�@0�'&� `���K$R�5���%�d�#D�Wu��A�B�ۿ�\g]�%���r�[5��♫�1�x2_�������IC����-! ��n���)��Θ}ziy���wM	
�@��+������9��h@���>
�}��x�a͝�.e�W�d+�dA)�f�	"�jw;|����(�p���[^C�W��4B�K@�ٳ�.��]}��f��2�������۱ P����^��X$�1%����%����9�yp:�T�T�h���
�^U�Z���e���l ���M�b�M�0�.�䧿6	S�2A��l�P1&�H:]w�l�,�뵏/yql5��Ǡ$��e�Ʒ�D�Z̦;+�Ц���vmlǹgj��of/��7O�/���ࡼ�b]�6�G����1�l'go��C�8�%�����+�έqՎ�������^8��o�a�>�L�]O��/�<F��	�7��� ���3�~t;r���˄�j������)�����*?�ӣ�iϏm&W��������0 |Te_&!��+�?bDť����+����4�Y�ӑz~��ں��D>*nY������3��R��������mf�~r
�-� EH�%�lc9'�X0��1�j�^����D�fK��>Yw�|���]�\:�C�P|#7��_U�U�7]鵹0fo]���N:�����t4hhu׏�^��n1[S���x0�Nߥv��U���9��ګ�K�r�SR7-s\���A��ya��EԿ8��7  Β��پ��Z~~��'��{5oԜ�z�͝�Ck|T���iX)t�]}��R��k��׹�+�f.^�~X1��j�`���5N�g�����pP?����λe��������|�~�ȾX��듵�:S�;��&0���K4\�z�`>�{@�=�_�G��    ���-s��{0V���е� �0��{F�}"�X�,��|wֻ�u��R)__m2-��[}z�WF�{�<M�j����8i�(���$�o!�ӿ������o�Ș
�tD$K�1��oaM��W[��_�d�Z��>�4���҂�'����5��w�$��p���5��:̓��e���88�<ǭ��A��I��3�����1v<�C[�Uּ��w���3buyM�>��u�}�7����ϯ��V��A<��3Hf9D���c.�����ߧ�)�lq� G/������Ű>1�~�����H��([ލ4{g����G�֪�?��]�k�Q�k}o2?l����'�frX�2��~?^W�!�F�\X��p�4���|�X��Bv]'���a���f�����~iz���j�V��,Vcݨ/R�R،��,_�T���2H�*,}��L��qV�_yk�UȪY�K�%w�Znۍe��ۮ�������ⱞ�$�/�m�YH��W��v2�fa���g4��v�.���1���a7+���-K��J����X�:�>�v�ݗ=X�����6W��~{����tN]���X@��D��P>9����x3���~V�9�NE��.���:N/ï�i�q���]a�I���vo�������L򚝔�˒*Żӓ���Y�M�����6ۤ��b�T
o�l��za2.o���������O�G���V�ΞXA�5���_�~q�1�*�,��O8�c�W������u�Z6���Hj�/��o�:mkےFzR���g��rz����o�I��D�w�ٜ��<o�d#���*	f�U�,�Z��ڥ��m�����f4V�^�5���]��mU�l��q���i=��n�2�pVbqT�=��5�l�f*Fݠ�E)�|r��f��_T.j�ˮM�T=�˟�.=[6��}7�k�M)�G8��s�q��+J� B�xʴ��_��F;_0S�)s&i�A��?Z)?̏��]�̤SVn�÷�����Š{0����X>>�U�b���U����V�L���x�wL�\TbQ������^�bh�v?�������{���I�������ޕ���^�^Ʒ�~�qu�%5��Ϝ[U�����_�bm�G������*ݖ0�O�FSv綳j�V5+U�����_�N�6���|�/�������99_ڟ_�����޽��m�_���� ^CAr1dqK)�ONЙ�w��ܼ�-5��6}ճ�w��p��3}W�Ͷd������T��n�#��~rg���ﲴ�
}�{ �
O
fēMU*o_�M�5�f��7O���7�=3��S���܊�x�tN��?8hM2�k������_�w���.��b�$���<��k��UԚl���bUk����l�Y���y3t��Kc�l�N�l��kޟm���R�]���-�7S�ִ3
3,x��+�T&I�L}b$+o�u\�T̲��ӜYߡ�r�x��ڧ3��_�VI��ݞ��]�{~=	�'#_2y���Iy����q*Zd��a�4���jT���˾��梾e�^"��:�q�5��ǆ���׼���j�a�����?5�_�iL����''�DV��n�ys�}�깇�<?�Ũ�Q�\���m}8�h��C�s� s��R���מ�������z���p=9�g��ri�Z������?��Y�ɵ������U�}��u[R��t����t�𛿥��d�Wv�^���Wm�]
/r�K=q V�ڭT(tV��8�v$��X�Ʊsi�͉���նj�.��=�K��?���i�0�0�Q4_D�W�_(b�pP����cg|��|m�8e�N�w?�n��V3�����>z��\כ�[�C*�7{|r�� i ��En�G���(f��J��$2
�餢W
��GV��:l��ɩ���Y������o���յz�Q�7�6�-��V�=U�`��>���bV�m��N�7c��o�=���������j���oy��~cs�oܿ�JCS�:
�}uI]��a�H|���!�;w���zx�{�Y�\�'�rW?���v�(S���g�v�	�k�~���IΟ�%�81���׿|Ю�d���N�O��VC��*|�Q;�/�L���L���m֔���/��m{Y�������(�ە�E2�����>XL0�U�2c��ϗ_۔%��(���qԇ�ϛ6�|�ؤ��k\���ql7Ɵ}u�֞�>N��U��8��?_<㑑���FtC�� ΔtK��}=Y֎������Q�R,~|�O=�\6�6sWe}G��U�O�����N�QT�{U3��?��se���z���e�S7Hxȓ'߿�X3��\+ůB��>췭�}=T�ʘj��h��_�+oN��������,V���K����<���1� 8$�|r�֫=���;���l}&����Z�[Gn_�&�{��7�ۅ<v�vk��[��f0�%뤈C��A���q��1��͠�$6{���gu�����N)[Ѫ�s�3XO�v�U���.��+cp.J��XH�f��~���𙣃3��T�K{��3e)
[�ء���o�B��M>��L֩����lݩ۲?FͥR'���R�;}UT��h�߷ �o��2-'3�F?g��?���U]^�YVT&��hl����]�١��8�`)y����w��гKzrF���n�g�,aL"�S��	)��;�[tz��zg�͎��јlY�*�a��齯��Y����UU�P>N�����ov�r�&��0{�jP�UO���ZY���e�<)_I��^n'��T�H��W����Z��ճŤl�N�.m�瓵��A���RNRdYX�,�r�x��y|)}da+���n�}L�m�*I֥�?��͒�7�"��­=?:׋��ۉ[�G�J �L$��|œS�0�ԧy{ݔ��,����x��:��Wev�,����l��Js)���(����Y�m��HW��9MQ�0ɢ<1�kQ\:Le�&ɒ��p�>�R���˛���3���mS._��+}L>+�_"�8P}-FU�֥RC��2}2jw�\x4*E_�f��Ne7tFUc�]�95���&��N^��	�6�?�������E]^�b��d�����U�x׷�G��R�����N}��#��wl��H���W�f�|����n���=o���ʿa$G�����"?sT�^�?-��5{8;M����Ჵ�թZ�e��&�ն��+���v*JO���;�aRZ�L�?e��	�\�j��=^-�ɦ�#���&���b��r���յ�ݛ�qx�[���X�_��eŴ�{��hu�OU{iu�Zu_��*/[��fXi�Y�#��9;���V^t�D���_"Q��)�n����b��R�I�*���7�����6���\5����0�'sSd��wu|y�hү�+0Q� J�_"��?�7#=I8ɟՒT�amv���-m��[{k?z��k����Y��w,O�尻�Ցz�K��d����x;�Y�����M��@��/�bx�L(O<�v��_�}Ϧ�Qv��w�ÞY=~ɚ�Zz�F�jOM6��c�;�6�����+ph�m��g��~��7�W�� �ߣ�D߁��l��C}�!���n�?��ÝfK��Q�?�;�}��%�?�:�`�
�Vy3>�y���պ]�����m,�S��3�5�#],��c�)w���)a>!���M7eaE�������`0]��2Ȓ�B{Y-+o޹����Qu�����}l.�-���������g�:�#����fҮn�G{��@�ؼ��ai��<�z��1(vu6�^��h�v���V���ڏ���w�݊���ϼ�����<�G���[�b�
�W�������]����`�0~ī�J�/���<9C�V�>a6���gm�[>Zv���u�����s�Q���s�,K��r<�E9�O��7�L���	�3��K�����I��&z�e��-��V?��e��y��<v�Ǉ5��^ߖf�����ړVs��?��ћ��X�s�� ˮ>��Ur#y.�yI�O�X��D1sd��Dm��mtQ�%])fw#�[o��^z�5���8jv.��s��#s\�%�Z�(�e�ɚ�n�!��G����Ë5��?�`� ��ٓ-�:�uG�Yv���^��{�Y�ʊ�=����Z���>TwtV��Rǜz�(�� � �  B�����U��H�VC��7�O<�#U?֗ɞ\7ͬ7 �[��aJ��*n�`�ۭ��A�_����P���۾�9�z��I������Պ���9#��C�ՓR540/x�8�ٓ�P˫u*��^�n��u��z�b�S��R��ƫ�Z�9i�ӯYsC��2_NK�f[W�ǁ��6L�O�G&�����@��~E	���φ~X�KG�UV��0k��/0������)}7�ͣ)}�������p���}����9q��f��/Wx�J�=&��'���Q��u2�����J��g-�q����d?l3Oʞ�wK����5��N��D�#�"i����v��E��˗o�,��w}p*���z�̯��V���^}s�N&�6l;�E�3��7����<0��%��H���
�>�f��i�l�-:�S�}^��٥����vur�����0r���L�;��AO�Td�ؓӪ`*+�2)t]m�͏��sh\�QȻ�z�G�z�:=gU�n˥�W�Օ�:�5/�*Z+A��k~+���Ɛ�WxaON��#���O2[~������>:����{s5��5�Օ&xe֮��3e�8�'�Z7��d�2�9	�bF�O���z�~l�{E�~6�T)�����պ�l�o�Nƭҥh��e�s��Ŧ�k�_�v_�8��K�X �ɺ ��?���_�J��      �      xڋ���� � �      �      xڋ���� � �      �      xڬ��VcI��L}E���,��x!b���G� 	�Ϲ�r�n�*9���k�Ί�Ȍ ��v���v77c�m��1�_\���/%I�Ʉ5R�?�mL��t����V*]���VUf����R�Xy�)m+�E��٫�r�����}x���N���ޗ��}=ody����L���&����z7�6������v�Hk���3]E^)mj`N�Z��5%��u2	�/ʛ,+��'Y�ǘlq�0����y!����Ώ����~!\�@�~1���M-%�������R��`u1��d�֥d�B�9gǂp���*:Vy�>�7Ŷ�����xx?�����!���=7�B"7����`��C�M���	D
�<&s���DgY�N�$b��Y^��E6�襫Q�KN�-��϶����L\�r~�g���j�������@�/m7���7^I�,ث�T���ha����\�6G���*^�M�qV+Sޗ���[���4ek���Ϻ�p6��Ͷ���u�%$x��� ��U�f�YRL'Ɗ1X����ٹ�2V�(�٢x�V�Q\
I�����ߟ��O_ζ?��c��{���|1�����s�w�7��J��w]��'�-<Kϕ����*�apX� P�pN�(LT՗�����)�2?�_ם��4�w��ǽԻ�]|!��6��_�o*��u?߉�+kT��	�M��YV>8��z̊aYD�_S�pl)������&u�t2����~���yuY&_H�w�#�n�?���K�6%|b�Ys1XEY���ge�"��J�/XO��)v�{�����읞?���R��y����|!��7��_�oJ�X��w\#t梲��B���)���*F� ��,X�_/.&,�l��Mq0y��u���aG��t8����<��y���(�c���7�'�Z��
A�D"�NI���9%�L��
�Dn<_�._�!�h9W��-������d��;��d�'���׷��
<oB�ϋM�g���,a��$������#aE������C��Vc����Bg���zt�[���k<C�?��g�{��
�I4��_�m�s��W�Z+�ed�۪ȹ�#�h��YC��X�JȤ2�I��-���w���vO/Ϸ��_N�^�|o�vJ�	E�[�9�'<KrR�(%�N(oe�)q�3��u.N��3	&u6�_Z�Tio�=5'���k�z���3��/����P��U���ͦ�?�e�5{�y��d���!FQ���ߩ��F�3�h#͒oo���8���9��bv ���׏�^C���w(Bl
e���]����z<?��	!��Wt���Yh_c�o ,��E���m��OwN������Dh}1�q'�o��ly��	o��̏�Z|�"��sAY����b�2u�Ņ��J��\0���7ũ���
x�1!ƣ���m.��H��m	~����@�tR5$�$�~E�4�&|0��FJ5�fp�p,��X9�`���T�r����h�lzp���y���P��]�&W��&�� �� �����X%���9O��IA�(T�=��
�z��=g������qW7�Z�c~p`��
2�oB��a��J�P�E�'e�Ffk,��	 �r�
HlI28er�%�Z
oo����vgyy�o��hz�?]�37~^0dz�~����q�'�O������A/E�2�vX�Q���m��SX,��@BII^���m�C7�r*�����>��yw��
ߐ�d/8���rn�"��+�G�PUP��<��Vj%����!E�ҁ����;o/wÛ�j��d�.�3�4��q.�P�s3�+�`�)��|������_[oq��@^���R����X��S�s:8/bE`*��#S(V�7*�FCot�Mrt��zy���P���rϻ���+�%!r�B͜��/�6%�P���)�e�aC����5A:�+Dn( ��e.aj��+��k6��I���Eߍ������������5"�!������2�ο��V~���_W������h���������B!]3D!��@��R���.I��y#��'�]p�P���`���T�w�a���=9|���~�;���X�~�/����<)'�����=>���T�z4���Њ�T�&�#.�:���o}N�
�� -��@�����R݌���d��p�xώ�����5�IF��έ�����"V��Z����0�Q���)-�<{�V����ho ���G�>��?N�-�=ݨ�:>]ܭ��i��qBn�7�3>�a`Ж6]b��J�F�E���px��H��a �AQ���>9��^������To���x���X�s��>ڿu�p}�?�<P�����"�2P�0�Hn`X�p��l*(Ϋ����@���K�|��q������zy�ϯk�s�����|�ӿ���ç�/�'��T*^��"���hB��fL�#�y�jBnI̘lY{����~�z0}�y:���-_������h�bM|���gZ�/�	S���v�jUP�JF"@��,���U�Xqnc,���@���s���p�al��0I�������P��o%B,W����)[���$24��>l���)p�
Q'+�	�*�c��h/������2��fx�����\�C�W�k|bC�>��&�g3���/N!Άl@�\	D'gz���S��P"hq�5������k{�M�F�V?�_/ө��e8>?Y^��u~ ]Q�����&L���b}֌����1�����P���K��ğzϪS,�;U=�H{m����������x�i��:�����t�Om(��'1����_�0�=>_w�cYk�Tx� [��u$�œ�����yd�̂�jo�Y���s�v����v�g7���vg�~�Ƨ7�n��H�\
������W*���R������tv$
�KJa�3������oo����{����wuv�vj��������P�����w��_lT�;��<����X�C�s�v���QP8���S�ˬ��F�C9H��zp1��l��u����:���(���V{�F(���/�!B؀���.�֚����Y�HF͠��9�d���g�R�1�7��u���xy��f�걛�ս����ϰ��6�k��$�S�n�TY��<^���\(�@�/vu�HwJ,$�b�*�3���ۢ�(gKѓ�gw{�����#����j}j�7T��6�i�V���k�S�#zy|R�����D:U��ǂ1��.� (kB����feC{[<f{x�x�����jwz68��y?<{�_�۲�d%�
�&��?�C�/�(8A\SAP֮ \�
k[]
�<�	S�����X)�E{[x����?|������q�%�O?��5���Dj�Цr��+g�����?�X�98��_E���,�E)��Wm
/H�����L³㯳���~���鞽�n�O����uқ������l�&ߐ�TvS;k�����&,z��sƂ�����!Q#�+��!���7J���=ڽ�������}�9�<��w[��5����p�ڤ��~;\&�R�yq�����+ȝ5:��H�*"�AYC�ٵ��p�ON�F��������}y�o�����hGm�&�����,�����AłC:4�Zųz�|x Wy�!�Af�X�*b����h}�����a��*��ۙ��/���L�p��y�t�+m�*#���4z���MN�1���!g����-�%n#�Ȃ��( 5x�s�ڛc��ؚ�����;������~9y�=�јm�h��&�B��% p[!� ����cZZ鼰�8a�bH\'ȉR3@�����[�è�d�W;�-v�/?��K�Q{�z�nhۀ#�/n7���k/�'���(���pT���o���
4��@4dqR���K{{�q���b�������p�����{�Z�q�5�(�ؔ���H�'ȎIx!�F�D��*��DRQ	�݂j�č�c�$ko�y�n/w���������H�����q�oh߄c����k[�� �b�����'�0-t    \P�LB���P	MF��c�{�a������K�������6M���5�Úh,�[+&����D�7�	�����F�!�$�K��Iho^M4�jmf���=�����Y��q~>xr�G�A�w>\���7�(�K�M�^��kMK�U��.�Zі@�n��
+�:�T��=+��.IF�7���b��b�?N��NwǷ����Z�v��pĆM8�8�0F���\lx��܌5E�Q�2	:��t��@v$��b��%�"��TZ��ԫ��b�u�~��7�����f�������0�w8
�f����"A�H�2W�b�5��
neB�<�����:���,Hf�Tio�Z[�����Uo�|�~D�p��fk8ʛp�/�7=����8�ה!m)��a3�b6)�u�[�#����bp�:L������������tk��e�����A��fGo�&'P��'�{�N���WV"�.�3:SsT �:D³�U�*�	�N4�����|�k3��n��̟>�^��5�a�� �M�M�g�g�h�IW-���:pC[5J9��$���(U�$��3Tu"]no�������M��y�w������������6�h�����W9��P`t�J��:�`DݡV�%�4�o����� Z�g^(�
�Ab�%���q�/G2��ޚ��罝�ыу���0?I���,6͠3�?��e�xĢ�|��`�Sx~x>YddS!�}����qR��q9�=����D?}���v}�o?�����0�	���bSI����q� ��*X��J6"��!4�1�%��6%� �D������Þ�_��6����"t����s_h�,k��T*Ÿ���,*sJ���%8qqf�x��Y��\�S����rwUi	u��(4�Mjo��nǆ������^����ٰ�;]P|��8�P�=�C����C4�f`��L�!����"Li2f"��V)���xc�oo����~|~9��.�/�'�OO/�z-v��h�q����2���&ᔺ2m%��Q V�RT؀�Tc�
G*G�(2��Y���������8����Ô��"v�/�ׁ ���(Q�im�����i$��Hac`�"�����Š`x[-�+�2����T�b�[��<O��>��������/�/�۳u  !��	G��l�s����0������NEd�����sDv���;��ɐօtKҶ��n�f��;?�x�ݏ�����ڿ�]|ܭ����H�9�lSh��������h��)+Ej0|�|�=��D��,�B��EGP2�����^��m'�o����g?���Z��G����_lU�΍�_����|C��f��d�bA;���#p�`f�U]1��|�ds{[lg;����^���VOz{gvu��"`m
��l:䀟���rt�A謢��mVS"O�����ɤ���z�[%����)�'�û)[�����7��(\ݹ�5�a]	gtA�k�(Ϋ2������G*��X$!@�r����*�����*T�ś��x��{�:��p����{�tܝ��]W"�[��hCM�7�OGA
P�PW]t�Ntz�Bӎ^BF@,����U�ɂ%fp������/�wO,<v����>��\/z�~}��m8քb~q��,���9"�)�JWKdF|A����B)2+(�¦�� �P�W��{�$��"����������T��іY�����c�o8ބ�hcP|F���c���Iyv�@F#�Z 
�zFʕ�ӫ��C���Y{[t��إ�ϓ�Kܽ�����awK����'P��8�[�&�?��l
9� �h�/̤�]HJ��u���>k�_��x$���b����1���콚z��7�������&���&N'�i���D� $V�5�Pу�\�u�v�"6�館�D1�	�"E��5oo�m��[��7yk�i?��k&;;���<H��E
�o�1^U㡀�1*��)� �d���{��`*��D�fNs!M�5 �!�����w���|lO�o��ri����K��N7�(J*V�;����{L�r!؎��@�~ZA�"��rP]')������M�V�x��$�����}�j���v����ѺR��5S�\�&!9��	k9���%�<���`�IY:�ˊ�]���݀��ut���-��������9^,��^̷��^��o�n�f�������u?�
��	�g)���U�$,:��a���$�Bԑ(�	a�˪�-�o[���������ǽ⓰�_��t��6\3�+�m�DZQ��jq�aL�)�⪆�%/��!q�^H�m+�Ut Bg��m�\����3������?~M�{]��P��kf{E�rSk%���E:��V3/�v��\dRj��G-c���*��sho��v�)v��ə�����=۟��t{}!��7��R���(~�t���=�4O�b�i�����XP���Nc���scd{[�;�?=�g�Q�����I�h������}3�+b�I�[����D�vxU��4I�Q]p"S�AU͙�1��-��H��L����Kq�@����޿�eʷ��W˓5���^Y��i����T���r�7��� ]aQ�h���r#�5�?��zզ�zS<oo���b��ݞ���>�=�W��u� dz�L�
Z�oR�l\�a	��+r���0���T)-V�e��`<	��Ě���W���v�o����݋���L��?����uEm�f�גn��/��B㉭�O`�r>1	&B�BY�d�v�����}&���D�"�`{[x}�yw�/��%�㳋�q�i}���7��Vt���j#S�������J�n �7D�ݔ��`�Z@�٨}̠���-��N�W�W3ק7��޻N�W��|�lx�;e����|)��#U���p��`@�
8P P2W����.�Ҧi���)^������R^�����񁟝��oÚL"��f���� k�M5bB����� �1@<y5����sfoE��ե�-^vK#�}�y��ϕ�oF�sx?k(nûߡ@���h����f�UD,�s8@�+�Ԃ#��ƥA��#V�/�rq��-������ӳ:M[�������q$�����7s�6H��`0��:F0eQ%��A�W�*�J+b�u^h˩%��.���:P��A*���/���2�olw����c��Y� �s���z�W���?w),UWp����)Z��Vӭe:Nt$�%�?*����x{c8x0����N�sp�2��yڏo�`��K3�k*�ޔ�q�3G*�]���ᇡ:�8��S�\<��t�_��V�Qs�J�a̴7��P�!�읧�EZ��$���9Pk,X~�{Mw�4�4���.QR�qM�k�l��F�܋�A��-�R7�����W�b}��1������{��&�V-v����A\'I${�d�\m�A�o�rD�� �G��@>�t����洠R#%r����lo��ŏ�G��w�����䙅g��v�X��&����D�~�1N�
�KOù�JՓ7����H:��Q��Lf@KX*��1^g�ǝ��r��O����������/КL7� O2�I���+��]
Nx�p R��2:K�}�� U;*@B�;�����=q�rz2<=�����RwD���]�OG���7��Um9�����y���,�'y�V7I�B!b�$��l��@�Wc舐`���v���Pkd���s��>��x�k,��~f}K���mR���H��S'	i���@�V��BDJ(^�R�t�
��z7��1v�^�ȴ��9�����t�����5,����U!�\7zPI北�H�E��n����cؔ���ja-�+d�h��k{c|^��0>|AB-)��[B�c'����B��6��:�Oߏ^��_��M�
�aK��Lׁ�Ҟj��C)s�5&G��1�[�xU��k8�=l�:>8���N��9�Q9gM0�H���4��8��f�V 8��J�2'�
(���YA��*Cڋ���������[#/���u�ZL����~����I�����    9o�1���4pP�h�tD(��z�D�]o��#i�9��"�P���3���Z��֐��������ٰ�����p����&��>�B��3m�ʹ�:�U�mIam^���ؔ��A}�(��io�tݙ߿�O}7]�,�H��N.����� �s��B*�ݙW�P�8UG�
2�	:��g"1�}�)�3c���T	`�&��b9�����j��?�vn��SooG;��~�A���w0�o"�*�3�y()��?+� X��T��T��Ԛ�HX.�;8�����
ZNho�����n�^O{�����y�w�4�~}�A��	Fҙ�������	�bL�-�*U�X�Y,j�ǋ)5!�T����`a5yy{kL�7��rܕ�{ݽ�]>u���v���?7M0��*u��e4]��6eeI�U��+���կZE}	@������P+�`�������?]�|o��Iw����i�w��`��ϛ�_JJ3��7��i��������脦��؈�h�%�3,����[�S���q��ғ~�f{���^ gN��������?o��HǰU{��ѱ7��D(��C0:�"��3�,+j��%�_BV|Rb�������뭋����mv6ܞ�q��ȃ->���@��^׸�h.U�ty3H�MT�"J�Qj�6��Z�Q8@��
��"�����pz�N��|,��g��h'���d��O �h :G����w	R�yBns�zi���H+�"�M`R�'e�UAQ�,%���ⱶ������ȼv����N�az�G���~�驪  �I ��E" 8����r��V���29�ϣ��,�2��UYa�w���&�7��>̯������C����ݵd=�����z7󿒔�]U�If�>���#FRͭ^u�>��T��~_
�*��N��Fg2�����ɀ�����ْM����7 �$ �6�7WMP~Vj���d�3�!��h#�x�#�y�D�㥅�e
��G[󺞧�1��t<���N��\^O���ś�Ƃ�/��_��0A̼��eb, 	I�����v`�ਹ_��Ǩ@BL�j=��	��[�v�/O'����+Qg��ܗ��o0�����t���7b͎n�c ��n����+Ű���P�6W�!m�)�����V�(��q���rt{x�Q�mvx퇽���������\4�f�OΌw��Oǥ:NJ]ϓl����pTƊE�d2<�\+�1
�FRu}I��5��7G��������\��'qgw��?r?�����D	��~����6Ѯ�����J�baO�]*�d�!���z�$	drP����Vָ�������Ô|t��W�vO�>��� ��f�׎NȌ'���� �0��0��:d�K��x��eA���2�i��_�ZY��:w[�y6����U����l<ؿ�&3��\�����h�	��F�w�jc����/Tj��򤷨P���Q���T�.Dno����쩯��<�x�t�ì[N�w���\�_�&O�d9�47��
�aQ��Δ$��;���S�^����R� d�wT��[{f|�q�ݫ^�ͮ��g�7<�7��X8�J%O�
?w˅�I�^x�A�w�yVD�J$�(s��T��-6ѩc,����/�G6���F�J]��?�߳o�/��M0���:s4:�
#)���\�dG�F��ڀ��U'Y �(_��P��19u�����ao����M���x�{����&I�Y!�5�L��q�II^}��
w��)1�ѧ�b�1F�%C�K�����[Yc��N�[���ew��|�鷧n��@��3�2׬W�oH�!��HY�:]8&���`���"�F�ҡ��h��mo���󗏋����hr;�{C�/��?��`@ �n�1�5c��;�t�@��+E�+Ҙ
_�ƐD	�K*��O���U������Ӷ�F8�����W���&/P������$.M�%ef<��I >�����0�IpX�\k@l��tJ���ѻ�+l ����1�|x�oG�{����]�7�\;�`@ �m�A΄����gF��P����(�Q)� ������ ��՘9\�Ԕr1R1O��1z8����;%�;���wd؁xs����t,Գ�m:��� �XJ3^�����l���
��lr�S2Y����X#L��*ke�Y���/��O}�m�2�h'�`����O�Z]�g��?-]���ʓfâN��Hq-��N!O�jWi��������i�Eϼ���IF��|7>��3�y���輿�:�^�b�"��ݒ������n�RKr�(+cAk�/u'��t�m�.��arϣv
���՚dvM�����5��b��r���[z�ߣ�_��q��c,����fՑ�v�y��������X�	�N�K
H��Wj�j�0�"ul+��qtw�����dH�e��ٻ^|4����f��`$[3��Fu?U��\";x��fJ��rd��L����f(dP`<��w�3�[������2����>�m���|^֔�����^�ΰn�l��Ĵ@r�6ID¢�������,P���sq��d��2��ϓ��^�7��=���������_ab�����րߏkK�����rG�m �l�z�U�Z4ݿ�$�],�B��
���߁GjU�c<�8�ۿ�.��k=��_���`�
-݄�i�P��Ʈ\G�q���6hxǲ�Z����~6`&A�`��<4���Rۛ"��k���r���O���x�yQN���;���߿��Zy���(��p��L�VR�Ŋp����z�C�:pj ��LIT���p�mQz�ܟ����P�g�;���rgׄ/(4�6�h�m��n�Y��PSv:#�{�<��
g�2hpX�B���b5��	�D��Y]hhe���Bߜ��}g�|�Zng;i����]�VP�kGȭ����v�B�vd��F2��R��ꈃBZ�L)�GLNT�������&�';������8�����/(`������ӭv��V�o��ؚ�)�0^Ҁ�������(�%8)5*����1����s����#o_�����ϙO?���3�%rC�r�_I+-o��W�o�U�*:��. i�YT����a�D���īZ���m�09�=����93��0�̻��y�
(��?�(���Hg�Q�t56� �Zb2I�8@��s�?� �-�)�j�c�m���T�7�Y���۟rg0y<Z���o���0j�
�� _1�q.�9�)��n�(9$hrsGw!�(����"�� ��&�B��Ł��\�h�<3�I��Ksෆ���	w��G#���5�Ő؊��\ZCq�Ph�U��B$/���2`ɰ��D࿂�����������8|�曷Qo8M������:�q��[��Q��*���p�W�<O�B��!��zS�Ȉ�#]DV����aX�bi@rY�.�##�u+�VV���p1����ɧI�wNv���ϥ(%h\��(�n�.x[s��_�+�W���l ��A���$]� ���[0A���ko��}�t6���t??���g�����3�J��,��T���T����^�����U��]6��ֹ��U�����rW*��A���ͅ*�$��8_��le�����R��֫%3{���zF�4M���6a�U��J}q���p�'��$q�A��U�r	��hP�f��Xm���Zͺ9D+�� n��n��<�v?�bVߺu��E�3��@�@��W�'X5"ZM�z!���,�;�?-�4�t�A<t�P}�"����ex�A�����V�F��/����C�~[ 
�oD���'ӥ�������=T@4�HBF/x����F���V��%�0xC۬��J��ו���4O&�����s��)S�Gap�С��i�7��
ԧ/�~)��l*kO��x�����tU#�ӤɡiBA:u�Q�r�e���!��ۤß�?��t���,�������=m�I�(K����H���ۯS�    �(#�S�ڀE㨻���#[�N.�Ą�U)�ކ6��W]{����@��W|�����-���}q�֯������8��m��I�)�/��i�AhK�&]�'(�U��X�F��#k�8�@�@.�/�du{���tz���;��;o~g����	�&I[F�1n���ș�[�ڞ,��/���'��3*">���#����H�����.o�32�&�7Ӳ�7�e6�����S~����r|�?�&4�Yy�ƍ��i�X��|�姾��nb��l�U-EtW��IM�yjZ�e.M1��jM]S�Xڿ��N�:����ww��#�󼫇����Na��=�������6/��:j�a.�NY��_Me�{��(K��;pNF����V��i m���ͤ{���^|����^�խǷ�o_��t�gL�2TZb����,-���~��tI7��m���"r��<��qZq$?,��]�V�X_���m����h���󍋝����x:�3��Gs���^�(��G��*h�7`�s����A[Z���TM��\��I�I�oo����������ŵ=by���^vo��xh��&�����e����C�! ]�Xo��=M7���I�$��=�L^@��\'�Vy���'9p]����|��v�����k<�l����i�.�6��u�u0o���|z�G��D�$�J(��"�הSU���z��Az�Tv;�p8?�������{zzd�i�\Ͳ&I�J����k?�P����<��{]��Ho>$��"m��V2�~��j#�z�|+�,�?.�gsxЍ��g,R�us�����fy���.Ve~���fh����dX�UE�]i}�.&)'X��5FA�+�z�D+���M��������;�����ՠ��C3�E�׸!e���3���f�Q�1��TV�V��3`���^qG��+�T0�=��r���4�"�/��nwO������^̟�w�x�Ьl�T
L5_���e�����]�H1x������6q��Z�[�`�
̱�Av���m��tNϏ�{[yڙ��m��504��x�K��j�;��P�:$�j��E��5E��֒4Td��	�ـe����8��;�7�&]]�Ǘ���������Pi��a��ǠK��u���O� ��������� ���)2%GN�^<G��4уf��Kh����)�E�7������d{�Oo�'����ӭ��M
q����Jj`l5s����U�	�S����<3D ���*�����m����ѷ����Q�f;�v9�����Ĉ׏��Dǵ��@�U�Stb��%��ſw���l��l�$b`٫��#d5Õ%5�Ӗ�B���dǑl����=��><-�v�{�?�#?ۏ7;�=���8n���[�.-� ���j������w6����K4̈A,h��f/�`1������*{�'f0�����i>��t����[�g�aԂF�q��~����gPʃnq*�#.������T\B���AfvtP�Tj�����35jo���I<�������]�����3�>�#P��q��Z��p�)��3( � -1�JWc����^�) V3?*$R���(@� Gc�4��퐊�A�*�J��AC�8�*�sJ�?��+E���������A���=�Kr��z��@)�Ɲh�Z���0k����{�P�%JFGU>�zE�V���	4*�,j�xU`j{��t	��:�z{L�zs�z�����(M�Ҹ�MP�6��hR��s����3}��j � ���}��&FE�iE���b��[�����~����������i���$P�ƣq��V�7�a����
�%�H��LD&@�Y��Igt�,�-�R�Eӆo�B�պEU+������W�8�=�|��C�(6�'P�f�q���,�1��J���i����o�plR�[Hm�9S�.eOGq>� ]T4sa��u'�VV�o��n��x���;b�[���w�h:w�
P��U�B:��x��\Q�9�z��K�
��9��S%&�����*���x�w���kswf�nn_�gď��9i��&(zY��	�� ����GPq�$��C��{O�t1�����Xyp	&�w\jo���������a8>~��<��?��$j��iܹ&����L�?�>pAK�?
�	D�*	��*�Z�6�F$8�p��Kb���Fٞ�������p����_w�����f��ilw��IQ[A8��ȽBc]TÍ��A�jf\�uh���4��!���X�T6pv�dtW���]�����K�������v9�����Ɋq4<�{�;(I�Y����ŧ�L�cx��y� nQhg�z��X:Q�)Լ=��V�?>fy�.N�O�ؑs�Ku�����lV#Ը翃�t������[��\��i<���&NM�`W��PHik��9�QYs����*Bw���M���E�~`����qwA�R�^�(�I���!���A�r���ާ\����!@��5�q�!�(^�L7�B���U���l8}�b����|�;�x98^N	��yj�7	�X]J������JW���E�����W!D���2`��%���R�n��"	��Vٙ�,��]�O��{��n�O�2Ϧ��ˌ��j�7	�X�M-��xS�DH�B=�VSP�ʑ$�a��)��s�����$V�ۚU�g��[�BO��f~���g��v������[�SF�l5���Tl=e�wLD�-�?�P���P2>�F,���2��:PQ:'������k䭌��z��q��x��\?.�Fu���z%��o�	E�� <����.&�@��T�x�N�*MM��v�&o0�Ec �Bv�N C0��b���F�brtż89�^ME}�?�����|�7��Z�T�q��4E�*,�ݖf���P��P�������/��z��;� ��v�[e���~gw��xv�>��r�j�z>��|�)�}�|B��*!%���`�>��K	��o�����I|ʛ�S��b������O߭1[Y��u:x������Ǽ�X>}��0\��/ݫA(�OB��~Bᅵ�� �BB���4�Z]d���
��fG��M5ԎT�&����U.?���s��d�ގ�]�������h�r殺�o�����Ԫ���Oݸ ?0�P�PH8�V����9u��>
��e�Q=܉.����t��nhy5�O�'�o7����r��~u5Aѱr�w]�/�U�g�4Y��.Zj�c dAL���F� ����RO2��X{��ܾ�#�;O㳑��y�ug�nK��]���h`��jӝ���󃨁�^�h&v�vN�0��%K���F�-�Q���Y�+ie��ϭ'�ҡ?y\��=�_����f뭤UI�l�Rt �h-s�T�b���2҉ ��꠫�RQ7Y��f��T����s	O����j+�\M��2���0<���(���v�+�'�/Zv��hz������*��B��EqH!FE<1�Z��r�	�+������L/��8i�]�Ԫ8b����Ÿw.���������"���A�j ��תHM��OC�}u6�z�L���j���uZ]NB�b4\%���a�6<^� �A�������k�)Pi�O����>;��;[���߻��[�]�,E���ʺ�j��F(�_�_��nbiX���^u�O4��q�j`�Ϡ��a40R���r�nd�ݎ�W�t��U������w^���^^��_�,f�����U��m�����)���])Y���� ��LL����H����V� �6��J�S>�㋫��A2�ûǣ�ZN&g��J�kU�����!M��*�!�q�\����q ���4?2@�[�D���
G��9�?A^�[�
x>�4)�͚/O�p���0�Gﲩj+AA�j���j�S���G�xd�O���A�ywK����Y*��
N��&��c�Rhd��!�8B ��ИY��$B@�+@ϓO��U��l6�>�>�^'�ӧ�I�a�����o
�󿃢�jCE�4N��a�EOC�h������[d`     y�}���8�3]@�PP�����?�����<���Ng����[���=g*��j5�pSQӢ?y�O�-i�]�Ȕ�Ѹ���H.��~*2���S�46G�������A���݇��<(��φ����מ3��q��(�I<w೚��ܪ��2��V�,"���&�"��w��"G���U������������e�n/�zo!�w�������&(ꜴI���~Q)m�dj���"�3h�a�)x�Pf�M��i��*��
U׍�ZYE�S�`�����m��N��W�{���=g���(�nlI�����R��VL���-��k	��u� 2��3��uu�a{���]?[�ޘ�������4,b=���,�q��1����<�I�ZO�C����'�mbJq<�#M���,A�����"����巻��������C^����k׏*øm�"9E���?�"yv(�2�a>	�������H�2��@ P�HC(����F��\_Ov\M��m�{;x�;��׮��q� %�j.�T�O�IH�N*PNc���9W2t��Zz�@r"	�UއL��B������-Ϟη�W�{���Ƈ�ȟϾv��F��&��h:f��I7�(���̍�h����y�fn�� /�@ǩP*���`�>������]�;o��2��׏��ey�"�v��PL�(j�7W%)xS!3/��3�bWtA�Ӵ��t]�i|�6� �ql4���g�����Ӄ<��ǲ�����%�M���B�~1
��Jsڢ��@q\>�TL$攆#K�P_��x��<��t]"Q��*��<����SL���"�[�����l����>zw���RZR���l8!~�	A�}]�Q��aυk� �D�N$����
�qO ���\'U������V�=>���).z�]oա؋���w�E��dL�&�U[<����?�2¨J���N^!��Щ*�tNJT-�����kB�+5��V�����??Ǘ۽���|���x��u�E��jL�&(G77%s��dJӔ@ɑ�m���c�2Q_8�^�H]⨞?�m�ⱩTԶ����[��/��t8�^�}��|q���&Ͽ(�1����
��B}�`9����^K~�BÛ��9[
�5���4_<_���KH��mB��n���"�����"�����f7z,^���ΐ����8!Lu�4��a�/{�:F���GW
9^bm ,]����0�N��5�a���{4?�=yۃz��j����݄+�;��|T6&l��ޤvc_��zK���j�JSx��u����Ũu���M��]��L�LT�h�ۛžv�/;g狭������������u�ҫ4�M��YW��M�MbG\�ӆ_e�!��q�c�Bct�)g#=H�@�.�=E浖�3�k��!����y�/W��!���~`�>�1:�MG�BzIJ]6vFw�����?w�����V������YI#لdMH�xzS+��������ߤ$����4HA�,�?S�k׶�H�d����~�eq�� $�&l_�	B�~g���q���=��(if̲��ʪ����=��ω�8��I�U��qq�����ؑE�r
{��ٶ��Ik����m�k��g�x+��fc�s����)&��o&^JhG�`
�Cё�db56LI���<J�Y	83ғ�#�RNя�Q� Io�����ע��f����_��a��'6�Ruf	�l��,�凣�2D��h��LF�A>���a@�.� H�@&���\�\R��\�����fWmn;I��T�n�8��qub��q9Xľks�R������Ώ��ᰮ�!_9�X(�@����3D�� �����W���-��u�ur>��.ئuE�pS~ɋc\��sΌ"ꛓG$ ' ��	خq�Ӆ��1��,Hc��� `8
p�Qh��S�e;{���d��Z�9�����7'&I��G�rq������5��/?����Y����ɥ�h	�aG�F!M�F(o2�pT@��ʍ����C �����jd�_�7�˻��f�����?���Dbܞ~���ޯ��`��㹤�ZU$e��� A�	*��.Kp��`�Iz�k&���߸iu2n��4�\ڛ�'�F����h$�pA~5R�3���3]ЄA�V>��	��1��Wa/��D�)�6�pTQx���;�.�#>!��FƏ��
b窗��8ڈ]��3��9�g�E����p������ ��8t�YaI0ܡd$�� �KF� O(F0��geӠn�|�����ᤦ��ְ>"N�
2�N���(���O<H� u`��R��� h��	O�Nps�7�px���W��{�V׺��{���&\liq8��삟%	N�PP��w~�A-S8�8x�2���Fa/ñ��I����D��%����p��Wn�����^ڷ��Y��v�z��'��]q8�}�B��P�CB���5��_k<�J�uzF�/��i��� �B���g�ȏ�[��}k�5��͒��{�;:�ի��/N1�oQ�_�����Q�! p������ B$����)ʅ�Lx���2�C��@��N�7�j?_6����<]��;:j��O�CLl[��&��@=L���#��Y4�X">7����( �t��&q��RX���P����Q��n��l�a��Xr�����Em|�8�P�?Ȅ��*���R}wٛ\� .,�BP���$���-�:�g�w4*YT�Χ%J�	�X�+E;�l~�-���'�v�w��}����(���vE~s��%�ʼI_s�/�� ��ٵ���L<�Eu4�OQ,l(�dIS���p��-Z��[s�9���h�þEa5J�3(���_
��Ө�jL��gE��
��Έ�u~c6�J|���2��S�-����_.V�`C�/�������l q6!��Ԫ�,I	�����5v�^
ɥ�GhF!�#���ޓH���qy��/�KS?o��ZlSw��/�b����)�S
���Z��ƾ����f /P73) /;i}�#�; ��č0���ÈX��o��!Jy%�_���d6��S��T"y�l�-ɩ����'H��?R�]I�|����#'��#�� �x�~�PE!K'?� �x�?0/��8�z�:�ǛA����s�Y��~z�mX�zl��~L�O��j����^$3���g'4q�%宅Pׂ�x��d({&�F�QC�'��z5{��ӷ��΄���~������Hqj��u�ZQ��/dd YCA��~���{'�5�JM�NB��I�*|���mez�{����z;����2�T���r3�b*�U99�P�
�����@�\�������J�1زk-�k�J����F�*�yTo����@7���PYov�Q��'�Vq�+$թ=��R���N�Y�sH3`y�F�a�G�Č�Ǳ��e4Q��dZe�D�˯��x-.���������������~{�|^��'v��Jv&���K�����c2�"�s,b��lX x�'"D��JAa��[� �o�����^����Mus��ݛl���8��N�S�,�π�Pd~O8P���b`xP#U��7Ak��j��$��U�<1TˋS������VzZ]�Ƽ�|}]���a��-��G�u�O�0piO�y��)K�����W�m�6.N�z��j�Z L�#r3��9o��ư;���}>�)yo����˰�^�&��uq��W��$ 	Ƕ�B7�;2��h�U9�L�`�<P:ط��W,�9�k��C�Ж��ke۬t�����{i��v6nO+�F���������gMV
��79X�q*1
g8�4��(c���\Y��[r�:��]�n�����i�wӃ�y���ʛ��hF����p���5g�5����b���xfq0&p��T,�p�Pp�C�R�kf�
(A�Cy�l����XL̤�b���ݛ��{�,d�"nTa�"�Q�3($���<	� �  ��c�l2(%�>!�V4?6�����f�A>��ږ���~���a�Խk�O}��͠W+�
��[a����HXH��A��K����x� q��Lq����
`R��i<��¶bDG�u_ ��`�����}ѥ�l���.Wt���M��m��a��~�p���倰{����|�[��K�.�
��E
��EM�� .!��a��8k���:���B��t�xl-e��Ң�?��ݨJ����V�U�D�,B�*nG�(�X%Hѵ���߄8�~ap��� �ܓ$`KcFb���1&)�B�fy\�c�+�����v�6����m��U,&2}jC�x[��_�H�4�D������!���!D�8��j�
�^�R�KOL b}y�LiC_�G����َ:˯}�I-��b�0��S�$�b0����FP��Z��>I�v�:S�<�P;4������@�RĊ�cX)���b���5�i�����Bj�80��b�0�S{�6D�ү�Ƞ4��<�q��� A]������1�-���59�A�P�)��[s��՚�u^�&O�^o{��[�FB��
�h�|-�'O�M�è]L��&�	��SH�8�'� �f� 6�s��X-Ĺ���=2��}l��W{�L�ٟ'5Nh�%�A}Ps+by�6���7(���u�s��9g=�8�0G���j�QB1�_���.wr|7� �lm��x1{Y���;,�� �V�#F �bs��� 1�*�Q��H��IJԿ��,xFM���U�ݘ��L�-��,����:�ޑt�~�g����a]!���A(Qw��
�Ѡ<�H�e�vx�@qi�g������C_l�|�5VsHFZz@�>��v*�E�4�
�����r�M˛!6�X�,�0K�����w.ߙ� �P<�m��g����Q���Xe#Yķ"�<,��Ty��E}\O�~G���j��{i����,�%}��qφ(J�wf����D4�F�j1�%�|j��|M���8�<��8b@��������������ש����� ��)| �G$>��~��,R'��F_�Q6�*Z>� ���v�'�I�:L���+Nl��S�%�ˮ���[��I��|c�p*7��Z�P��S!,"f�Q��"�"6dЄ�W�y!	>��:�SF$�:�$�y|��Ã��yQ�%��lE�^���ƽ�.��b@[��[�"�&}��Ň�RhZ(�Xe�t��N�A{�u@1�]|Y
T^�$�Lw Ӕ�
 ]�\B�4l���u�{5�w�ڔMZ_3q�IF�L�����EG�8�$�K�ǻ�z��4�;�5 5�*y`sE�(�i�;�]�]���v:�]��b۾XܘQs�DHd9*��:����9�����38�"��9�䨀Y:�f��G�O(r��	���1������l�P��wj4�2��� ���~~�b�|�7�w\�/,���B8�`^���l���"����h �R�֙�{v^�%�Ve9r�[ѡ׷ϓ�����q%E�Ab0�� |2-� w�B���^��~Ul#���+!_i2��3�v!ҁ|ղ�A�1Q�0��]�^m[[�CͶΕ\?ڶZn�{3�{U�)#N�T(J�QZ<��'���������d�(, ���_"����8݊`1���
.���i�s*q����)9i-��L�9n1������hY���^�����aA�օ�p������pʛ���Yd�	�"�����(��%�����E��ۂg��K�$���o��]��Q���GҮ���Bh<k0�W� �A���g��&E2+=^�&ƍ6&�)��k�!���Q㵞�	��)���̖_՚2����͓�����b8l�+����|�}���d&���Y�|�m�n�u���؁{K"a]��@RͅM8rI��]fb�(M"���5~�����l���q�Q"�q�������6�0���9I�����&�)l��Y�*	������6�C�

y
r���Ǚ�6�He���;�;����C�L+��F,���h�:cO����/J��y�8�#�Z����1Q%i~��B� 	@��p�E�7�s�>�R�	�����o�#9{�l����f'��C�jn,���S/r�(�OZ\����-� ����v�f����	K|(�Kbp��sj(U M��Gv6*u{{�G:�jqQ_�ޘ���t�/:{�C��)��]����gȋ�1�M~��i�0J�h҈�E|�C8�����h5��Bf�|ք��JC6(�_�'m+�����}�v�龪W�%� ��� ���](F@�է%K
�|<w��"G�fUHϴ0`tR(4�M<�0�%��Η��]�J��k׮2�|���a�߶o�s�&��nh��5�p�@������+�T��gg�s?�KXA�U�����x�61������o@uG�m��(l-�C� ��w��3;�Ȁ,*p����g�ΰ�?^Ǘ���k��jb��4j?pj���m��E��7-�)��h�I+��n a��x��P^J�@r�
���\D�9�Y΂C����4��[�3\V䙳���_�/��]a���A��/��FA�@�k���e�#P�[p|P�/Шe$��F)��� �9�5�L;+R�78���T��w�����f�,�����r �A���ɕ����?�f����?:\�ٿ�_ž�1���~��Z�S2���PK����7�����y��B���'C�|̆c�_�j�l�H/�n��`�n�u=l�m���!���O�b��h��� �k�Ŷ4X�8ST�  �0�X�{&`������$@�(��6F���J<ϻ>�6���t���ʷ#���A��h`y���Z}oA=e�|*8�B,���L�HH?��#(���n��0��o����u���yw���t��dq4��~������      �   �  xڍ�Mn"1���)����U��P%
Y�"�l:�Zu#PΓ[�rr���!�H������+�rp�\R0^�ŬA��'�]��)�Ǌ����k= ��`�u�~l�v^7��k �A� <�^Cc�ՉtӬV/����z4#�D��W�)�RgT��E�(8ϭ�8)�Du���*��2.((��L����jڬº���"�eT#�8�������n�xYuч8�:Lr�J�"
#��Q�D�Y�^R�薗�9	ژ���v�z<H�vxa�TCz$3������֋���j�N 
�R�W�Y�%��ջ#�]h6u� ��b�Q��E[�Q�+�j��z2���뫫�_t|;�N	�S�����9�ӎ�$ (�C{)�8��I߅mE/�yXVG���ٓ����@jK8f��hώ�ǌo��%o�)@�4s�	QL��C�x�L��\�s%hiGRJ<7L;�����v[-��^7ۺ���Q9�u��hsJ�⨴��M����$����,��-�:U� T2:��h!l6�����;�����j�^���G�P��d��z^�t�N<e�2� ~F�n�@�	������T�-HѪ[)���x� �O��.O��,�w�v����fZr!�;3�	]X�?��c��&      �      xڋ���� � �      �      xڋ���� � �      �      x��}�R[˶e[�
5�F���Nz����lcǍp�d�����{�+u7�q~�6�?V#��@b�D��f��k>ǘsf���_#��{���П�����������g�>�N�t����L����6�d��?�uwG)�Iwן�\�����w��?��ԹO7ݲs�*&��z��4����F�i~�z
u>���p�;ĕ��>t��s�u��{�:�?����7�q^UʶI���G��@��Q#��7\��~���-+��b�x�e����X#��7\���[,��l����;����<8��<���L�>���C5�����Q����N|�Ԇd�q�'0Y��׹�o�/���Z8�F'�<r��YH8�-׿]&VwvF�<''>N��~<�~����zxi'�;�N�����4�L�����ɏ�q*x�1K�[�l����.�%6H���B�����Q|��V8�[�r�)m����Rw����#����9���%�RL�9f��Y�y�dЂ����v<'?��P���\��X2�����/��C����s1\�l�2B[B��uiJ�{���۩4��I�M�xҋ��^8�4g��'�~p0�)�Q�c���4��T�P��a�'���?=����^��iQ;�KlC�e{�Y鮈�9h7��i���-G��&��L9�.����g�c���4b��*�h�ȑKƹ3��BL�8୔�*�T�����l�zzɝ�*������	f�q���׊�3��+�0!B19wܼ�>�q��2���>�=�nq���y�)�8�Зǧ���os�l�e�7�T��9��0��/�`�`29o<x��Ǐޑ?�gOF'yfw��$� ����x�+�sS�6�_�c�#��U�q)�2�T`ї�*�E/0?��|g�J̨��U�p^��hC��D�qj��i���7����7��_��Gg箩;�2�w����;Rg|�sp��Qʃї��4�1}����/���th���F�r=�I��N.�Q����y�Q^%h��ή)�2��
�;���(d&�]T9Xxg���E�����%�<����z\V1�b9O8E9u�2���c6Z�����g�Q�@����h�ŧ��:�����tﱚ
t�џ����TT~�}8�L�7�`s���-��O��o�:J��3nw��0�M2���ý��]$�[$�,��A���?s��wS��S�U��� ��;��&W���������WrI8�i8�ܳJZ>l~�z�����ɦ��<��%;qpw�Ko����z���){
����'q��������6W�.�z*Ҋe�:�&�/R)!# Y"kr�
�`�� U(T��ѲR���GPp^��]�xX��g��"��4>sg�h�%SC�����ئ�oc}��y���H}�λ�5��&C����z�O_���z�&��&�*��`C����L�s��x��d'�Y��Va*���ςB��(G ?�Z_�wN�h�#_(R�<j	��	s���;M_���wa����GGg�͓�Oatvn�Ig+GD��P�~����w�8�%7>j�ȴ�p��������pm�����a./�&9^Gj�C��gasV�9 �wp��׫�����q1~��c9|<�K��r���F�:ؖ@=�G��Z���e�8	sZ�7�:�$�r ��P`=	�,�WN���q,k�|�<qe<~�s�H3�@Щ0�(+"8�TL&�I,�\�b ���DE�x҆ʧp�(<�����\D��{Ϟ'�~K�U���s:Ϸ��� L����л%�����O����Ft���Ѹ=��BL�M?ONFݝ� .��=桟�?��r����J�k*B�7\�($���E!�z�eu!�������wߍ�2.���0�W��ժ����|��g�n����jޠJH#z�*!�M��g��q}S�hN<���q�-�Өc����.#����]ϯ�o^�<X�����=#��ܟk�g��gz�d�#?���q3s��؟"c�D$���@;�￪��+{�2�F��#d��88w7�S#pd5��n+:�KuLI�b��s"o��;�ӿDP�ɱ�6�}���E>xd�aD�ww�p2�UFf�(x7bUHwy�Yh�N�̙$�p49@��J}Z��t��d�!��M��ZLR�yo��u��=Y����~������one?@ղ�;f�2ja?rC�B�V��Q�k9�axM�GK)r��*�Oڂ����r��	����F��y��VGr�{
&6�d�j��G�8�IZ�-�%킍.�O��D�K�|t��Q�j�ѓG[�l9X��(}���W�o�߀z��I�3��|V�'�2S��j�j��4Sk������%FV�q�-��d\6��Ԋ{���2י��Đ��%)��
H�!PRE�l�q��7^@t+qS��ə'�p�e���ڏ���ؓ�uc��?{������e:R�j �j�S���1�6�uD��P�uU��3�d�Sr�&�9A6L �|���/9��U���Elt>q�!�p!y�1�$��e�)irL��5Ye�eN\2&+k�ћ�k��כUu�];Nm:9�:��Ev�;���s��?�ͩx����O�{kPW�NF���<��>,3J��(;�%p���9�\��4��Ì��2ʤ���4�"�)��p�x��e
6pc<#�[]H��Fj�r����$C�0?�m1QJgR���=S6&��9f/�2���$�5p��?�ɕ��{�:��gO����JuV�j ��*-��I��Q6بo�f��N�x4�o3-��' R�<�b��6�C~�_�E�j��
.�[W�R�,��.���h�4���1�eFnY�B�dJ:��@�gZ0�a������pb(�Ao8Xc�J�$sEP �P&��%)�����ʶh/�oUQW.A��v�?̃�1�W=mH��\�r����h����9�jO��Q.;ۿ�;VZqp�O��|�a�gP[�x�� y�"�z`��;<��Ċ�[+��;�rIGue��w�V�26ɧ~8:�ǃ���}�n����T����,qY�RM=��[��yq���Y�?�R@sG�*Y�$7_�8tgsЏ����n�C��U{H��jN�_ki�\H�a�6��%�叱P��V�.��-[�FK�f)8���Fϰ�,�4�Z3���A�����O��
x����Ä3��\rȕ�'�Nޥ�2��2�-���fa�[����&�����$�G�7��2��?���Y�C�w��� t�������W59+�<�v���ٸ`G�P`�&
Y�X��1 ѠF����&\{R���;��V����g�6�����7��2sAЬ���Sx�q��F�|:�DM���.,O�����Lt����m�����s����Udult����Ef����EK�>/&�V��� &���h��d��Im�uw�	\��Y�d��t�L:��&�,�]L�J{.��s��Lgv��i�(�?<W5��Z����qZ�f�Cw1@'~=���}�D��~s ��.����M5ܸ_1:m0޳�+�r��n�Slv����RT�Yk@؀�4j�c��"S>��,�\$��0���{�L�F�!�ׁ)-��,�32�c�"�$��Q�\�DZ*%!Mmj��[�&�4e��dK�fp]��iB�<��&ỉuz��Ҹ���ɯU�at��Ⴙ	ۢp���'&�={�z�����$���� [�if���U�ˣ���:�	 X�C���Ú]�����>����ч�d6��Q����܋L�V~d9�+�>8�-S� X���RJ��%���
� ~
6e-g�+����<3�[� ��v�_r�q[�݇�Ïꩺp�}�T�%=��0=�a�z}b0FK�� x���KI	�`Ł���,s�b��D��3!�e����7�������MqfA>bZL��O�/�׿h���DBSC�|����N�Q>.EX ��s��Q\��H�V&[�C�$>��#�p� �7���s�p�h�&9��^�������ɓ��s�\��՘�7��I��]�����qH\r2ƈ�t*z#�Ժs&*Dw�\�)�&��,���R9��z�S    ��V����h����g�����G/v�dȋډ��2�@u=B�����F�e͹Nj��2c�\	�㔵Zs��?en��9r�R�&#�r6��.�h��<0�Ԕ��q�IUQTT�) �⏰� 2,���,��3��R)��2_���
|�O7u�V~�?�Cv��T��(0(B�3e=��E��6�@؅�8�\��
���F���֢y4
KQSD�e��Bl��B�H5�'�@(�:�fp����A�$2����S)x ���㑱d����N����d��5"~���$�D�,���H�R���*�{��}��jš�IS�Y�(u�v��ϝ�o���K�A��B4����@�Ǡi![ڮ��� �X���ҳ�F�2;�����
�}A�$��3��ε��R����$\cE2[�P��-$
B��fa�C��@w!����JSP���Җ���?;|��xՊ�d��r�N:~�R��k���{����2��\_����`>daz����璎�����OJd�eC��b�5 ���]mM��L��z�1�JӧN-4��1��6ܛd/���B�-r!�l���%�%��Hߨ�pU�����N�X(�	��2�r�7c1i�<�J�{!�΍mջu������iK��J�S�m�x�P��%��Ύ�]F��Of]~�@�b*�'D*aJʜ�>��(̬w��q�J����rP�&�!���	<����$t�eD��D�2k+��z�!A�����?��G�����X6'��0���g{�F�T����To!aw�q�\��t)5	�HS q�@����?c��@�Mצ��,,8z4��b�MŒ�ڔ�\�b6DpP�|S��Lm�m�RK�X��=#�� mpuˡ��U�6#(R(? +��Yq�q���Z
Q�X"<��Đ3q��BRG������f������v3�}�C�;9�w�?���[��+�jGZ�!P� H�G��2������uaX�\
��X!n��	��߫S��-�y�:��<(xMw�)� "-���E8���= m�3�l��+�cPa�H-����9}z��z����c���"��7Ͽ<��~���������/��|y����͝/U�=��9���_�������&n�u v%�S0�����lBr���!>��X�ig�e����+/t^�+Z �f��P!����t�x$bn��b�	�P�F�p��"�P"��D���-6� p&2R[(��$+�I�)ZW4�5u��R����G��q��[��Ã%���2�u����B�길�7�U�)5j]~#u��UʬVf$H^l)̚PgTd�,�r��ö8R��ot���"�d	�Q �"����Ӻ�<C�u�	�$�F}��n������o/�����!�����[�R�B��ɧ��7��,�]a
��Ŋum���w��������/*s��HNW�x|Ȫ���͆D�G�#}��R��L��iq���Dv�Ő�'%�q�洑ʊ" ��O�"A����!��m���`�LkPf��Hi��a� �V�K!��m�(��Z��'�;���kk��9�ыn �+�|Pnt�^�����.T���~�o��h�r��;W@pV���c|Z
�i[MW9Z�������M���S&�����3b:�ۊց�ȄZ	�.k���@ K��z�Ŭ�r�	`< �0�ں��X�ʕ��⸳���X4�I�h�������r�sW�K?D��ӎ��9���y|�mGQ�*��
L����f.�W��5-GEe�fN�*D$HS$8�o��>�4 ��G& �d�*� >�|Ȃ�.�0��f��Z*��[��S�\#��&�$�
�$A)��J�\�7�۾��m�Ç?�#1�y=��֑i_W���a8������t���[+Թ."�Ea�+���.���������/(V������[^����^�E#����u}-���	�*�����%�!*�$�l�U��Z$J'��e u�pMуG)���G.u!�j�U�L�����D1� ���a]ݓ�����m`��$ �`q:�^kn��p�S���Ӑ��זJf2Sky�x��8�����S���_r׽(ˈ��QZ�4�]g�q�{�	�Z�Cm:���#���d�K��k�N�ج@�Lݯ���\D��1�Q\aqi�p]���Dh��DP�ąk��
e�3gX�p{�m�����,ċmn�~���g!�w�_�����sfc�����Fa<^�v:t�ܯ�[���m25���B�#c�\wD���>�^�O��V�x+n<%�J0,~���ߟ6]���;6Z��l�k���*08pmu!MKĊz!���2આI����d�b[�t���9�['��"\�	�A�;�b������T{^ӹ U�9)ρ2�1]LY+�#�`t��K�@t����O�|������~�_9B�i�ᗭ]�����G(�{�!EK�rͪ*�I�����V�-��P�8+1�5Y�LD��H�)Pm���ZI�gkq��f�[��X���X]W�A1c"���2�Sx`(� ��Ŋ�^�mU��˳���l����=T�H�O�ps8��l�A�g���޲�`����A���QdU��6W#�ͣ�T �B�����y �(���;呶Mr,X|��m���p+���h�7ED%|Nr�S� �Չ����	�.s��jX���&�������H����6wr�__�񫝭ea���R�����$���բ��U����uyD*���(B#�$�����:��Nk_�p6\��N�Jm݅S�}B����ހlH����ĳ��J�`�<��׊z��7��"�2�v�W����}߾�����#Y�4E�?Spq�������c�yެy7J��1���<��7R�Nv�F���Xn��lU���ڀ�9�Z�-�nD*u�8�h]�H0J��TB	1'䵺8X�s�)^GDB�ӹ�jlI�n��gS
Tl��0 B�ô���u��#���ȓ�Z�@ȼ��!���m�1�|�����!'��=\�!�5S��ק��� �#e��ZbՁD��׵�_��=im!2�J��q٩I�h���u�WQGΑ[�XQ�ҭ�5�b	\��B)1�M�ju�@�+�:8D��u;���O����k�յ�|����G�狽�
�q�����������}<y�h����Uw��teÓ�]�0����٨�cy�3�M�Q�	�ͭkYl�A�1f]�Sx'%"�W`�	1D'M���f咴�h��\[��b��u�h��5"��].��� pI@���T�Ϡ!!th|v�'�>N�D�)���'�z��MJj7Q}�DŲ�i�����f��nqX���z:�ȝ�/��&*��.�oD�>��i�]�M�\�i�[��O��P5�h����7QK����ɶX2�H��"W\܅g��o���R�����=F��ήk��p� ��T��I� �-�BGVdt%�Jd)V�}��ɹ�]�N�B�I+'�7\"���\71%�!�gBϓ�>X^���BV_wռq(Y*៫+Å��-���,q��a�ڳZVb}��Z'c$��K!�:aM@L�)�,_bAxCX� Kѥ���g��"����_�VZYyݦ��!������h4?�<��p�OL��
ݙ,ǡ����M}󘙮�|PJD%���:r=XsD��u�l�5=�:}�uƬelZ&b�x����#@�"�&���M�J{�C�ς��k�4`!�a6��6)zaY��T�,1�=Ku�p,�:���t���X��l�)��!K�� ��'��4P#�C�D�h<�H��)�b�'B[��sL#�.W7�۽j��\�^9gέ������_7O��v���0�^l�
 S̴�͸���C�ӝw-���/��
I�<C-��T�����*�27ZԿ� Pa��a6QejŅħxăeK�KQ��q��u�Л�v*Y�؆,<�Ԭ����u���@,pC�,�p:�� "�R��5�2Z��+�6>��4�Z�Ybs�dŝ�|�pko�&��� �   *u9��'wE�W��0�
)�m��.��u�l�_ն��Q�e,Y�� �4��.紹�:��R�5��`s�!�k��|F���IM�W���b5u$�E zue���$�1o��YD��Ln:�J�) 9k�Yr"c�N����Ck��;�l�L�����_/>H���������8Owݻ��Ǫ�IL��+Kz���ϧ�U�^9�����t���w�޽��k΁         �  xڥ��n�0E��WD^VU�C[����J�2�+ܘŶ���IB� �W�y&��Ǔ�	��vR0j��­J��蝛(�z�V4O"ش���΄6H��Rre5�5"h�W���p����
/�C�?��	�pf��#�ܣW�xf�)+��d��:�D���Rl�����DV*�$8�qS��`��h|�a����.(e����Նpp�p�ci�nbX�~�Ì��4يr��1Z��s�op�p� ԚM�bKC)����3�5HqG��lakCY��G�%7�Gq|R2Ǆ��P9&>�Y�*�:�O)���|OI����j��C|C���`��[+A�j��̭WOW6g��ΫP�;�V��8���L����O������#��av�9�T͖�:�N"��f�!,�6zh,� ~)���      	   �  xڵ[ms�8�L~Lj��}�H��M�2I�]oaPk[YN�����y	���L'!�hW�G��l���h���Jh�3�[��v�}��6�wmL�Ǉ���U	���	O�*xv[s���{F�B}-|�������%��"�=�\� F������e�Z 2��J���1�ᏼJd.
�^�{M�g-��H�I��ao�:Zu�1l�r.�6�O��<��'a��Ӥ�����J3�?q6<�b��P،�uü:�a���Rm�f� �:���/�����'K�{��}��"�(^$Bj�p׆et�w2�F&P���p�e�؆�گ�����y
�Kۻ�ǎ�?��',�$�<�Sb����������a��W-W"og�A��F��i�+� ojQUm�}2��Uk8���Rټ�,�!޳�SX\d]�(;���$�K��f�s��7ނ�ƫ6��7­��1P�d�[R.]fE�h��۟.����ҬS�� y���҅����*����8�O�U�%����Ю9��F��Z-e&����0	B����eA�����vt�ǆ�����k^���tzN�J�PF��M�{Uf�E��W�1cleZ"�l�	L@�-����]��"Ñw=�L$%U�y9כw�"��w<��w���JV���X7����Zl%,��	��Y�.��V���`��J�D��<��7�m�Q?]��~$�ԫ�i�
�� ԷjK�/�4ק�g�py6�����bZ�/Q𷘫�\n��<"�ʝ�4�����^
Ы+������n�"�	��g�����Z����vef�eV����	폈���hQ(�\튰���r��+��C���lA��S��U�����O��8y��.`l�z��r��y+E+5G���B�Ӂ,��/�!%t�=&�~:�L�{u���Yg�
��Q��EH��f�{�G4�8���+�c� k��Bm����Y7$�G��~�+c������g��S5X6Ol(d�.��p�^�H�O;xg�N%Q4���Z�M!/�T%�UWd	��ӧ�^�
#������&��Ǝ}RQ~�^}߀��9A9h��+�\�J��GgPtf)^�x�ȝ�x��輆� M�-,���G�ǙVKP_�}!�c}n�O��{V��Vo�c�F>��}��@��("��b|�ލ��#pkg�&f�~�q�����ML@
���1=�*���Ы��Tkݧ�m��B@"�+�1��/,3��@y��QY{���<J�r�R��j1�*NT�p�Ujc^@sHM�\V�j_X�<�y!���v
@�rUl\�9��d�ns��`��T��|�]J�Ȏمy�>�ՠ��3�1�@����|��=�|�)S�3S��@�����4��0���N(;�3���16BGt��l�Ё��zubѐ��{����fl�>����_��Pz��w'r�o|��`,D��/��]ܩ/���z��{��y��`>~�^��||�}Y�������������c>>_�Rs�ǧ�^j��!�"��P�' ����'��
j��[��5��J>�!��v ��Tq|Uѽ�-�%�������K����4`O����ꪻl�Z��m�8������������F$���!#�!�������~v��.�- �\�nS��d k����4"w6����������C?           xڅ�ɍ1E�U��о$������aR�$��x���zE��1����?��η��'��珧�'�7ƈ<���yB����<#/�ly*�������"o��G��u��O��Xg�{@>��u�<"��'H�����Ԏd "1&���$�jG�*��$e���Hb������$B�jG�<�T���xM���6d@m���#���.)D���t�gi���Ah �ݡt �nQ�v�� @��� �ݦD ��S���H� ��ϰ[мr�n	�7���@����h>8���i��n�SDy��_��y��T��yv�T��Hq�T�X�;������9U�]��Ω"��wNa�e�s�K���SA*{�ѝSEXmM�*�vkv�T�[�.]u�a�U{4I�ۭb��:ԉ��*v�C�ۭb��:ԉ�ݪ7O�:���.]u�il���:���.]u�a�M�� u"l7�||�o�"ʺCtF�4�0�-mN�������δI9{\\�6*g����f��r01���i9�\!ܠ6/g�+�nѨ���K�#���O�$���S�%���W�&���[�'���_��d}v�B�4���[g!��+!��gH�}�T ��gH�,�t ��g� �쀆L ��H
@�MА�_�J���>hO%4
�����_�����F����C��|��Q�>�%Q��S��u2�������ǫ�%��ӧ� �H�+��)o��5
�w��S>�߫��������y��q�����O�m&9��/�;_�~~��Y|�"            x���_�$I�����)���Ш���+H�*	��|�;�]5�z�FU�K�~w�snFe��&��t�}詚{*2򸛛����ܙ�ұ������#�c�f�r�zJ�('���,�~�\�6���&�b��um(�׵|(���)�|X9��\��G���#�e����ϣ�{�|X��{�r�,��끲�Go���@Y�U�r��<P�c�ׁ��q(˱�@Y|�|X���Q��Ǩ��c�e�1�����@Y|�y�,>�:P�<P3(���+�1ˁ����@Y|�v�,>f?Ps(��9���\��c���cٵv⟾����S|�r�,>V=P�(�����ǲ�����k�@Y|�u����:��!5��P�RĬ���_mڠpJ�&*I�6uP�R�ɃJ��MT�Tm�ҤjS�e3\�"�l�KT�������)1�߿��*��"񆉑�x��HE�ar�"�0=Ro� ��7L�Tě�|	�̞+c����������9�"޲9�"޲9�"޲9�"޲9�"ފ9�"ފ9�"ފ9���[1T�[�W��_W��U���Us@E�s@E�s@E�s@E�Us@E�Us@E�Us ���j���j������߿�b�n����怊x�怊x�怊xk怊xk怊xk� Jo�Po�Po�Po|���_W�"���u�Po��'*�� Qo� ��x3
HP�$�q@�"ތ�f,���7��D�7���#q������T�aL$�|ԣH���R1�9�T��.[;�!���)L���K��^�5��B�^K����a�u���k�pX}]k��y�����|���돟>���ϟ>��_��?<���>x���_�������?�z��×����>}������������w��Ӈ���|����?~������������矾~���}����><��������O?����_������~��������������O�~���������������?|�����~��'��~�������O��?���?������/��G����_����~������Ga�ϼ�Q����Q�O����?��Ӈ�����o��ݟ���w����+����x��\���O�����݇?�����������=���y��?����x����w?��+�g��s��Y��Ǔ�n�}�������i��w�g,��0���00	鿤�_�V�(�vg����7?��;�L�L�e&Q&�W�(�@��߆�+�(��|��Y��~�������������W��|(+�`�q�,�`�y�,�`�u�,�ĕ�@Y>�+�@Y>�+���|V0K9P�O�J=P�O�J;P�O�J?Pe(��2��GY�⣞�⣦e�Q�ae�\`�r�,>j=P�(�����G���e�Qׁ��h灲�h�@Y|�|XY>�؈·~@:�m��f���p�wyw�[���;�-�]^��i�}�m�Kz\\�ݒ�7�vߙZd�Rߺ%������q<��_qw��si8c��@�(s��@�(k��@���]�Ӝx״��'2Լ�q ��r�V!�����}'O6�8\�
����ڞ")�nO�Q���D���SD"E�s��@�ioܤ�g��%�D�$A���!�ջ��Ͼ����c�����WM;��������������nm{v�d��=�e�[۞�2٭����9��tŭl&)��I)������IJ�>��/d���3�����Q}{�(��>y�r��W<;�| |C���gq��6R�P���C�k��~-\C���T.�c�͏J��*W����F�
~��7ɕ��d��\$�5�\N���i�r:�%g���,w>�\e���L�*3�v�q���6.Is�����/�����~Ϲ�y�O�>�T9��A��]�е��c㒾�_�;����Kz璾�#��\m�%7��+��~�����՟���c����s�{]��w~v?Eu��N�c ���~�Σ�-��Ϥ'A�3��:�}��'G�*oҞYtn��>�Gn��n�ۯ����'H���t�➃S��=�����<���s"c|g���}^bzLL�Ç�=��=|xXe�>�2����K>!��ʔ/Y�=[2�z�[��Kۇ�%O�K�������>i��<�/�;ߏ{F^��̓���Qsɳ���as����/������J�dYYϭ����#�R�=�-�ݗ��ri�\��ri�`���r�\� gOgK�ǳe�gK���@���}d\�ȸ�}f\�̸T������9{]�ۃ�'�����G�����g�������������v��㳇ץ�=by�^�>M/{�^j���������Mn�Xx��O�˞x�����y��ϼ˞y��z�	���R�~��S�RO�|�����������˞���O�fO�K}{�)�ݿ�%Gչ`����)u�o������[/�����)�i�K&���=%x``�>10{b`�>20{d`�>30{f`���x�a�әg0��C��0�����%{dc�WgObL�G1f�bLs{��4��!��L�Ώ3{�d��Ç�U�y����>��S��>�9�<�}��>e1{�bZ�of1��� 5�@�5�/ߘ��.��9ȳ7�[�7�\���i�K�{_��%�xxdZ�/ɞ7��}�dϐLk���0��	�����%�7��|n���gU��n�ɼ}�d��|n�������}��`�]1y�d�>I2{�d>�_�=�2�ܭ/{jf>ם�<_��Ϩ̞Q�ӛ1��<��C��<�T�<�}K���Q�y�(��Q�9]���q�9m��z�d�>s2{�dN���������=R1�t�}M�0�y����s���ճ#s�~��4˼}�e���G��l��'g���f��O�̞������������9?2�x<g.�#��?%����c6sٞ|<"4o�="4�+>�/����,����,����,��/	�,������39s=�w�U��w.N�k~�C�d-��;���ȑ��#sm��;�j�}�b�ż}�b��\�#�Z_�B,����X<1o�X<1�+zW̿&��Ϗ����Oa�������ϋ�����Cꊇ���C�@���˟'�����'�����q{�_� {d]�>��xd]�F^<n/o�W<n/���<*0��vw,̗�|�'����'����'�����<+��G��e�D�}<]�x�<.���#��h�=����T+��Ǹ�d�ʴ}(Y�P�<�_X=#-�;oR{�Z��Q�����d�����d���Ɋ'��y�����~���<Ǜo�<�+��J�#�����^y�y��Ȫ�}dU�Ȫ��|c�yUym�,y�V^�o�zNX^WD����k���ӿ���_�ӿ���_�&|���&Z��r�K�f��=xRX9�dY<��l�U<���ۓ����s�q=�ltV<�ltV<謜�$/�]V����=M�l��V<M��;=ˣ�J���1�/+i{��@��}�Z�@��}�Z�@���'�+钏�=P��G��g��t�f����|��~�/+y��zOS+��������d�����d�����dœ����^œ����^œ�J���O%+y���>+e���W+w�W��ՠ���`���O����<�l�V<�l�V<ꭔݑ�zL]�>��zL]�>��zL]�>��zL])s��H�{�rq��W~!�W�$��;��U��+5o?&�$j��@8I�B�ޯ[�W��K�g�zEZP���}�]��R�_�<,�l�W=,��s��0�}|_����8��z*`iۓ�������,�v�7[�G���>��,��c��,�v�g@����.վ��������z����%�z������z������z�3�Z�o�Z���U�#��}:`�3Y�O��X���"�����v�����
�����
���_�+��������9,��V�9,c�M�h,c{���Ȳ}jd���2��0���2ޜ�\=2��K�@<v��K�@<L����@<�lY=��r���evn��z�c��/�8Y���8Y��ˬ�e���2    ��e����g}�������uE�u�ϲ�'�-�g�V�-�g�V�-�;:W�*-�G�γ�ȯ�W=��l^Z=��l^Z�����<��n��Z=���鑧������ٮu�l��ٮu�l��ٮu�l��ٮ��<�y�j�>v�z�j=��1����V����V���y�Sc�/�����=2����n�5R}��уV��A�ՃV��A�ՃVkڞ5<$���YÓh뛒h����p���}��>�zn��o�x�o�>ɷz�o�>ɷz�o͏�������Cv����<�d9�l�[=��淇�y�l-����Z�#�x�j-w��g����N�g����N�g��rENH�к}^h�к}^h�к}^h��Zֽ{�6�����8Դ��p���h�<K�n���<K���$�yJk�>��yJk���'���f�'���f�'���f�'�������u���������S��9��s`��9��s`k��<ön�a�<ön�a�<ö��Ѭ������Myo���My|p�>>�y|p�$>�y|p���H�}o����&�����#c�����#ck�~�������<2���@��u\���<紎t���x\2{\h����g���6��m�q���.����.����.�oG��i���4��i�un;�I�u�$��I�u�;�j_+������Y���l��Y���l��Y���l��Y���l��Y���l��Y���l��Y���l��Y/��l��Y�#?6�q�u�8��q�u�+μGZ�uɗ<{�n�=��;(��7o�yfe�>��yfe]�(���k=����m���<鱝�,��ض�dl�ض�dl�ض�dl���K�c۹��g'����g'�s^2�����o�=�m�?�<�=r�`�������Olw�O|9��ԧKn�=��m]�<��m]�<�����i�*��#ߝ{�_K�/�*��*�r�})�>(�yP`˗<{�a{-�G��|��>�y^��/��׶�k���������%�����
�z�#��G赲�*�9}�l���l�'6�Զm��=9�]��=9�m��=9������׶�������@8���G�3MM��;:nԼ��r��>��{�_���g��3�g��3�g��3�g��3�g�zŗA����vnT����3ض��3�Z��:s�iW<�=�!�=��m�D�=�����/@t�rk��}l��Hx�\�>Y�{�\����W���
��r�_�@��~�j������?��������|�����!t����	h��Z�~�� �ַ_�<O�]�'�=O���o�<�]���=���'�v��k㒻-ϟkc�=Y��k��{�Q��m�H��rml��y�]�/m�׶���׶������w�ض����%��{m�ؽ�{m�ؽ�{m�ؽ�{m�ؽ�{m�ؽ�{m]����u����ummO	��׶��랏�������#bm�G��������֛[�tO�kk��u�Wmzy�k���>2�{d`?�ߚ�þ}�a��þ}�a��þ}�a���~n���Q�}����Q�}����Q���~[�c&��1��c&{�oU�PǞ��8O���'_<}��K�:���=m���S{�=�*���*�;*�_���˟1���m�g$������6��S��6�����'N������Z��c-��Z�|I^�GC��ȟyjc�o�z����=xdc���{�d/ۓ�'U��ȩN"�K~�D0�~��_����DXx"�i�˛'���s}����s���G�>�s��aM��mk~����o׷��o��?�3<y��Gf��u\p�9<X��y��%��p���d}�p���d}�p���d}�p���d�m��z�Zoۯ�
��;�������m������ۆ���v�2�	h}���	h���U_f/I�"ַO�"���K�ǚ��c�F񥪷��/������r}�X��r�?p���o��;�_X�y��%x�$�y���Շ`��8���<`���WV�{�o�{�gVO���'�O�뿐���/M������������c�}l���}���\��}���\��}���\�>�u��ȳ>��}���>�}i������h������h������h������h����%�h����Jw��
��Q��Wy3y{Y_����#����f�s���~�����}��𰳾�_�=���;��{���>ulx���>ulx���>ulx���>ulx���>ul��G��Y:�u��Ê��giV6�+V6�+V6�+V6�+V6�;�G��_���?��i����i_㒴��i_#�;_���6��K�ǚ��c͆ǚ�t���<�llV6<�l��?��D��}"��D��/�������.vx���w^�=4k�G�T��F�~m�,������'f���}�~����~�|��J����k��e��b��e���A��c��R��c�Ҷ?B�o �����@�#�|U��H�*��#�n�U�N�@iR]V��������]M�����u5�_����NTN�V�K�]m�����j���*�m�*�m�*�m�*�m�*�m�(C�Ms@E�Ms@E�Ms@E�ٽ|�"��<QovÜ��7��MTě�A&*��n��f�F	�ov����7��DE��&*�� /QoF;��x��?Qo�&*����V�Dih9���r�r�+�l��S��J���r�R�+�ܭ��
)+u�B��J������+^��i��WH�\RR�ɬ@:�e2+��e2+��e2+��e2+�ԥ��)��dV(��dV(��lV(��lV(��lV %u��
%u��
%u��
%u��
%u��
%ui�ϙ�����LI]��^��.��'SR�v'�!eui\�)�K��LI]3eJ��"SR���fJ겘J겘J겚J겚J겚HE]V�BI]V�BI]V�BI]V�BI]V�BI]V�BI]V�BI]6�BI]6�BI]6����fV(��fV(��fV(��fV(��fV(��fV(��fV(��nV(��nV(��nV 5u��
%ui8�)�K�LI]�dJ�҈$SR��$���4&ɔԥAI��.�J2%uiX�!uui\�)�K�LI]�dJ���$SR��&���48ɔԥ�I��.O2%ui|�)�K�i�K#�LI]�dJ��%SR�)���4JɔԥaJ��.�S2%ui��)�K#�LI]�dHS]�dJ��`%SR�F+���4\ɔԥ�J��.W2%ui��)�K�+-�B��(�����_!�b��WH�n (%-7+U�B��J����R�+�<�4�
)/+M��u�p�PR��+���4\)��}��J��.W
%ui�R(�KÕBI]����4\)�ԥ�J��.W
%ui�R(�KÕI�'�J��p�PR��+���4\)�ԥ�J��.W
%ui�R(�KÕBI]�J��p�@R�I�+���4\)�ԥ�J��.W
%ui�R(�KÕBI]�J��p�PR��+���4\)��}��J��.W
%ui�R(�KÕBI]�J��p�PR��+���4\)�ԥ�J��.W
$e�d�R(�KÕBI]�J��p�PR��+���4\)�ԥ�J��.W
%ui�R(�KÕI�'�J��p�PR��+���4\)�ԥ�J��.W
%ui�R(�KÕBI]�J��p�@R���L��.W
%ui�R(�KÕBI]�J��p�PR��+���4\)�ԥ�J��.W
$e��J��p�PR��+���4\)�ԥ�J��.W
%ui�R(�KÕBI]�J��p�@R��>M��.W
%ui�R(�KÕBI]�J��p�PR��+����VM�4���Jij9[9�R.V�|����
_!�f��WH�[��RV�|����_!�e��W�.�TJ��p�RR��+���j*%ui�R)�KÕJI]�TJ�����ԥ�J��.W*%ui�R)�KÕJI]�TH�>ت��ԥ�J��.W*%ui�R)�KÕJI]�TJ��p�RR��+���4\��ԥ�J��샭�JI]�TJ��p�RR��+���4\��ԥ�J��.W*%ui�R)�KÕJI]�TH�>ت��ԥ�J��.W*%ui�R)�KÕJI]�TJ��p�RR��+�    ��4\��ԥ�J��샭�JI]�TJ��p�RR��+���4\��ԥ�J��.W*%ui�R)�KÕJI]�TH�>ت��ԥ�J��.W*%ui�R)�KÕJI]�TJ��p�RR��+���4\��ԥ�J��샭�JI]�TJ��p�RR��+���4\��ԥ�J��.W*%ui�R)�KÕJI]�TH�>ت��ԥ�J��.W*%ui�R)�KÕJI]�TJ��p�RR��+���4\��ԥ�J��샭�JI]�TJ��p�RR��+���4\��ԥ�J��.W*%q���Jih9���r�r�+�\���
)W+�B��J���r�R�+�<���
)O+�B��J��x]6\i�ԥ�J��.W$el�4J��p�QR��+���4\i�ԥ��(�KÕFI]�4J��p�QR��+���4\i��}�U�(�KÕFI]�4J��p�QR��+���4\i�ԥ�J��.W%ui��(�KÕI�[5���4\i�ԥ�J��.W%ui��(�KÕFI]�4J��p�QR��+���4\i��}�U�(�KÕFI]�4J��p�QR��+���4\i�ԥ�J��.W%ui��(�KÕI�[5���4\i�ԥ�J��.W%ui��(�KÕFI]�4J��p�QR��+���4\i��}�U�(�KÕFI]�4J��p�QR��+���4\i�ԥ�J��.W%ui��(�KÕI�[5���4\i�ԥ�J��.W%ui��(�KÕFI]�4J��p�QR��+���4\i��}�U�(�KÕFI]�4J��p�QR��+���4\i�ԥ�J��.W%ui��(�KÕI�[5���4\i�ԥ�J��.W%ui��(�KÕFI]�4J�[5���r::���l��WH�X9�R�V*|����*_!�n��WHyX��R�V|����&_�l��)�KÕNI]�tH�>ت�ԥ�J��.W:%ui��)�K��SR��+���4\�ԥ�J��.W:%ui��!)�`��SR��+���4\�ԥ�J��.W:%ui��)�KÕNI]�tJ��p�SR��+�2ޕ}�U�)�KÕNI]�tJ��p�SR��+���4\�ԥ�J��.W:%ui��)�K����>ت�ԥ�J��.W:%ui��)�KÕNI]�tJ��p�SR��+���4\�ԥ�
:Fvel�tJ��p�SR��+���4\�ԥ�J��.W:%ui��)�KÕNI]�tJ��p����j:%ui��)�KÕNI]�tJ��p�SR��+���4\�ԥ�J��.W:%ui���(]�[5���4\�ԥ�J��.W:%ui��)�KÕNI]�tJ��p�SR��+���4\A(}W��VM��.W:%ui��)�KÕNI]�tJ��p�SR��+���4\�ԥ�J��.W�iە}�U�)�KÕNI]�tJ��p�SR��+���4\�ԥ�J�$.�U�)-'&vel� ��+�`�fP:�\��6�}�U3(e-wuel�JU˓!NC�[5���4\�ԥ�ʠ�.W��3�}�U3(�KÕAI]�J��pePR��Ǡ�.W%ui�2(�KÕAI]�J��p���>ت�ԥ�ʠ�.W%ui�2(�KÕAI]�J��pePR��+���4\�ԥ�
�:�}�U3(�KÕAI]�J��pePR��+���4\�ԥ�ʠ�.W%ui�2(�K����>ت�ԥ�ʠ�.W%ui�2(�KÕAI]�J��pePR��+���4\�ԥ�
�el�J��pePR��+���4\�ԥ�ʠ�.W%ui�2(�KÕAI]�J��pi�C�[5���4\�ԥ�ʠ�.W%ui�2(�KÕAI]�J��pePR��+���4\A(�P��V͠�.W%ui�2(�KÕAI]�J��pePR��+���4\�ԥ�ʠ�.W��4�}�U3(�KÕAI]�J��pePR��+���4\�ԥ�ʠ�.W%ui�2(�K�$iel�J��pePR��+���4\�ԥ�ʠ�.W%ui�2(�Kl�JC�阔����el�LJ���1)%-�cR�Z�Vj|����:_!�yLJM�똔�%2Q)�KÕII]� Hu*�`�fRR��+���4\��ԥ�ʤ�.�II]�LJ��peRR��+���4\��ԥ�ʄ�샭�II]�LJ��peRR��+���4\��ԥ�ʤ�.W&%ui�2)�KÕII]�LH�>ت��ԥ�ʤ�.W&%ui�2)�KÕII]�LJ��peRR��+���4\��ԥ�ʄ�샭�II]�LJ��peRR��+���4\��ԥ�ʤ�.W&%ui�2)�KÕII]�LH�>ت��ԥ�ʤ�.W&%ui�2)�KÕII]�LJ��peRR��+���4\��ԥ�ʄ�샭�II]�LJ��peRR��+���4\��ԥ�ʤ�.W&%ui�2)�KÕII]�LH�>ت��ԥ�ʤ�.W&%ui�2)�KÕII]�LJ��peRR��+���4\��ԥ�ʄ�샭�II]�LJ��peRR��+���4\��ԥ�ʤ�.W&%ui�2)�KÕII]�LH�>ت��ԥ�ʤ�.W&%ui�2)�KÕII]�LJ��peR�ت����ӱ(M-g+'�B��ʙ��r�R�+�ܬT�
)w+5�B�����i��WHyYi������.W%ui�� )�`�fQR��+���4\Y�ԥ�ʢ�.�%ui��(�KÕEI]�,J��peQR��+���j%ui��(�KÕEI]�,J��peQR��+���4\Y�ԥ�ʢ�.W%ui�� )�`�fQR��+���4\Y�ԥ�ʢ�.W%ui��(�KÕEI]�,J��peQR��+���j%ui��(�KÕEI]�,J��peQR��+���4\Y�ԥ�ʢ�.W%ui�� )�`�fQR��+���4\Y�ԥ�ʢ�.W%ui��(�KÕEI]�,J��peQR��+���j%ui��(�KÕEI]�,J��peQR��+���4\Y�ԥ�ʢ�.W%ui��x��샭�EI]�,J��peQR��+���4\Y�ԥ�ʢ�.W%ui��(�KÕEI]� �g)�`�fQR��+���4\Y�ԥ�ʢ�.W%ui��(�KÕEI]�,J��peQR��+��Y�>تY�ԥ�ʢ�.W%ui��(�KÕEI]�,J��peQ�تY����?���z>���~�Y���H�z0����L ��D�3��2�� �L�y0�/aL��^�/���D�oW�x�7�JD��a"_&������������������������3����3����3�QUJ¦S��2��Uu���Uu���Uu���Uu���Uu���Uu^��Uu^��Uu^����6z�ė� o���o���o���o���o���o���
o���
o���
oT�����4!�LxsU�WxsU�WxsU�WxsU�WxsU�WxsU�7xsU�7xsU�7x����!&�e"������������������������Û��Û���U�.l1u�/�\U��\U�H<]U��H<]U�I<]U�HJ<]U�K<]U��K<]U�L<�*�a�ID|���:Gv��:G|��:G���:G���:G���:G���:G���:G��IU��IL'��D�7W�9�OW�9�OW�9�OW�9"OW�9ROW�9�OW�9�OW�9�O�Jl�`bb_&���Α�x����x��Α�x����x����x�*α���"�L�\�*�F|��`�_&B=�cė��&�e"�YF|��`�_&�<�gė��&�e�PZrU��Ғ�����*�a#��F|���:�%W�9(-���Ai�UuJK��sPZrU��Ғ����\U破DU�SL;��D�7W�9(-���Ai�UuJK��sPZrU��Ғ����\U破�:�%��pذb_&����Ai�UuJK��sPZrU��Ғ����\U破�:�%W�9(-QU��&S��2��UuJK��sPZrU��Ғ����\U破�:�%W�9(-���Ai��26���ė� o��sPZrU��Ғ����\U破�:�%W�9(-���Ai�UuJKT�����$�LxsU��Ғ����\U破�:�%W�9(-���Ai�UuJK��sP�5;1;���Ai�UuJK��sPZrU��Ғ����\U破�:�%W�9(-���Ai��������o���j���r�o�v     �\k�@¹��юj�D�B�����i�ŷZ:ַŷ��X���t�`��j��)�k�#C �v�`	�ՏL�����������PM��U`i�*���|�*"���BY�GΡ���#�PE��k�"���-T�Wz�����7U$\9xC�#1CɏG	�����PEV�Q�7�>"[0T�.w����H�U�%xC�#��B	VG	�z�īPE��Q�7F5xC�"�B!9Gސw�P�PE��Q�7�!�E�;B>I�"�����D�PEr�т7|�I����-x�W����v�т7|��&U|��h�����*��z��_t�7VC��<z����ᛜ����=x�܎��;n�R\��kQG��7|�J����_����у7<�o��*�yq��x���g�����n<��x������ࡊ灏���n<?�x���n����'+����&<��x��l³{�������cox�	�Ai5���P�"����(	U<9q����I�P�g��
��>�U|:{������P��y�
��q>�U|�s����E��(��	��p��c��eK�V�^��p�sC�x�P�չ+z��'���<^�nu�/�	�u�$:^6nu�/{	�:7J����[��GJ���-�R�x�x��.�<)��wGJ��"F)��,y��.����u���H_x����B�����
bx���0��
�
dx���P��
�
fx���p��
[
hx������

jx������
�	lx���І�
�	nx������
[	px�����
	rx���0��
�tx���P��
�vx���p��
[xx������
zx���Af<_ߎ��|���q�o��!�ͻ�~�����y�ݫ�}����������������?���/��_��wqkWi�����O�U��6����o���ئ��/���?�_?�l�}�û����������������:��W~�������w�ǻ�>~���?��O?a��wO�����}����/_�}��íw�;e��F�Ӗ�1�k&ߛ���~���?~z����O��O_��.{ͫ�7��o7���kh��F�V3��v�{��}�ѽ�`����j��-�l<°�'k��toE̩�nuoEL��nuo����`�0��V�Vm�}�؃��V�V�}���2_nuo�ŋ*C����V�VE���[�[��^nuo������9�˭��x���;G�սUo_����l���n����"򭍑����T?��So�oU���U���V՛�[Uo�oU���U���V՛�[Uo���Ko�oU���U���V՛�[Uo�oU����������r'~{����p@�^��o���s= �������������+T��r'~�Vޟ�Pm�?ϡ�y^Bu�������yX@��_�ğ���/w�j��y�����r'~�"	��N�V��?ސ��_��o������H��N�V��?ސ��_�ğ�G/w�j��y��h��r'~�"���N�V�.���C�ڸ��y/����~8 H�/����~8 ��/��j�~8 H�/��*���r�~��۟/��j�~��o����[u�V?x���������x���[t����VM������r�~��K,/��*���r�~�6��ox�<�ܾߪ����� �}�Uo��7<?�_n�o��[��O�ϗ��[���y����櫛�[�=���|�)��y�����~0ٸx�^��
���n���ß�zu���獃p���xu�������P��q�-�����ޟ7�1�g������(]q��Q[y�I�������$����&D8F�����$�ՋoB����m��$�՛oB D�7ol"��7!�1�'l܄��]���͟5��Y�ys$W�qs$Wl��;� �y�����H��p�p(Dh8o�"�7;¸�f7;���2nv���e��ȇ,pnv���to��\�ջov�C87;j���ov�C �ov�u�Dp�����7;f���͎��7;�!�����͎@u�����G%�!�OJ�C48�t�lp>'���|L"����D`<ă�!�@y��3���G$����e�_�)���!#�w��
�kӫ���u�)���!&�����Λ��}
�my ?$���|��vyk�����y@9����<����TD�9ą� t��F��/6��*<�ŵ�f��/�u�����!�!4��C�Cj8��Mgo�C5�'+"k�V,D�8��`��q>V�q�ވ<���l��o��9s{�J����y�JĔ��y K�s���j�V��gy�0��l�@��l�P��l�`��l�p��8v9�,rѱ�s^pk�0u��i�8900��qPs``����t0���O<�Du�x��8>9�,2�q|r�Y�������HU�ʁg����g�����g����g�����a;��l�شpCr��f~�'o����8���[�xj&�,2��0>�,B��1>�,R��2>�,b��3>�,r��4>�,���5>�c��F����fg�����fg����gg����Hgg�����gg�����gg����hg����Hhg�����v��[��hg���ig���Hig����ig����ig���jg���Hjg����jg����jg#���kg'���Hkg+����kg/����kg3���lg7���Hlg;����l������ϯ�W��o�1�9}`Y$��;}`YD��w�����lu���u�	�|�u�{�����8�903��q�s`f$��<��̈��y΁��-��3#\':fF�<�Y̌xy�����8g903�q�r`f$�����̈���ρ�+l\������2fF�<�e̌�y��9�8�903��q,s`f$��X��̈�Ǳ́��5�14/`�����H��y�a�8/9032�q^r`f������H��yɁ�S��3#��%�-U�����H��yɁU���"��%��U���䰹��z���q�������f.E`=�q\��z����8�%p)2�q�K�gEh=�q	���z���8�%0&r�q�K`L�����H��1.�1]�c\c"�Ǹ�Dx=�q	���z���8�%0&��q�K`L�������L�{�����*�K�{��U�"��.E�=�W	{�����*�1�}��Uc"���k2ZA��U���{�����8�%p)B�q�K�R���ܗ����ǹ/�K���s_�V~^^����+�}	\����'��8�5�g��"<�.Ez>�c	\��|�����8�%p)�qK�R$��D������9)�K���sR�"D�.E�>�I	\�}���9�8'%p)��qNJ�R$�㜔�����9)�K���sR�"L�.E�>�I	\�8}���K���k�]���R^�������-�KÏ�[�+r�q~K`L������H���-a�Q�8�%�"��q~K�E��������ߵ0-�"��q~K�E����������-��ȏ�[/"��^D&?�o	��P~��x��8�%�"b�q�J�E���\����ǹ*��̏sU/"�ck\p߁<����8�%0&�q�K`LD��w���w�ۏ_?|~z���~����O�޿���˗�KU�a�%�ޞ���w����ē���ç�_������ǟ���_�E_~k��O��������o������������>���$�J���E�����i%�oч ��E#����0�K�[�"��.�o�K{����ץ�G�[t#��.�oю ��E?���	0�K�[t$��.�oђ ��EO��M	0FK������#�m�u���}	0Hk�[4&�x��oљ ��Ek����	p�k�[4'�9��oѝ ��|��8>�Q7��q��č�s50q���c�m0~j`b�5�������     �&Fg����1���c��q|ڱ|�8>�o����i~�6�O���q|����hp��S�*:`����hq��S����O��8>�a���i�X�q|�{Vm��ށUǧ�w`���i�X�0j`U�:�X��U�� c�VmSx�1����_�)|c1����/ǔ�w`��1e�X�qL�{VE���X]0j`U�=�X��Uǔ�w`��1�:�o��W.G�'��X�sL����c�V�S�ށU�� c�VE����C� c���S�ށ;;ǔ�w���1�GX�_�)|�4��·R�_�)|/5�����/Ɣ����0j�N�B�X��;;ǔ�w���1e���sL�{��Sxh7����j��L�����׆�q�/�c�q�o��c�q�/�V�������9�G`��qh�.�m���]��u�]�X�s욿���c�����αk��3�cP�cı��8�c�����p�8v�,v8F������������������������������������xd<��#��Rw�[���-���c�Q|�<#�Q<��Ǩ���9F�w�E�r���m������h�1;�b?Z`Lt����c��t���Y�vų�h��.���"@8����~8���n8���v{��VA8F�v�c���$p}���� ���D	\-0f��5��1;����r�!� ��C<A��1�<�����ځ1�Ic��D+	���$0�[`L4��Xo�1;ϭ������1;�-������;#�1�Q��DK	�=%�9����#�1�Uc��D[	�������1;ϭ������1�Zc��Do	���%0[`Lt��l�1�^c��D	��&0[`��sk��<��_`��sk��D�	��]&0�>;������M�����9�s\���-p)�S`<����O�����������E�s\��-p)�T`<����R�c�/�3Fk\-�,z[��h�e���F,���y)�a!1%������E�\-졢����-.pm����q�c4�8Fٯ�X�1p����h����Eo\g-졢9����1p����h���.E\h-p)d��i�K�!�L\:��c?+p)zd��i�K�$�L\�.�fZ�R��h�2^���˸��痁9�/�IG�N��s��;���.���20�[�Rt���oaO�20�[`L����o�1�0��D���-30�{ؓD���xM30�{�Et���/~=�=��`�Q;zؓD�����30�{`?���X���;c��C�����30�{`?���X���?c��C���o�g������v�E����.z�E4��u�/����x�7p]���轁�^D�\=�"�o���~�E����.z�E4��u�/���x-8p]������s�/x>�;p�����܁k��D�\c=0&zw��1Ѽ�X�����z`L���5�c���<p�������k��D\c=0&zx��1���X��.��z`L���5�c�����<p�����䁋��D+\/=0&Zyt~Wz�:�q+�求��߼N�=���?p����h��k��D�\{=0&���1���^�����z`Lt����c����=?p������_�w̓_~��~�������z�E���u�/����x�>p���h���^D�\G=�"Z}�:����Q��F��z�E���u��>&�|�:�����Q�&��z`?���u�������>p��~h������Qx��M��5�/�#��xA:3�1*���v��x����� �k��D\�=0&���Z�1�>�j���!�V{`L4���c�w��s2�q�1���a�8#n"0&���Z�1��F��������K�h��\�>#��G�R��u?����&�r��:8�����K�9d�E[�!#�,��tc��s���0�p�hX-I0�����H�9d�EC�!#�,��`�e'�?�o`�ɀN��1ьs�\�^$�CF�R�"a���$6!���h^��e�E��-#�,Z�`n�eѹ��,��%�'F`Y�-�<1ˢm	�X]K0O���hZ�yb�E��#�}�e	��K0O���hX�yb.E��#p)ڕ`��Kѭ��\�f%�(F�R�*�5?��U	����Jp͏��hT�1T��4�?F`Y�6�2ˢ�	�X�M0����k��`�E[�#�,�����G�
��}P0����h��ye�=VtA��2ˢ	
�X=P0����h��ye�E�+#�,�`^�e����,��'�XF`Yt?�1ˢ�	�X�Op���v)�oF�_tK�|3��Y
���R0ߌ��h���f�E��7#�/�`���'����6)�oF�_tI�|3��I�`<R���I�#��=��C
��R0ߌ��菂�f�E{�7#�/��`��������(�pF��Dk�#�,:�`��e�s�,��(�;F��D[�#p)��`��K���\��(�F�R�D�<0��#
��Q0���˿o?���=Z�`N�e��?��MW0?���蹂�i�E��O#챢�
�XW0?���跂�i�E��O3�,��`~�a��V0A���������Yml3���!���eќ��1�x��9p�E;́3�/��`����s���^.�g�_�r��T�����̌�/�Og`f�~�|:3/g�y3�[����b����=*��8�e0���ً	{vNg����8{1P��i�l���<?g����8�e0�����+3����������8�e���_�; �/p6��`�����j����v3H����3��g�l���<?g����8{9g�+8=k�f����Z�Ec�F���3p6:�`���ѻs����5�˧rvA���S��:�`.���=l0�Oe�.6�˧2sA��S�������\��s�Tf.�f��|*3���d>��:�`^�-�M''�ق��sK{��R���l����z�p�l��|={8F�q��=��9_��Q��g�(Mν��c�����1ʼ���ۏE�y|�0�r�D>{8F�pN�#�\9)��Qn�_��(wίs�c���9�1ʓ������u�p����u�0�J��:G�ks��9��R8���"�1�_D��=f��pT��~�j�1�_��=f���T��~�����/bR�3�EP*�c��J�{��VN�s��q��+���s�\�o�+�
~��\9W�[�ʹ��vr��+��ys�\�o˜+�
~�9�u�s�}|0�3��8�3��9�3#�8�^�p���{=�1�7�نc��^g8F�q{�u�c��^g8F`h{� �"a?��ގd���k�R���h����:��`U{_�jG|o�V��^)�_�{���	��W~�[�5����4+�c�4+�c��%���E9#p$��p����[�8��r8F�H�.���#ѽ��c�D���8�J��D��2�����9�������-���Z�팷�3��D�p���]��1/N�}
��h�V��8�x��5#�"�k8F�EdX�p�ﭱ��c�li��+p)��'3�g�g��+p)��1���ȃ�l��B�q�_�K��9.E4���yИ�W�R�Ac�^�K���{.MΥ�
.E�4ւ���XV�R�>c-X�K����`.E�3ւ���XV�R�>c-X�K����`.E�3ւ��1ʉk�
���g�+0&�����W�Z�c"_k�
��|e�+0&�����W�Z�c"_k�
��Lg,+0&2�1�����cƼ�c&�X�A�3ֈ��|�|�{t�7+�,r��ެ�� K  �}�z��"���
,��g�7+�,r��ެ���}�z��"���
,��g�7+�,r��ެ���}�z��&���X��XpV`Y�>c�X�e����c�E�3֎X��X;V`Y�>���yÀC֞�L��̞�g@SD?��������?�	P�P�3-�6!U�H��h6(?�"3��� ��f��3P-R�٠�X��h6(?�"7��� ��f��3�-���w\Cxɖ�m���g�[�G�A����lP~�E|4���o���g \H�A���s�!�(\E�4���W�!��g ���l6����}dM����3���cVJA`4۝��t��v�g@]�<���X9�lw~�E�3۝��v���v�g�]D*���x��lw~�E�2۝��x���v�g	H���3�+����� �0d�;?�"���π��Cf��30,���������"y��h���Φ�5�Α���l4@)B���*E*�b�р��E^�7��ȋG�"�{�2E22���M���g`Sd#�K����l�~:E�1{��Oi�v�g��c�`3��;��D�1W�t�D�1��t�D�1אt�D�1W�t�D�1W�t�D�1��t�D�1ׄt�D�1�t�D�1W�t E�1��tE�1ׅtE�1�tE�1W�tE�1��tE�1׆tE�1�tE�1W�t E�1��t$E�1ׇt(E�1�t��O�s�Hg�L s�Hg��D2׈thD2�tl����/<7{�X��>�z�AX����m#�f:#��+f:g� GX��L�d�ɂa��3a�#,�q&�q�>�$8��@ș�9��8�%gBGX��L�����qa��39��)T89�������©ݳ�wϪ�)�Y��u8�9�����/���X����1�gR�ࡆ⍴p^C+�⭴p^C3��ʹp^C;��vZX`Sh�U�P+l
-�
[ja�M��V�d��6����{��Fz�ym�
�da�M�QV�ތ ��v�¢�B��}O9�+6�ٔ�B[�¶\`�s�2�/P���E
��J&_v6U'�����aO���@)t�*��H��Va�-E
�
;n�l�p�=�N6w�ή['ۻ`G�3[���g<I�7vao��{��ö��$�_�-�N���`h����dZ��w�v��\�=`w��-���Af��o-��4���š��ߚDߊh��K�����PD���>ѷ"��5��q��Q�����o��oE�_k}+"���Q�����Fѷ*�{_Eߪȥ}i�\E*m}i}�"��Q4����7����x(L�         �   xڵ�Q�0��ۇn���'��z����6	��i��,�����8�TGP������E����sQ<Z��e�^;����>��3<Fv��6�hL�#�ecm[�~��pz��7w3�,����E�l���itǒ�>�{�7�.�tQ���<���~���1&��V�r~��_         �  xڍ��j9��g������(U?�B0�,�،���������j��C}�*��:������z�������?^O�)��ݑM,դa^���Dv&��ϗǇ�]D'���Qtc������������۟�O�)y��խ��/O��oO�<]��7PO*Nj�����R�����g�m��������-hI��6��x6�3),�n���������?�LJ�j��^6���x�.�d�_S�Zd���Q<圜���x���5�f.��,P�rN�Ԫ�Az�z� �W�r��y�2	%��H�0�������÷�/׏��T�����ʁ� ��A�e�)�I�0\\}6.g��:>M�v��$C���`���I$��&�y�o�Q*��� hD�y�(�>��p���# .U2<��Вb�H�*.v��ҏW�� M��y�ԁr�$�b�u�c y�SD&_������F� �� i;�TU^u1�&�=���<IA�WD��h��p?`,�h{>�?��Ve,���Tĵt��0���vd,���Fo�.����S����B����.VV�t,�Z���?]]ұ�ZZ1�̚�	c�5&F�a�+0V�rk,DTt�A��-1ۚ:Vڨ�R ���ԏ E�U	�1�C�S�J^��a?A��1�����1�' L��W��"�m�7D[��%v 6R<05=�����������dh�(�!&Er�0äV�7�B㠭�ǚ�cdC�A���t-0s�辜�-�1��\^�Ic�}T������4��0 �s���ѡr��AcDquT�u`�s�GU�< &},���X���)�{���3�b�(�� j�҇����q#�_����zcbܬq����_�;0�b��%g����v���1��`H�H�C�*�2߀��g�ٜQF0�p����h���Ę�V���q�̥�*�J�[ӮS�M���}�F��O���5�+u���5[c���Kmֺ?��;D�p�Ha���fI�x�vҚ�a�����l$S�ذ���I������ϩ�MyA�r䥣�H�VeiU�ѣ����1C�
Y��� ��y,��� b�]P���*;;�l�ʯ�:��:�a1kK{�{\Wl@7巖��(B��m��@�C�F�F�_����|�KfX      �   �  x���n�6���S{i�&�R�nF�-���E����*��]ɐ�q��S�ܧȋuH��.-���Mr��������!�]��r�
�K�+``�2��NN˗e�7�H ���E�Z��E��uv�{�	�#A���J���]�]u_v�w��iү�bUmN֥�h�*4ae��9�\��K$��u��i���2I�$N�B
m����Tē&zk.��<<��'x�qaHǓ򲈧x�P��yf��7��ԁ8���9��L*
�;~h�MY�M�c��韛�T�(B�Xs��V�,K8��yQ?��Ӫ\�:��W�v].~��˧�օ�@�_D|JAa�2BB�ۢo_��ܮ�.���7���IdU�4=Zo�&@.S�.6{*b��x&��V��咀��\9�B�j�׎��:zH��Im��̡�8|R�U�.�AI��y�h�ދ;�y�\��E_����vS���T�Q7�5=��O�{����u'�x��.�e��Ś�eϞ����}����'e[,�泴��G�i���S����N�^zPu��d]�E7����w�7�N1�R�\P���Q	sτA[.�vu�l�u?���f"i(s��0R��
qo���탂*�� �b��bB�=���-������Y��08��� B��\cL����]�B� ?�?���Z���E,�BU1J-&��}E_]*qە�19nSu�ۑ c	4g 3H���$�E	
u#;�;�2=��B��2%3�C�����C��撦Ŭ�T6�*�xK/�����X��x�����3fAq훱�j��� ��q�J���xYVݬ>r�wcH�FpN*3�s��0�C�<-;�\y�D&lD49K�����ƹ>F~C�!�������qԗ���-s��{T�Mx�)#������R�M �튖Ӑ��vI�.�Mz��}mʹX�3�[m��p*�q��QT""�C=��ćӹŞ��kќ3��YX��i��/e�S���j�����佛��8��H9��w�̫ƫ�&�"aJ��+e�g���Rd�>�H?{��x�� dLqi1���� �	�q'Ta&�& ��� �ΐ�:�p������v�i��h�jG㐖6�j���/���9d�B�i��E.sv��*��7��`����g�<���%$�˥?\q7�+��j�u�ټJ��'��[��y�{��'�s&�R(��A�n��ʭ+�P�\5�"��=�(�'J:�%Ts��2��,V�o]_���N,�Gz�(�P����n1y�ǫ���J�̎��EЦe�Ýx��yZ����L.�F�.���<=��n6�Y��éJ�+O����L�f�t����)�fT�.�T�������qW=����}�+�*�������<������쨢׫=��̾���?~R���=��;�HɌ���m4�d�H�H��e`������biʽ�Ό��楍	�Vj�����L�p���![icMp����u7"K��.qQ�c�Sc �rz�j;M�3 ��P���]ϳ1�Rt3��̗31?;��|�z:Zz��B\�	kZ>σ�'�JS�d<<&��<��(́��;a+�yr�n�Fè�Z��a�O��p��O�B3����N�p��"���X���k8�
�Y�W\��Ur�א�!Z�lt�,3��~�́��ح[�����      �   _  x�]�뎃 �3�)h�}�MZ���t�~��G9�q&g(��-1�l
w`��4��MǨ��n%�ಇ~9� {"�MX��^�w��V��Fr2N,��3����
��ݦR�6r�J��D1;g�0<�f���v����fO��qt��Yq	th��� [S��>x�_���� ��J�����<��W�� �.}�Y�6�(`��J� �u-�X��p��0��A�d�ڨ�lx���� �'W�˝���d6���\U"'��c�^[�$��h�Sݕ]1&y��$�(d�m���bE��k��j��ͭ���v�S���O^�D�14k3m�Ccl�mH�� �3��      �   7  xڅXێ�8}�|ż/j��K�eÝ��t�8;��~��RƑ�LA�r�(��ؼ��?Mӯs?n�1��O�i�6h ~1W�-�-a���Ƽ঻Nߟ!B��a7��?=�04�����C�=���W{��Ͼ����r��<��;��s��ަ�pj�����������	�3G�r�t�G4�������T�� ����ö;L��=���~5$ŷ����П���T�0N��LeoT�Q>�c�?���7�L9�qf��E?R8�yz���d6^)��\r�q����f�ã�ǆ ���3����}�_�������%��� 0�$6����B����n.c�~���؏c��.��Ac���������|�fa�Fr�}�;��W9zNe��%��l��(�����+�ذe��>Y�i�'0�B����������gna4�( TGa�[�)V��k�l��*Vvŀ��A�-�ÉM�@K�HO��>�ts9"�����5L0��7��x��
�t�>p1mW孓�8?HFi�|�4Ҋe�@��OF���KRC�Z����H�ב��S��;� S�@�[�1�ŽS��H�v�?�����+�P����9�a�,�g�[Д�� A���&��������8�@Ӆ<�j���֮�`lI� m���KN��[�|��[�(���o-7b���U�i�aa�a埓�e���VQ�ႁP�(ؔ>�/X��m�"����3��}��)�����X&��!�<��[�TyhMd���*��8}#�g�p�~�, +�Z�=°���[{b��!M�}��0kga���*K�||%�L'����h�&l�D�A���VU��g���������Lj�㜏��	����_�O��1�KҒ�l��m����၌����v���O�O?��Lb��I"!%iw?������ ���x�{��=��g!6�R��Ӡ�`otA�����qce�
���xZ�QN��V�1jBȵ
�+�Z1���R�,f�9���^�W�e�S�ŀ6�Ϧ����F�Y7�v��O%�4	��I;J	���X<�)d� �;keǅ<Q+�$p��%A�J���c�w^�LQ�90��D|�g+c*�q���P����n,����|߿��{=��h�N�y(x��^(P<c��q�'�� �%��-�GKKX1�Q'c$��>�2>�5CX2�Dd��8\�P�k�'��R���� U�*�U�T@�[�%y�h����[1�_0�R$C��IIt���$�5d�5^"�� q�B2���F�����Qz�8�^r�������EYc�:{ 4�f��B���1E��Ҏ���3\�� W���C(?\G�d��cT.!��rENjr�Ýb��;}��Lu�ԧR�=�jIƂDd���&d5�Vֽ,IWJ�?rٝϋ�1�b�o�7sLz��+5�W�ywG �XA�{��b:�WzD�d��Q1��7�D�I
�x��_��,��
�������D�z��wH�b��Lc"�,(OCՕRU�ʻ�AH=��	�dMJ�kI�pF���,6///�'�M         j  x��[o�Ȓǟ=�"��ʋ��D�WƐ�����;���E���o�J2�3��5�]1bӄI�����*�湑a6S��E^z�)�0�i"?+��z~�N������:�=��Gl�?"G��	v���!��Kf]g{���4���[����ػ�f��8�!�B�p����[�̜�}s�<?�2s���Wa���{�x���s��#�3�~^0q�'o�|I�J_�f|~���L���IӀ$�5�C^�������-���)��;o�~vFK=b���l��Ϯ��o��@�x ��#�wl|�d�ɞ�67� ��I5��+n�X��^tERD�56v?�c;B�N�®�H#�s7�9�}�x�j]G��	����}c����1ݙ\_ؙ{�X6�,����L����0ڍ������=c{��(�kԡ��}iF�T�p�y�H�"2���[=��}%��=�{�w]�]n�ī-�9����He4�Jzy#b���ʎ�5�ӸF̅�>s� _��P4��L�l��!���o�v�J�/Վ1N�5�Qcfˢb
��$ox��_�5�5��ߑ�;���g|�v\7�5슱�4�QTRi53��13�*{�6tk���F;DMpw;��yf�SP.�)TH��k{������[R��=�;�tO�9i&Oo�[\���/U�$�5�����7vl����;�2���N�8�e��Zel��~J�4�QԨq��[��U*�=%P���]� N'��)E\g�MG�j�����;�����E+���tlz�h�C���.oӸL�<����N�� ��;df�9;�pu>a�F�U<jM�t��j6v_�A��u�ԑ���F�6_���f�QXO��ԉ6��V|gZ6E�1ΘA׶"����l
���sy5tY��U���n��wv|O�=!;S�&Z�]�H��3�ZP�����XEy��zp�0��e��P���!`��뻴f���3��g�듰�"��e�~;抜[϶��#s�e��[f�a��g�w�<�}�g9����ȿ�ӗQ g;dPM_�B�|Z�aS�!�z�ց����Bh3�fc�v|bj��,B�s�g�ƪ-�/�L�%A,��Xl��d��2
@xd�;�qV�ژn�d���B�Le�f��N+ҍ�7v��=�v���{_��q׵�l͘ߊ�� ���ZД��=�Z��QO
j-�Ņ��]��� 5�����t:X�	��ҟ�����[x�s?��z��+/���p(����I�������������;���I�|��e=,r�ums��h�#��->��;=���9�l�A+`]N��b���>��ul�c�~��F���O�T�y/����}NJZmq��A{���t��zg�=
�2�[��%M�%�{~���G���-6wD|�
�I}:fP
�ޘ$��L���a�`���r�/������='�:XȚߥ{}���?�m����IΞ_�/�7���W�Yg���8�`���3�/�{u�}Ι�����^!�ÿ�3 ��[Х���B߿�Rو��G^Ω�Os�QzK��݌�`��5��/}%;��^gxe��*u-B}0�&�q[�)���	b����t��t�$��d/��w�=u��7Б��x�r@Cޔ���;俀ߋpԻ���Q��Q����g ��PK���u�=l�'`�J��5��=�v!n�uo�=s�zmjC��i��8T��Y����{��3}gpJ�5o�V���Z��*��;cH#(���7vd��;C��@����Q�2��:��V�0�U���[R��R��<n�k;>"p��ʂ�f(=͇�T]�!�ʍ�*�x;}����Yǽ��y�=�8�K�+)X�(��VO��E� ���ά�)9G������M.�v���n*ݟ�����qG�}�-\	R0���D�w����d~G�����	���{�����i�7�Ȗ��)��y��M��9ic�����17������)撺:��\SW�5�(j�R�.�b��߷Q��!��js�?��uDx�g�Uq���5i�LMf�>���-T]WoNyuzd������N���2�!ȽN˴�h�hS��D��|Vm���2
]���ec�i�v��z-�����E8�"��ݺ��-����A��k����!��0O���L�k�©g�r{�}g���V�&c�0�ݪ���U)n�ĈP9��E]�~i5����ݺ���=�w�1t��b���W��(*Ӯ�1�g�(��J
���"A�3�|�r��$0=}%.�\W�~���A�_R��	(�Tk�/�*��L���98"���! '`~KZ�1�XY����,x���ƞk;�1��yDXoU0ԓ�z�Ǫ���zZ�R��<8ąu�`�^g����<x$�e+{��k�x�r-�JK��V�u��7��8Y��R����G|����A�r<�B�g ��%��d�-��v�C���V'd�{64�i3W�慪�f�u�/6������2c�؎w��L�$��e��c�{]6z�u��ͳ��[ٱ%o���Z\M��F�֥�[��"�U���̡0���6qcqG�p�|�/D/E�U���8�	���$Zr�	z�|�o�G��E�����^5�����9�-��t�i�s~E�#6y��_k���� ݑz�Z�ʭ�U�sb��B-A���"��x�AM��6�ί)���[>H}�}�XS�?ze2��&�wvd���ߎ������CT��η�=�A�Uy*��v���qG�i2�w��;��<������M��.&T��o%No�-2�Mg�x��M����8["!��evE���[���g��Wy�O�;�{��{}��kvԎ�q�ΏY���Ʀ��y�8�|�ʗކ�5��Ĝ]VDIH�&Ip�7�P=�}]�	��ᓀ��a�����+
Xsz:,���9�����ek���;6���/t�l<�;LM7�;ryxS�s��e]wq�F�)?o،��`!����@�>���	��M<������;����s2;g7?�����Oq{�Ζ�L����v3�7���)�>D4��� պĲ�z��*_wq� }��y��
�4))��K�6��M�EM��Oy���b;h`�{n����~��
E         ^   x�5�;
�0�:9����v?I�=l�-"��?b5���<Wfn�T���4�< �����{)���f�F����Ԡo*�5P���Ԁ��{��&�         I   x���� ��T�D���|�����`�e��/�w������ 1J��إsY[�:�������+         <   x�3�,N���ω/-N-*�4�420��50�50V02�26�22�326117�60������ q~�      �   6  x�m�Mn�0���S���v$B,6HlLjKq�V��-�,�!�1+K��{o�5��vU�U��h�L�C����^\\�Kq�������5N
fL �ZH��cq��ێ)ܕ��B�B���Ǳ2�]��4vJ��Y��^m�����N6�4�=�߭����Y�T��C�yaM,��N ټۍ���;n���18����L��*@������/feKE���$���6��]C�`����U7���LI�Z�lM����dT�"��2�^�Z=lN.��J�Wt�=��u
f>L!:F��I�      �   w   x�-��� ߨ��zI�u��v���h�
|���2dIc!� ���;�H5�/+�ǶՏ5�ʬϫ��Հ\�n�R�af�����fl%4�F��?�4�������?�V"�             x�3�4�4�2�F\1z\\\ '         `  x�}�Mn�0�דSx�]e�$K���*BM�n���Nm~DoS��)r���,k���=Y�3�əa��z/�}t��|����	 W�YJ�O��h�vd���$	�0��D[��i#~�kP�>gØ��_X�K:��V�Hnۅ�F���s�#��-�	BDg�9Ff���M�FH/��'ik؃�(S�O��n���J�gطU��or7���Ix]��,أZ�
S�o��V�S���G0@�A=7��7�:��� ��ޛ������ h�8��*=hR�~6��JW�������ቸ�BvD�-�ËԺl��'x�JK�QKA�d�kmNퟮ��gPUy�����v�з         h   x���1ߞbNkH6I/�X��,�"k&��`*5Y��Q�Y;.G7���.'���S��j~���Q��(�R<D�mE���+%�i������         h   x���1ߞbNkH6I/�X��,�"k&��`*5Y��Q�Y;.G7���.'���S��j~���Q��(�R<D�mE���+%�i������      #      xڋ���� � �         s   x�5���0B�q�>ѤIv��sZs�+"�-1��)�5��St	�l��Cl��B��%�¿M(?z��GP��	6����pN�T4�-� u���A�s��x'      !   )   x�Ĺ 0��7L �������B!�'����a�r�f��      �   "   x�3����ͭt,J�L�44�4�������� c�[      �   �   x�U�M�0���)zÔei0Ɛ�\�����IA��q�9��Laa7M����f2�4o�77U�	�2�8IQ���zi�u�2������{�C��r\��N��J"1��C��&�#B �v�dy�͠�jt+Y:k��#�� ���W��_f-�+������,f�c���Vb�Ǽ�t7}Y��A��aՊ�ZP,
H/7��� ��_�      �      xڤ�M�[ّ%��
,�f�~�j������U�60$�D �%i��U-�Gd��L2�bL=�в㏍��<DDVUe)EF ��w��q�������z�^.��g������ý��ʿ�y����n�3�?C�������?V��7������bA��y����������|�n���bK��WȲ�������b5�^n&��ɛ���|�|���oo��b7y4�nכ�R�3a��[�;�M��Lb�VN�p�̆�0n*�8�~s�?6�W��n3?�ά0������gg�n��[^���W��O��zC�|��<����HYG�h/�Iߢ��Se��N����|�n���L�x�q3���w����Z'����H��#�؛_�����j9�M�-Vˋ%����r��@+��
C�
�l�G1&Ȳ)�`S"̜�3�̔���7�(�\�*�2KY�v����択��z���R?��}חC��[)i��$�!�(ii1���`g�ə�a�ݭ{��?.V���5=��jO+��I�|���ؕ�N�cLt��?ϯ����W�ϋ�v>y�ٮ��~i[:��Ɣ�K�;~��M^�_'O/�_η���~�{���ׇ�$�"�:�X_�SBڲvS�m�J�Y�~����l���K�>�o���CcPS�4=O��љw7kA�XП�H�]�^.V�'~�>��n��y���=�K|�j~�9��[:�t��7ja�my�mhI'����%>W(1�t�$m���:}G��^a�C������?u�������b~��^��&�%c�y�^��~����`L6�i�
������n���J�BM��['�o4m�L�]��ή�.�˧�	Si�� �5��������Ö��f�C��^���ZV�f���������Q���t>���^�WB�	b�L5��%����[>"�^)}���V����Ғ閕5����v�u�{:��R"��PJv���៼X��濧�ũ���Jխ���ջ��?����d�A7�F:^�̫!k���e����E�v��z\�.�N���$Ӹ��%���YX/���L�l!U}��O=�O�.���`�Q��4gu�M�(i���y�"�I�>}��������N���������v�'�7��j�����ɚb��`��������fG�����$�[֭�4љ3���ӆ�]ѹ昉��R�r����/�K|ȖO)���ɳe�o��d y��6�bl?,is?.�?������A��z�T�*�ІO�����PP�,��:��z��ɰ�6�M6;:*�?�v�!��9��z����[M��%�T2
F��|3y���+4@�Kr�����l�Kr�d*��G3r�<�p)l��G-�;�Q�tZȝ~�/��yʷ�c6�φ,�n�z�~�v��g%���a��~ɮ��+�/���RK[!�J����ZE��^{�O���8#83��:�uA�jH�(%���.��O������l~���J�	{��aj�y#�+:l�=��s�|�������riS���4�g��ˡGN��f���Ύ?�.w|�;`�z�[^.�"�W4�G���:L��=����=a�m�	Jғ�3K�Mѱ�V���?����|��7����N@	�I������=�E�����taov��	:�s��`���|hɅ���=�"�75����n�v�����'�����Jc�艚|^���X49��KXz�/�x-�+N.��8pl�j�g'�N��c4���\�뙩jQC���Ɔ�L)�xc���;f�M�l��6�����X�PG�X9��ė��v�p��`�"7��V�b����9�fN�� �C?�D1]���g���	=<���B��aq���]�Z���j�n�Z"���O�o]���� H �i'�����7�O�gGjKiK��D-/Wljd��!DU^��E�k����9�2���P�-���+��a��
�YB�*�?��J�Y��#2���)�X^����u:��νӒ�,�*9�YMD,��f��.���n��*'$�끦o$c[���Dng&[�tK_�%,�N���C�ԄP�W���l�_m���쩱dFN�%?�_�Wsѹ���xA��B�3x<����x�ty�#�#DDGBȑ�J
�	���������毀��'���~��	���A���Q��n~�!�B=Co�P��Jr�i�i�ȏ0���Y9LV̤�g�z�W��5��o6+^����WKcqx���0r& �Z��0��{��g����
]2"w��G�F尥F�Q�J7���>����[�TH��X8�CZ����~���K�c�_���s���}���t=��g�J�K->��#��Lp��Lɰ>9b��u�6�P-<=���+p�N�1^����|�9������w�����v��(���+���?��{���N	��B[�����Y�f�#�g�X<B�t�����6�2'�����_oo�N>g\^,�+l@�������S�	��MQqf�"
�M���C摅� Tݼ%c��M7,~nSo6�l�I�!�jvi��^,	�_|L;��(rx7�X�觳�uكx��Ө�[���V�㣜YmfB!�w<�Sd�	 y�\��z�5{�*��II�b�~�gO��Wl(ኜ
�=�GTEr^�S&��;���">�����!A�)��{�$�Ӟ��֢��%~m{E����r��%-t�~~}�������boߓ��G7y�����W?E��#z���|z���y3�G�C2��Q�Z�~��{�8J�������X���7'�ͽ�\͑��m�i������~~�e�jI/6a�+SjA��Yic%��%��ҡ���GG��	�)���T	r���G&�j�L@���2eC��ۓ)�6�":�R���l��މ�wl��~,�d�nr��]����M���ҾX.�y$;�؟�.�K»�7�w*�XG�>�?�P�G�۶[�R�)a��`+!Г�(i��V��8��/ǲ����f��濍"��hc2��@�%-'�YD��.�I-��XK&�L#���9�f]�7krPų�A���J	S�Z`@�K.�#(�2P">̷��i�1���G,	M�C)v͂�Xo��/&�[-�k�4��u�h��q�i���1y>G0}��g3L=��SPkt���0�'$E\�'<��-��".�t�-��hKX+���R���2d���}�^Em&7�fb�oqh�la���݆�j�+/4�qHG��l��JRCؚ~��sy�����7��������$�K+%�y�����O�F��=xL����}�l����h��k�S�#k�̴������IʸM�_�D��=�I4�M�����L�fo�W7���O.V0ό�q�%��^-�`�QcD.�sV��-n�,!�`g��"r���G1�t�H�������d�ج��='��c��q$O)�Y���>���t�/������Ke]�ab��	���'P�x���DA���#����'z�?�w�Wp|�&�؄�Ȣ?� �"�:G�>�P'�m{ݥt����,�#��G�$Iq�� G�r�I�z�©6�~;���0v���8����_���=���PP��C[�&�f-��f�>�3�V�Ǡ'N����4\9^��^_�ٍ���uG�貔۰v����P�b���~z���k�;@N]��A:#ڔ3r�T��̔�*��\E���r�6��S��h˃�2��sA �֦Z@N�=_�/6Wt��	��y�~�E̋VGʸUDg��~	���N�G#5RTo�j�(�
�c��k}�,76������Sz{5�e��8?r�;�T$�҈8U�x%KҾq�uͬp,�p[�L�m<ݗz���x�7�/W�i��0�?{>�\/�4<T�0U2! �'Mv� [@����3��_��O:��{>�\����D���BZa�-�θ��W��q�����v�N�j9T.�
���� ����� �Y}G�!)���G9Y���/I=��	���J�7}/�x�5dE�%���T�Ji��f��avL��ey-F��ZDr��r��29��`B^�����c�ȻR�    ��+e���eTj��h)+�Y�Z�s�����<�9��,'�e��h7�:P���G~&Y�@��B����\�岜��@�^!��{�	%���ۙE=kl/^Q���������_���\}�=����tq�W$]
��\	��^8�O$](n�v&��w*�G�^��&��%],��~����Y�d\�����@�n�^ǊP����ܟ7�����_�c�!Q�u�e��4�'�֨�)Ҡ{�`�\�-'`ȟ��7z�tN�,�6$r�z��������W&��ǥO�y�^P$��h,c]����*�9ki�)�,�0�����1����w���]rż���_V�T�߯ӏ�{4߾��7/ȅ̯�&��s����w�}C�o
Z�pP�:�j�U����3�	lDڬ�S��"k%�3�D���vi�.c���>x}�D=�p
h1ּ�N�r��C�)og��^�|I�w����8F�^tuP�;���[:���}H�!���g�U"���I�f��F�k:���ȉ��h���rt`��oi}�6�w�����U�
��k�4��b��Q��@������Ɓ6����&%��Ѕ�����h+�b�J�L��~Z�|�k�V�.��%�Q3�&g&�A�v�,I�ӆ�G���NB��H<.r9"3n�!ݦS�^~HC�9_,�|vh��r��O1Y�N�{�^	�'ҝ���:�2��ǲ�כ�i���F5)�T
���Eb�������Od�"�H�KI쨃�k,�5S�w���;#߯�yK$L?��@�z��/������	~DҀC
�eW_<|�*̂�K�ԅq�-	yU�p��Y�>���+�|}��%��"�r�+��v��RX��-�TQ)����g��z����-��~�w�M�H��N\hG�v�`l�7A��-wŉ]Ϋ��x7g��o���ŧ�;��\�x�|�GCL��`���%3N� �w�'XTK��B!?�N���Dp�D�������X\�c����@a���;�DDN����\���0J<�ڑ��t|�1�2��l1���G��5j�]*��K�x�6�"�H���`�9|[�4���t�ɝ+��v���$^2�]R<��,��]�8��m�T'�_�=�I#�b�5V�G�!�Y��H�@Q/�:_��-�R-��93��d�/��ٽ���y�\,b�TC�N�p��j4K1�L�������y��M�]�Ϲ��D��-��@K����A���d~�|�����2g]�ֈGIr�t�*���,�d�W8f�)ƥG$=�r�A���G��n�J���e*�c�T�d�����S��?�����7�]t�B���=��h����~#�]� >���+�����fۂ~,}�(NOFG>��
�=?i{�U'f�"d#M���g��e����hν�GN�������;���O�+� pA�섣?���&�{��"���mPS���!p/ɐ"ڋ2�m��g�Fr�(�46H���j�o���bU�搲��*�{�e��\3B�A3H2V�Z
����A/53��w��׹Y���^_���TNIFI�N�]@ ��&[��U0S�`|MR��^*�`2��XdE��K��# _B�Ȧ����gת��si�d�Sz��).�J���X%йd'�����n~�w�{\^o.>�A��ǻ�#��[���f���>�/.`^�%�x�0�(�����AΆ�,�8g�̄�P4c������-��#�%ȡ�����P:+�_���#zI�^�<�{��aB��	U�l�6�����3�p%�p_Z>��ƒ�z�M���6�^��;~د�C�� ��b��L� �G�,�V���,�tk�z���Z&*�%��6���=��v����EJa�/~��.W-�9�X�W�vjTN�2�l�x�Mg<����)�q����1¼w��*� d�4�D$���PO1d�T�M���P	�P>�T���DW���(]|<�D�˾g�]����9o@M` ����Ay�#����귵!Mk̀�w`��!A�`f9$��^'9W�{z��c}NQ����̋�) `�%O�q�^6�h�/�ˑ����ҕS�3aG[���j�ѕGQ��uϒ����CZzb�VhO�7=�Q߷'�!.a"�tݺ`R�G?E3�b过��g��g��X� �t�����ކ�s���@[O9a��������@x8� �Z#���X�@��lx+5��x�̑&,l9A��?h<*��K���$���Ӗ�6C?"s���J� S�7G.�(Xf�^_�2��
<NIF���� �����Y&tV��������'��!���27ڈ̣�@�q�o�����3�54�މ�I���焐lW��
�J�!��߁p������jC���/�D֎����b/;��k��\��C�)�U��37��U!�6�ԥH��ls^���Bz<�<�U���dCW8���_"��x���6g'�#Ȇ���9~ѕ����9�T
vf��5���o8��p0�h>�R׻���:����wi5.����A#��{���l�؁x�@��.���e� k�xd�):��q�V�Sn�n6�Ͷ�T��.�\�B"r�%sr�[z���"���-����k�F�B�D�Y��Q+��B�F͓ݼ#�ǧ�~��v�e�/�B�ӷj&��>>�{��薒=Юyh�~h	�\^|��+��\	d|�U\~v2uk����� �аuo��&�x����#���u�΁�B�(\�! t��k���r~�O�'��'H:m'��v�Uk��~K�������	A�T,�rl���ao E3�93cb��3���p���+p;���?[�j�<�%��B+��+��bG��� �W�
�`�1�b7����$�C`@�g5�	䲹s��
�:�̟r����ǣ)�l �Lǝ�a������Ѱ~?��<�g��W��lW�+~l�`j�|�����k�_]�c�n���L�k�;H����8�=������w�� �$��5.������-�t�)
X�H*�����\0zC��Ką�5*E�GrG%����7����$L��ȇon��_/��N��R�K�@����^�aujM!��TL�u�'
ǝ��)���hc�;�ԟ2�m�]�F�<�Ou'����Q��c7��=���� !� s�)�=�{̐h��Uތ��A�����Q�Z���@FO�����e?ؿ�����$�����ˊ��eG�Z�7�����o9e�M��P^�,��v�l��F�	_�Y4Lqm�3� �[ �gc	��':���Bc����S��Տ�vR��f?����t
�m�30J����p7�>� ��i`��T$���������t0�6���n3;#�N�J�R��	[������3�qyy2���̻��
�Sp�O��&&E'6D'�$��j}��C��^��2r	Z��%��y��2������\��U��,�\rx����X'��R[�
��@Ysh!��V���^k*4���ZW�,S�Ghr�yO�HJ�fH^g����n0�ך����~�'oD�O�����38R�&�Q�=Y�h�L!"0��b; ���u�}��� FGp�b�Fi���Z �S�.�Z�b�~f���F�Ό����qsN^�+���k��1v[x�Xd�%��y7�k�fJ~�%����,ǆ\*�ۢT~��S�#�N��3�g�d5֑d��/r�0tU��|��\Oe�'�������b�k��5����M4(=L��r��F��5�����lfR��"�(�X�>�/�lo��V��!�{8	Y�)���Q�tuS���}�d�����+��N)�|*/[�e�}�q1�i�x�/7�?L�0�?.s�Eiתd��`�	;s������� f��R����ׯ�akbo����B��Z�6�3˗V�N�*�Y0n����#��� e�]�ˏ�TS�M��3��^�{�U
yW�#s8;����R���qqZ���Ï䔮zZ§WRW��(؞    ���k�XJ5���r�d�?�=�P�g��7�}��S�!��c�{��0�Z�D'@���	�0yy�?=���Br���ϳǛ�����8(�("(�C�3�Vՙ��9���a�ς�v��nSi���u��H)����p b�+�h	�z�PI������R����0�<�J�%~��w��|\\���?�Ah^�״��ny�"	������ܵi��r�Љ�i�V�ްH~a�ٝ,�?3��`�	���*m�g�v�,�z�!Ev�%}'�0���D��� �"��H��s�]xs�=u�C�����)��Ƌv��d�(��-�I�P������;[��9 X�PI�c���:��IUmߛM���Y�g���2Ֆ��]��S��<zM~F<���j"�Y,�1�CPCպB��-8�����҃c0��Ϫ�!�"�1IIRf�!�� �af6�̪���{��X�~�&Ay1u����^%��C���}���:�2��]#$p_]qnk5.k|�)����v���zr%?�('Ft�x�a��7B�k��I�B-�b��:��Ā�Ο�#�O�@D���z�en�����_�\Z���wMi��[^�l���W�|��@�%=����#�a3�dQB
��*���8�w8����j���*��K��юj�����@�.��{z�-��B����{vUkf%�$��	�*5�XIh����~8�t�3�1]#��>�"�I=?i�p{--��b�c$�b��D�6��r����i��)Q��)a�K�
�6��2�O�d�z��$�ջ�I��wߝ�cm� �8^���?���l����"R�6h��ꗤ��S{����J<�E���}c�kL�O��ջ�W�k��R-�cӀ�C��6`�(�*�Ӄ�c�FLZS<��wc;�E
���m��A)h4`>��q}��M��館�J<�M(;Z~��mI��xX�� �$-9��,B�(�s	�A�oͩ�9N�s\�m��l���,,ɛwE�S5Yn�������4�8�{�`�z��s �*n�'���[k�W�W� 'e�x���tU�!�#ҙ��{"���ř������Ip�w�,�Ty�x4GK�fݤ�0���\DO��MM������2]�N����j�C��^��qؒFWF:c\�����@��,���1�����rj�@�/��%�)ȹm���P�O9���ѡ���^:���\�zL�;���vMs�ԧޑ@�E��ln�-!�#�n`��a��C�\!���~������훵�����y;�eX����r_��*�����;����]2"����fc߀v,˃� x�S�L_�hl��u
�|Օ�e��̠�_�o�x����ʹ��{��?�:�w���%:�j����a���ڢ��U<�c�tn�W�����P�!#�]JA P��P#��(��O{�Uɏt���rF�X=����p#�J�qރLN��~�y��&��p'�����!r�9;�qֶ��%����B�nz	4��`TZ����bw�_n��mI05M����I��u3t���('���Y̸��3dl4%@d�+2�;�G��V��s�W�yQ_6ڜ�szӸ[����H�_oXL\�})����N �aTR(�� ����m�y�.<�gE���H��w��R�Y�
��~]�q�b����Dx���@ ��D�:��+i�CW�H)ބO��^އV��\	�!2/?nL�Y#1,4~��@�U!DQw�����w�"���4:&���L[��Ğ�^�'��N�o(�����7�"�B��'�Kc�S��-Fu�d���[,��&W|����.� 8�]q�s�3�uN���@)�Ŭ��X�����_w�D��#� �}�|���i�?�fN�g!�������,L����;�$��4��	^䮅?V��|�"�C�iV�]�+4D����y�f&"!8�M^��Ln��`�a�*��J�5�ݬ'on�����b]�u�%,��?�[�XJi6-P���Q��$� ��P|S=����t�	���s�*�����#,�cR�t�������6�� 3��O�mVk�w��n|��L'�[��5[I�M�ӸѰ�3��y��pǄ%�ܝ�Vv6(`��m/R�+�2%��(T�P�g�g<�w��8T)�p�T�#@�%E��u�R��C�{x>_}Ɨ��\oR?	 ��G;��{U*�G-��:���c<s�ő?Ǫ�y1�Ǘ���fv�������#cMբ�
VM~�ƺ�k�o�M<��L���^�)�'a����De3�b�&	Y/l=2P0��]��ƞzWm/Fg��o��AqA���D��0(;)���-(Q:��dZ�dUh��-.��g�E騇Y��?	�ц�0�kL�jGWЂ�Oy��9;2��M��N���r�}���twA�P��Q?
�����#[3���ts�譺B�E��������5�A��t/�%a
��߯n��i%��ë��$�`C��������G�a�/�-�!�
�)-=���7��5֎�v���+�{?Jsx����iy���+H5wG-L�����4C,-"��5#�j1f��<:i3#-��ܻL�
�
�V�.7�J��안��A,�2ƃ��H��K�N�*͠1g�!�����y2��e���t��22��s�tDoYX�fo�3rtBݙa
1/g��@��V@Ij��T4�e
�SN��f�ګ��O+� n�6O�-��J&�<������]�C�Dت����H���L O0|9N�O	����K$�<��:�@�b����	9Rt��o�ų3Q.�;�_Z%���J�t`�7"�W�&�.&@'��3VtD���:�����Sy����Q:R�N��k#�"��"��=��( Zq�"�e;0D����;�P���1O����Xp���Ť��r>4P� ~�Ay����n{
^Ply����2e����4���x8����>]*��~��x8���{�z1�P��N���Ț��U6���Ū-��8{4Dç_�UU�WBSb1oK���SH�'IU�<�c�)ԙ0�4(Sն@΁��:�1�M7����Vqn��n��	����,[�١��8ՅI�b<j��ђ���8w<��^�^b�	�0ٓ��{N���}Z�2i-�e#�x=I���Q;з�<A��Aq��M���^6�G��\���2�C+r��h�AV(H�S�}? �*D(��r~t���B�]���.��-a��j\�\-�?�c����jƽquY��y��I�O�~�,�q<�j�n?Z0��5P&�cT�u*�	��ܟoV�y�ܩB��f�qu}�%�Q�PQ�m�і�W9z��������RC��ђ,˼�`_X $�n��!)
���X��Q����7?�c�ó�������,��(�ZbB������)� �Ɲ�)\?�8G��|��#��}���2��A/��؎�	͌�(09KL}�a)�@ҏ�Cܚ�/]� �<���t�d�cE�h3�.�u�թ�E	��H+@�t���a����w�7�TU�e��ͯm��9K$�wB@ٝ� �sj�*dc=@dF���x��'yBH�)��L
�i�����
���b��?	{��I@d~M�
�[��v��@]>砼�fƟ�F�`:��F��La�Mly������z��;3t͓��o��l�t�f{�܉�����w�X�+ģ3�$����-'��ϡS����"��u����\6ӏy����}��H�	��<z�SU�)�]w�}G�Yl�?����0�P߯k�e�8_2G?K$����;ΰ�E������gr�ac&�]�R���h���#�̏����0�d�	���?'�;Q"̮�.	�E돷t:Q3��w���3��u잴ł�5�\Z�e�	������Ʃ<�� ���F�m)���8�GXiz���|*� ߑ$�r)Da�y�aU4�3�*���Z|�̄�Ҋ��j-9�yWD�W?D�2u�66��&���q}#�����XP�	�I���-m��-�n�\e
K!�7Z    M��'�E��%��S?F����I?}<NF����P���I�S����1T��kRO�ּ�('^����#z��x�\yk�œ�8�~�M�4I (l�,��A���a��ձl��n������D�TS^Ki��b&H�����Sw��΀�zޠ9)�W2c����Ds)�K�EAwFq�U��D� �a]��d9cћ�w�]e�����c�t�����M�9���!vn!;]T����vHC��cT1�%X#T�4����/�M�5/�F���r�����7�:;UO����W��$��Kz9�~u��G�^��rP����(]���c]'E1`���Lq�V��zy���uI�	�J��b,9z���u�<�ȍ�2�BL����G�H���=��z�j��-pyzϖ��E*"֚"?�4���K;$)�"(g�9� ����M�oKXy�6�@a�0���L�U�>Ր�7{��G�.�cV�($A�օq��@��r��ݯ���� �SF9aLm�6���[��hyq�Y-'/��!g���!��k�D��^���+�2.,�ԗ���x`��U���?]�~w�R"�Q�������>���E�A�V,��>^���Z��y��}��W�*�MC�a߬F�{�8�;U�@�ј6]�.��t9Tz�[�m5���Wv`�o��G�Ot`)��VB�G����)
� Bzr���߷�EC70��x���s��Xt�pv7��X
���Ԃ+O)�MW�;*�,��כ�[,��nEB��wib@
[�BՋ�g)B�2�v�p@�V���|p��DG�
�,7�G�i�x�Ph��D$� t/ . x��0��:�i��~�ϋ/��*��c������A��O�u��;Ye��)b�i�R��j�D&�Ы;�E?К2"5аd�U����w��d��b��^�U���H�f`:�	\ٯ�Ѳ�p]Ԟ@"ņ�X�hf��~K�6����;���uZx��L��ü�!�6޸�_E;H�bV�ӣ�I�zȃ��M��t�t��lz�ͯi5��}~M7;���]d^��Q}ugw��+TAYn�зɼF��ന���cB,�8]J�������4J���Iu��fB�hrE�:��jC���k�,�#YDD�n�m&KXrN��L��\fb��"���'!��f�Uҹ�\/W��٩����3�R�+����~px�̠5�����@����r�HJ�>��6��Rt��~w�P�	��Ȑ.Y�~u��Ww�H:���!��zq����fА�U�y�T�H�>z�F��x�OC;�K_nSw �@����d�P>�3ɤ���ŴL�̾ +-UFq�J-�N�bL� ":\��Gf|ަA@��oј��|L��{���G�)�Y��F1��� �J����~��],VȮb�,��P�Ôy|o7M)����UG�$C@�%�EM�d/�����'�0�ft�ye��u"R���Y�ѷJ9�<��4��fd�	?n�$�a:�n1�,5	>G5����,H7� w�IB�0��M�/O�A��+ŠEt5�QW]��9�T���G��ɏ��r�kY�9�\�{A�v��v⎰�qܢ�����(?l��ƍi k)V����i������m��
�!v��o׹��z���^͗?s;���;�~F�A�)O����Q���H��wk?�������ES��mf,��-nv9��[H�53����ŗ�ũJ�T���$Am_�́k3��L�CĽf��gƇ:WH�,�L[F�|��;UI��GY�v�čn꥗�=��H��g1�>!�`:-� ��A��I��bS��z�R�*��ݽ�$'(��^�ۨO�t��i�3�I�kK�l��w�z�����D�ι���:-ZB=p&�A�pw��$/^�8:�C��ԷI�eq���00Y'���,�庣�6~�`�XQ
H��y����4��D÷�&��K��sv�=�M����J3�Y��F'�	I �y�ɩ'"D'���"�`��<rW6��LB�<�N%�3I��1f�-�6V>�	 E�׫��*�0�S{%�/b�J���������}[��>$Ӯg�� �ѥ�<Zm�؞sZ< ��ኹ�Q���v���a{�l�~�^��%!d���G�I��Ȭ�<y�'�{��̇����`�F�NM��GѦ����x�$ƱZ%�t��c�f��ǈ-�9�o��ʣ�>&�XDB�������l�0'��=�tG2)�� }�ԍX�tވ�6��&oٓ���<��'�po.>�W��2jdt�V�:v��0���x���^I�B��UB.�T�@
��v���婡Y��L
��	6�iѓsH(�&P���_�z��d>Ց�YR�k�I�_�-��0�ғ�y�}�}�fش�m��~���-�ԡ7`�&��ȘŻL
�,W�����籅��C�-��=���n�dP�L��� i�$�M�@뺛Rl+�,gy�Z�V�~~��͈��?A��H)Yp�n#�ƤK�7ԓF~��ݎ�~����!���<s����ɓͶi��L���d1'��ύ�0:��b&���]�s�ӕ%OS"� ׄ��|_����Aa��j�\�R�Y�Rs\~����|E6��B��;��C�,�87u���j�DT��
��Gz o����u��y�O�J҉��Ï�s�}$�8��W>���.?pJ7�{>��Ɛhs��`r�,�%Xk�+��-�E݉����R:�[�"x�X��s	��4S�T��=��q����{�RE�]�8��K��\��]Z�qwZp��Ϳ�uiI���BZ{ 3N�b��_�0�W�*�*�zr��<g=�oº�'# 8z@BpC��F��t�􇖵�\�U_�8M�[|��\f�`��ͽ����A�:Mel��������'
T�q�<�<7�>�����ג�M����Pv��F�=�Vo�s��Vx]Z��#�d�I��`�㏄�P�EJ��O�k?��?/��u��ߍ�Z� �|��y��Q)5�f.&��hXF��t���Ϝ��G�N6_7���Y�J�)�P�;�{u�b��`�	1>�S���2�A�~-
��s��22@0��!͋�|e�7�K�t���BC	��ܷ�\&�b��\c��,C^��5 �A�i��IR�����[@��j�G:oq�K��pг�E�����v�q<NFF���&<R ���1^��R����� &O���l��v���M�4Ǟ��,���MJ^�g������(��g5�kф��3D-}�gW@	��{z68_�(���K�3<�"���;�N������9��n�vt�:�J�m�V<{K'E��}]=��"d��̢�t�������'�|�$�Q��9gԐ���y����~&��.*�/���zz��G���~��Y
"�u�ȕ� ̢H-t;����?^���wi�E�X�ݼ���L�L�=���|�}׭@[�Fm�8��%4���Bߍ8A�.��=�ƍ�w�w�s�Ds*��f�f#�G)�K'KcF)��˙5�g$+{��C��4��g|�PE�i�>iɨy��Ӛ�����\u��
(@��>G	~Z��4���<�Q"ρ��^�M��r�����׸�>w^\��U�]�Bh��&_l�=[�xNv�9e�N)��q�?��i��?{K'��0��zF�]�i��|�y������NVR2+�[˕�x��B~��Q�Er��-��ii��� �˨�tXv�n^h�Mb�I�E���=�9�^^�@�5�ٽ�R���hM��n�l��G�".hѣ
qO�s����4e��{i�n'*�16�Jjo����<�ͬ�, �E�i�t��q&�gst�B����6}(��w�?]4-A�d{�������R2y�2�aX�E�S�e<��T���H�~ё"oa)������&X��������El��TO��?!���ʥ�f��s����Qi&H�*PG������j�Z�?V��M��Ae�դ��O��Q�c=�V����=�c������,ؐf5�ץ�ֺ��a�m�VSx'y�^��2���[�9
A(��^�c��y(����;G'�S�I+���)>    -=���ŗ�D��ӡ[_,�`�])&�Y��������&�G����<7����ŷ�o��N��D����8��=����Ε����CP����gZ-6��|=?g=��e�\ʏ����?�Y^n��Ȏ��%B���D�*efQX
H�b�p�R�$.�J�)6���:lz�]N�'�7D��վ�^㐛�\AC�U��X3��XcS7�],�:�F�:����O������+��Ufd����Thm(����:�3�r �~��������Nh��n��]�	F��Vο�➣����ss�С�IH@�H�%�s��h%8Q��q�z)sz^�?0����x���c w:,�Y�lQU�C:,R�t��u��`��X�,K��x�<��x���)�nY75,��f}y���!>_}@�?���s�%�'�J�#B��ž� z�U7��PW�5�:�<h���$El���X�-P2/���$��[���,x����Ի��]o �v�꼯���o��e��@%R]v����	n�_��Rه@��S�t�5vk.�8A��ʘ�kn�+�@�IJ;(1R�� ��[����]q��Xʙ��fL�m��7Bx�"���pd��M:Y�v��ܬ�bRB/=�tנT�w��Cm�[���4���8��%����.�A�^�2k�O������e7�%�U���*�����pS�EoJ�?�x�&%z�}e���X������˼�#,)��x�h!ކ����N�L�=a�}zT_V_��ɟ6�˒G�4_~b�(	3$��\!���1K���W기��;;Š���s  Nw�=�n��uj:��r��-�P��R��S�=O7�֞t8?���:1�IzDGo��*�Z�G�A�|�^��I��a�Ч�I/$���%��)�C&��|*� ��y��ۊ���!��W���c�Y� �u�U��$�.���
}�M��!��l,��7��jQU YNk��b�����-X��ߦ�h��ʂr�DH�iF/K�u8Q���̀�&G�yR�ʟ�@
;}\w��N^����rה�x#r��d��B@$j�摚R�~m�٣���* HK߬l?�A�<-u^���.�ȕ�ټ��6,��Ul�8E�\u$fkX��IQ��iRvƵ����D�>/˭9�2ܪk*UI����ƄH�0^��j�i������kpf�7ت'n�eG� �^�_c�����_n=<d�GO��C�������bQ�8Ggi�2��r�`B�U�=ӲL���������$9�S�J��4<Y5#]�f��l�,HE5�Wc��ţ#������tQ-�#`T6�\�%5g� >��L�oOh'�Q|EF�pό���f\����۬	?7�	�MJ,Y�׺��n������{�%:�)�
��<�	+`[_G@E�	&��Մ��x%��:W��t��{fs@���{q�D<P�W���S�)fVz����V���1�QY��Ƴ����~�!�]���4���y��&��;��̢ SG�H��eS��G�Q&�c�&�H� �S���[�,��R�C����~H�िb�j�t�&k���g G��:w��t��93�v��Vz�Һn��[p�R���,����ڡ�t�D�Rg��+	눺4� 2���`.|c�}���N(��2�L.Nu5TJ�7^q=M�(���/�	��`@�E��mf�{����w�t=����7]��CƢ���9�ηAd�t0�m�.��I���6)�M�ݼ4��B��d�<�Y_Q)�!�^�L��q��AF
��5	`c����:-��K�^����[nu���]A	XefU6�1��̻F��J��A�+=�hUσl��M�zXyNt��4�����If'�W��u%�w�+�T|o�R������x(2al>ŝ���"kY�R���s$� �n��yN���e����М�p����%ܹR��֓N=U¯��,(ި���ᗄ��JG]�芛��˄%=S
���D������l���t`qj�8%��i���� X2I� �d�k���n����O�j�	>nb.��&k'(ca��[|4���q-�ե�
�.�Y2�17ޕo�V���� ���"���6Z	� ��Y:��a$b����%�a�)��kd7`�gR�K�vE؅~�lN&`�fUw��WbHzq�B�V���B�b3����K�\!cEnΕ�g�|��k�$���`��{�8��"���{>V+��2E�z\�98x��������x��t����ō{��	�U%�|O��#�#�TK�'�D
�L��KW��l,�\�p���K�P�
�p(+|L��wU����I�llQhVj\MR`�cd�7/n��8y<���i8,T�S��ż�׋=a�]�N��2���|�-�<�3OM���k}B�G�UgY*玾���u�Ҹ�VɳFn� ě7�KW��V���>ìdV���%MYsJ�:$�_p�{�����(S�$��'�ץ ]�U�SNm�=�_�[�r+^�%�2�}���h�+v�<p���QD�W�V�\�� �d��\W"4�d�����/ �~���]Z���f�`[��[��_�]��־*;�0Co~�c7��*tGV2��)��^]dU���
�:s&	�����{8���{��B���R%���"Y�N�Pp�"E_��a;lb�P�mE���@�!�5ܪ0e�I�&�4t#3S��ł��p��)pZ�����D8�A͌�T5X����&����.,��K^�&�tN� sQ�C�T=����!�)� 7n��3Rq3�������Z$<��L���O���É�Ŋ�`�C"�]�7��Ӂ3�!w��~N���V�DL�S���||N��5���._N���gj�]�ˤ�= ���o	l�r�&�Դ|��RGJr0�xK(
�%�`B�kҿ��=}�(!yQ^� m�2e�_�L~&�<��oU%���C�J�b<���5~�74#�^A?l�,&y�TX�P�(���$�y���$N;՚\��r���m	+��i��g�/i�&uӄ��}��c#|z�=E��t	�P��d��I�72A	2O_v�����n�^��Xa+Ӵ�l~��v� �d�d�ͯ���<w��qAhH�h	鴚ġO|�\|`I�KԮ7�׽��*fN{Z�jN�)�������z������	��Y����ɺt�r��{��җ���5U�/� O@t�l�gR��d���v�.k %�b<k�	����p��EJn� ��v0=E�dt^��W�9�{͒cԤ�2U���DÙp�Q�632�Xw�S}�>@���g�>P��v�$a�N�<�f�;!����
����[S���@���>�da� �Mv�����9�#Q���{�6�>�?Ew��Vm��6F�i1��o(��E2Q���alгD5�����V�!�秗?��X�9=��-Fx��~�$��g�͖u�6	хY.���A$8Ov>ϰ���xq� ;��3!�FQ��kk�?zzI!1�U��:+u�+Y�d�t-D�U��B><�_FA�@é���0��wA�O"G �|v��Ϳ_n˚��3�;��S��ݹBdnY\P�iG+^Pv��O=�����"P��K�/{�U`吞���0��ApN��|�l9Jt����	���aqC��n�Wi�t���#� `ejqֶ8i��ۣ���
�.{
�W�W`T��ސM!�@Ν���|@p�v��{?�b<xq3����ꨘ;}OQO�����}z��m�[-�J'���
��d��'e�j��  ��b��7t�tߵ��&y f��	�.:L��[�0����4�ChB\)#��#RJ�LU�P4��Q�!K�=��5��?��,Mh�y��&2����&��v�P�j���K9���h'fRi�����7Z�&Ő�M��l�f�[\���`ra�	-�BB�me�73e5]WX(�0I9�=qB�:��D�(
������A�Fh�Ã�׳~Q^K�Sa�a�a��K�J�ĕ�A�ʖ{Tɉ�c
����    ��'7rV�p[ӉG���{B|WmĞ"����?�B�lU�C��u<T�$�Ű���,/�KLa�ԫ������%ƈ���J~��2�B��N�DUp�����wOêL�i�=Q�����L���t����S2�P�V{�ՄP��ջ��6y��G�J���T��pKj�K/�B?ڇ%�e���7���+&���<{�N(Lk�Fř-�+���T��"���J	��d�v�e́��.c�|�C���_)�<��s0[����9Arg�2�,f�D��d�^@[�, �dO�ŭ�Z�$��c�u�(Y�DI�����W���۹�.�h�O�u�h��f�s�N�V��K���=$�1*\�}ʴ�,��w-�Z�)��~��Q�q�
Z�y����!
�0l4�95G;�њL`:�v��,����
J���29Qg�2뛜���[���p����+�0��:栟Ց!T�ߓ�c�V�r�t�ޞ��b���0U�A�Ϳ��R^/>4�q� �N�q&��Ɛ�ݪ&���B������7��ގ��+��rD�R]i��(��ݤ���f"��%�|Ô�+(�D����!���KĠU������ir�`̫��ӷ��<:)�5�?��`݋�N1k���C��&�y��ƌ�sH�h�7�c�4A9L���Q�������޵p@v-��F��1�/V9 �嵚L�<�/�� d���h�޺[k��h��~;&���m� ��6�ӛL{���]��N�t��ST�u�F��	8�z@�!�B��J�CƗ�jf���g@�Q&�% ژ��vQ"�x���d����p��Wܲ`O�N'n�k#*���U���� m"�x��"���#px��,�Hl��Ix��_5����|^({B�P�ĉ53��"( Kbt�0�F�˞W���^-�ρ�q�ݲ3��	&=y���t���F��9��W�I@H�M7�t�>@\�t��h?Q�T=�ӵ�5���C����
�'��9a=����"rB"hz��Az��5R�h��������\Bxڧ}������$`v�s$&Wt��_:z�V�w��T�9ce�d�Bv��h�qa�����['m����)Z9gDM� țk��e�C�����kH��+]l�P��d~k3�h����ݠf!�K���.������S�TL�8^%+KA�Sҫ9�,K��@*r�e
u����ZQ�k��Pm����)}!RH�&�W������N�ro�R��𻵒CX|�E���6O�����޻�.K	I�$�}1A,�G�%��Sl��Sݠ3^Y�f݄n�%��vx�mW��$��dVJ^_v�8��|dVd&�NPi�;9���k&�Kh���v�';-�8�Lx����U�E D�*��Kc8�(�H����k�����K�����ʲfr�W�k�v�o�REMj��>�j%�r��XS(f�n�F�)ԁX���ثt.��F�3��e]/�N�;<R���+���OL)DF��	u��R#��IX
#�
�u@�CRx�q����ӡ�\�Ί;��_zr-��L���\�!��t�#B�G0�qAB���菎kO
�������b�����ږ9�ܰ�u*/��qX��ՕЈ,�C"�Ѻ�99%g�����Կ�[R�����j�C�zV��D�愨�Z\�e�	�H"�DbU�"�ac|��B�YN��-���b�ݧq7UAv���8U6�SA.���c����l;�5j�Rf;j};E^˦'D��X�<A�����L��}�>����2�`r����6���n�~�p�9���!Y�a���pb&����aƸ\�Q�� v
�G�nI8b�3L$Λ���hj;y��]sף6�g��-C�g8@b�W.݀\��~�V�ő����N�J�)e�e���oe��9��ꦏa8~5�ܕ��]bߏ6��tS8���PZ8�	�j:��C�����k���ƁY�M��O"(ީ��1���'d�r7VՐ~N����aN���:MQ�}�Z/Y)�[��(Ղ�k����<8�&-������������<��m/�{��CV~}��	�z�d���K@s�	�b�@eS,�����Ц	�ɕ�����\ק_V�>��ϧu��FT)��@��G�Ĩ�i0w���)>�#��*�)���6���̛����n������R$�6��*�{&�}�}f��Ua=���)���Y�4�	�K�[�nYQ���ZI�u�n��D
�ݓ�F<G^w�W�<Xw<s46e��OwWP��K�r���}f�4m��	��g�-���MHh��(��~�GHwe�kB��tG�R���}�a
9�Q����
�]��U�_����#�7��j���g��4��ܿ�rq�k���\�5��h�;�� ���ޛrf@�VV5����gv����&$a��U���%��	�/���d{�z?�[��2����Z�R�����|@7i�C#�5��b����}������}-��ᄰ�R���?Fl
f�A�\�?��X�0x4��AE�q<�-�!o�h~$�-���`D�s��R-���	�x~�.������c�>�Q�q�ë���9�.��=`�.���uB�m��q}5�$����͞��4c�r���W��jR�2V������.���x�,�ܞ����m<
G��0�sdbk�:T�L����6��o�����N��:➅P���t1pa,9�+onrF�VA��B�n����-�e�1G�`�W���V���E��M%48�ȌYC�vl�%M�a@���:�����]�i.�ּ�x�����MCH3.��`7�:�Me#xUf�%1Q� ��C�o\�eG�*�{ `Z֘�zm�8�}K�7Z�2T2�T�Ǡ��y�,l�����l��$��T������RA+��[��?�f���v�)ਗ਼q/I�+�;3Z��aP�1��Gc��� �^�פ{P�L �l�$�4��w���:�Ȟ`0�b��r�=�Z�i�/Y+��N��l>�X6&��EW��>�6�����^�\���is���Û���l;]/�=�&ȃ�����_�:5�#H@a���yg�������I� �u��e�!���I�L�}��n�m���d�U�A��#���l�I����6��rFA$[V߰���qک�	�b})�)Ѻ��%ɷh������ў��<��W�
K�\����_&���ﳛ_��i:���Ǥ���ޱn�m��p��g����it=N� ކ���tLK|��|ϣ�Q$�����k�p��g�M�%)��J�:�s��~V�A2�[c���ó���8��qOG-�Q��%D�:�-\�Ia�a���X��7�
����	���%��\�k�pJ����H�R��[��EN1�
]V���w@и,�J>�R��4��������"�Z)OX�8øcC&ԍYF̃Va4H��� �y��,��^�/y���
�-xtV�;��w 1+۴P$�`�"�����5cZc��cߚkuǝ�����H�[����Y2
&{�NY�$z&R��K:���u�X�����ȅ���&Τ�d<�I'�s��vkZ�)�̵mL�bS�hR��5WV��u7����Ja����uJ�p�Iƃ<�V"\jW�Y�agqC���Ϝ=$�ll���7*���|��9��f������[�SM��B�*'Ǚ������Tq��q|G9:���ݐ<�QB}]���=��ܭ擛���M�@�ە�23���b�e>�Z�n_����с�yj��>ceb����]kv
�*.�O��.٣V'ߦ(��/I�ky����C=yj�N�C1O��(��$f�$A�:<.e�~�A���/}�tL�E���|��_-��yf������:Ӊ�wD����Y��E�� D�ʋ�P�n���?����s�d�^r`�R@ ���`zi�{�2?�Nj@�)}Mhc�j���8��斶�Q�4fSdq��T�{���s�>��L:�6TM����H��9���`#���&�`0��>���� ,�,��nǬ�/��Q�%t�-�.�Gf��#
O��U    ��Ed]�3��e
��?R�7#��:;"<��%kz�ɇ׍bO*f�8�Ft���y4�	d1�S�2'DjDm,���J{�<~U��Z����߱
8�P��LZ1^���`쇍2�N����]/�����'��h>>����A���#a��G���W��M:����x�~hjcv���z(ʔ͔W�BbT����Lr�e��F�v��,��H�S�ѡ�� ��VU�}�8� B�տ(H��)�`s�o� ��=r��Hi���u�ҁ.K^���G(�����|�>�\"zE��"p�-a���g����<��<��f�yKk�ѐ��u66wYs!���+W��7�ض�EA5/��3[��1��c)X��������W��O�6���ef6f�uj������/)f}����WP���9ͅj���D��Ő7�J��i����^G9  �a�b�C��4�!��ܘJAR�o��?ѿAHT��J�z@#v^�?P��ׯ���cu����W�!�5|���;��O��ȔL~�YW�Gv�y�^W�,f�� X%��0�Ja?b�|�n�7)�8s!D%]�[��J��N�Z�E��u����Qϣ�BF�4����/�(��5��c̓��)����ڥ<�<�!\F�Nvc����O��vh
�ILB�B�@vеӕ oi�C�����6ِpR��Z޼w���B���Ҟ��?VZbA۪��C�n��gY�Y�vŲ�kT�_�a'��3�����ek_'�74bLWх~��p,��a@tє�s��n�Q
QV�DZ+�v�r�.Ȱ���i��h��q�L�:Zf݋~����I��N��|,�O� I�F� ]��~�j�-���LI>^�h��<�Ǳ�_��,���Ry(G��@�Ew#d���C�!F�(���k$Fސ�G����}�nO}�K�<(5%}3D|�V�+&Ep��f�!:�^�I��h��I��H(/%OiᎳ;ż�a�t�u34;٣C�ԭ��2e�3�{�)�.�\`�=%�: ��b-�J� ��vn+v�*��buKT⽙���
�b�=B/Sլ*%�L�.�(�ޥ�6�t�Sw�` |2�����S'"th"�I�2XȮ'� Nc���]�����J���w8�ˣ��f�9�4��4�Gv}G����I�ᴏM��Re��d��aq�u9�aS�x�k>���t�l'o���	�8��d?�(��=���Ey���5K�b���(�gNQ8�)���Y� l���(DH��;���R�&��d^�
(WމcL^|ٖԞ'��g�a�0E�5�Dz|���|�Ӏ゠�P8��r���V=�ǎ��Qt6m�)�(0�ǌ��'f�X3�n� OX��#�`���f�7����m�9p���}����"W�m��]U�?b�PQ��\mtcX�1�oT���t��89d����ɏ߽�f(�$������_���~�|��������&ߖVUK?�m�Q�ƸTr�Z�V�-�۰��(�7����DPk�Ѥ�~�����)��ی��q�P�j�/��Π �}-��ъ�.F�w�����;n�� ���vޓ�O�m��j�+����N�[Eϧ�qvwSý���3:�ԭ��2?�R��%}���v��؈���wY��H���S�n$3Tv��}	�$ !��ƴK �`6�*��*���8�yj���Ƭ���ԛ̓�����"2"�J:v�[dUe�G��|���|K`Ʊ��0��%0��/�R%^�$=� m��\�C������Sh%��T��gCd�9�-)݁���ܔ��ܻ��R;����Y֫S8���(A����w,�,�\�L�rjGo��*�{q$~nS����R`	6t�]��K�|���զ�t��U��7�C~N�~q�
8��ռx�y��t����c_�I�)7���iH>�0_� �B���jdE�-K���<Yя�05�^���Ӣ�N4 �ui�X��9�(D\Xi�Y�����L����΅W+�d+���h�(�l��a"�
�4J�3�b��yF?@�g�.�gY`+)�F���J�<{�$�����n���R�~���P���jT\� �IyJw�DB�����@iP���D��Ty�͟r��`�AJ��1��ӝ
��%�d��zH�G���s�0��hTWt�;+�W���L$���v��<'�uAn/����e)�vR�z�v�UA�G7}�t9Yv��GT%�"��誈5;`�v	�)V=wsV�#=��:r��cW���^�1����|�N_�0�dT!��`'r!��k� ˜ϧ:����2������c�]��jwٜ�������05��U���74�=�2�����5SrW_�º-����'a��6d
mP��r>]���4��=P,�:�4�f�ǒQ���
G,@����$j1�Al_�S�$�߸����7�&Z1�
vC?�4�Q�c��bJ�%{W ��~[��)�;\��xV#-L���٘�ӣ����;���$���4k�Ѯ`�p�]�'6�0X�
�A�ۏ���"w�ʈ�#_�q�8[]M}�c n�Fȱ:��(�8s��W��r:��(*��cD���ܸ��=���5��yA�u�����'��!Ci˝Am�~�'%ം[�����ƶ�A����a���p��L� �C�!��^6�Еr�E�Zڢ�(��5�B4�ޟ*��ߘyV��4����ߟj+iY/8��}f��>ώtV���)=�B�����;
�ѵ|��$!���+��4.+j6@�(�^OvF� �^H�ųTfJ�lhc�ݘ_nn>lq�},ݼ���K�Z��wF%���9�)_�V�g�I����!n��'j�� &sMƖ�(��v�Ě�_�.>l'��<?-�܏ݼ�_��(��W(�M��T|��ṵn����/9P����ۈݨ_oo@(�%��
Vg�r3ܥ+�����dkv�qK��L�M�̘d��r�,��e$��RQ���9�۪H)�j��#ל����9q	[�hό���5r�>lVk5�q��)�EN���k��o?������qy�n���j��>+ll��[��@��L�,��pJ�*Ƨ���W�hm��%:�+����(eD�D���]��� h��[։b	�!N���aV
سΏ�r��q��JU]c^�V n�c�$�(l�k�Ԫ��,<�)p,����#���2�		���f�#�qۤ���F�:�I'�u����I�s�X*�j�(R�.jsb���mz;���WP��N�0����ґ��i:gQ��ǈ���A:��s�==����9���SR�Eoy�.�1�5 M���6d'T��R��.�K�v%'UgY�U.�?6�5��@�Ul:�#k�y��IghHy�N,�!�E�h�V$%h��iU�A���l��J��F�Ջ��5E�dR�2s`]�& �Y��,�_,۴�6��Ջj�,j�:�E��u�/wW��ͯҸg�v�S�c�(2��+����q�j�.�R�
E�b�OZ���#C6r�`��a�c�u�o���B��ES�*V�	�rtf�$����(����l��#���w�~��DU[��W���:An{
��η�w2iǻ��BJ����R�[F�kh�X����0GTXS�xf�T/D����-�R�F���6��_/Q��.�c�kfz�/�՞�(�w ���pVi�jx$-t�5���J�<�'rhsyoPU�[>�G�=�!��E���W���z��1��	��#�`Ha$������(z�[��������V.@v����V���NyL���vT�6#�E+�f�NO�q��)�Ȑ�R�0���.T�q�F
��S��7�)�r.��5�k�#n���J�0M"=Y`B�r��@o�o��7��͐�9~K�X՟bvS*e��f��h���/Oʧkj��|Co|��%O�>�$xW$':�����(���,�y�l	(�b�T����(��"�tt8�XOm���g���ES�Q�o�P�嶕G��I����M    hJȋT3������� a�0x߱���9�����`'۰`�,�'��k6̛�=Yя:A�zX��m%踝tO�p��SͲ�m�6����:�l�ݙ�B��ǯG.�K&��]C#�5���Xܔb��{L<f�\�#5�E^!�v�?���yz`pq2^�6���]`�ֶ�(<!��3��cӌ]o���L
�#Y��▌����̭��ݭ� �ݠkE���2�qՒ.�<�OłOC��
C�8K8�m��h+�` C\X%`_81G�}F��>�`rn}(,Jye3��`�����_�`fn8s���A<�t�P���&1ˀ'Zt[:��L�|�?��[4���^�ts���_?Ȼ����Y��J��ƛy�����Dv,���T�tL��돁�3.��3B����x���1�u����)AzoG�mk�f?B+캓~�:k�ơ�$��ui�O7ZE+ͭ- ���!�A>�r�<F��|{}��罳ҳ���8x�c�i��Ș�h>Q�t�hC39�HÈ�A�(tj|C��t���p3<�~�5*?ً�f!5`����0�3�P����t��QsOfB�ש}�֙.0tN���p%.�
c��uÜv��Yr3tE^�R6,�P�n��Z�+
�G��4��j.M+���_�v�h��^�`~x�|�zۙ��\S�W�sX2��/�	���Rj*TG��ߔ�������b %�yي]B��|w~!��+\o�dO�\�S�ȓ�W���W�r�0F&C"��<��Z0��D�9�f\s�&�`�y�.��Ud�GhD�c�[!ABN120����8���)��3?ʩ!y��ڙ	��ٷ/_�~�v�������2s���������w���r)ٮ;��ΆE&sџ��b�dfBb�w{���-�<=8�h��V����t��n�w\�� �(E;�)tx�: ��^׿؀}��Pl+3�m�#�؏0$�s�y^ك��v�|��|��JL���w�n��݋ٍGi�-H%���R���a� H�O�C��w�����tF�,����
?+gJ�K��J�U��kmC`����q6�?�b/H����ت���X[._�{Vp��=�i���٫�G�c��5Fu/�ox��#0��!���!��&�u�*��I#ɡ�7�XqH�i���XK�C����X�z�^�u	O�����'�x]/���̞��+������}��w0^?��!��Rtr�6��:F0��X���N�A2��̛ducv ���SP�Һ+�X�.�_����@�{#�U;[r���bm�Zܛ05o��1�������eʨk4t��\Vš��N�����r�k$�+�Q�s�sw`�*��|/�e�VuË7IQeL�9 m�hz?^\�>ސbj�nٛ���PW(\�z���������r��5�B�N@9O����fEW.�0b��
^�7��6�_��OP��ʳ��V|��� �5p����;[AK�����m���Ҹ�gi�Ip�(�a���M��[k�W-&(�*תּ���Ny�tşon�B)�>�;��6�w�s�PɆ����=h�M��ca�3.`9�]Ag�9��`��4��RL��1w�0�?��ہi �ۿ��Vjf�Vd֢�2,�ɦ�e�3�NIe�N's`�;Z��&~�����:����Q��gF�a�ێ-�>�Ӳ9ߔZD֔��l�M�v�����;T	�,kF�
X��O�̙�F��Y3��@
#�Z��h�A�+��sy*t����W�͍�q��'�/ Q���JD�׆��}b
�%~NH�ћ�}W�����bL��Z�(4Я����>V����W��7繚)�h<(a�ߍ석A�Φe�3Ť\{Jv�7�ǥH��wAU���m�o�����Ff^���5,�hIZ;b��/%��C-j`�� �x�i
�u �t�v�!�]E!������ۢX�����L���@O��kw�5D����k��m�����۫�7�׻р�]w��I�SU�	c�gDqp�m��3S�c=�0�bO:(h���d������)�*3�^uiŵ�k��abb����Ҝ���]���4Ԁy
fK�@�~[���:ɠ+7�|x��2̺֓�'m�~�n�z:��/���r�UW�ğ֎k|�Ը�"�:䌬��C.ZQ�a���_n�w��"�6P�=M����)��Xۢ Z���,w,�D�-%�Z[!��?���pZ���9�蠩l�=�qbn)��80�e�)��9^Q�NA�3td��i}��}�mW��a{�۟��xt�~vò�g�t��*C�qѼ3&���nH�ߑ�+4D�4����_m��?]n��nvJ�T��'	� ���ޕ5PS;�hc��l������l�~�[hw���a�׳��߰U&��_on�hG�,T�P#-�Z�x�+�ZP}��bR���}5C*Q)�_3D��U�����~*�0����Kx6��W�w�,���kA����IK��>�������5���6Ң�0�GE�c�h���i{�5��u��2�,w�(�ƴ��;lGXNSy2�����F���C�=.jL8X�S��]V`���q�D�3w�K�g��9�m��< WRDM�N�֔#Ƹ�+��`���ֈ{>���$�|�fM.IѾ��R�dF	����\��n�WR}�*> f��l ���%�w--w
���f4��2f"�rD�0�v�Q곪�)�J�@�g[PvN��v��&g�t!���cU��B�>��M�z��Xز,�K0��� <���jV�"�g/V��+o��í(����^^��ʧq��$K���io�����ӂf?� ��B!���n�`s�7,�� ��՗�s�{��)��{�[<�E(�	ò�Bs�:�-
���pl9��g�]�ۛ�CS�~��]Yi�j�������r�6)=[ŀi\�Z����}JP�Qʲ ���;Q�V �Y���g2Q�﷟��;^�Ŋ~��W�Xw�sP@̲�X�z0j/�6���`('����_�>J���O?��m/7&!zn�C*T�2��T��K�+B���Z�8@z�� A�)%T�Wiݪ�.���+Y\|��6L�9՟A_�@��QP�zǔ���oO�l��z��}I#�,�j��.w
ق��H��&hy��<�=p��_W��%V�U>��}�A�s��v	 .~H�(����w�-�N�묊ϐ�_P�߾���aڳ��x�_o����b{D�*�
�'�9��sZ�􈴯 ��*l�	��T.*���m��=a����
���Ȥ�ǈ�_0��DS��i���!L/
��хב)`�X;&��\C�nP
�R����/;-�,e;������wѦ&�zT��+���j&���Gt[9]C���O<'���K#d�x��䓊��^�%0i@h��d��{mL�9f	5�bƄ�p��Iɠ����8|(������F�W�GK�<�*��$Nk�HLT���h�U�b@��dʨ��2������?����Zu��_c&J�h�P��GW�����\-�؃:�#�{�=Y+C���J���]t��|�z&
��,�5�Z���H4�kPLJ�R���Ð���i�nFw�]�[�6 �c$�!X{Bn+r��7��
Ԝݱ�נܯ7�*q�`�Ź�7�Iw���ڃ�T���V��������E�)w���Z�G�amۺ	a��"A�k�՟�vq~�)�Loh��L��ɢ�-r7e&�|t��:,�PЌ�|�;���Q��4�?�R���S+.s�Y�tTa5΢jb���T��TF�۵�����L����g.!R6�)�=zؼ���(�>ry��%�&�c���C��r>Y��[j�Ζ��8J9�վ�.�y��������I���nhZ� Q}/��֍��M�5����ȬE\Vu'
4���!��$#��#� t��b�������RJ��ZJ�I�~�Sĵz��0q����[E�)���	H�G}�
��+�z$��Q���L�(���|@�����
�=ؒ���[(�w����]C��3�    �Ss�Q=
����B���gz���5x�Y���vB�0M���de�z�H�3�8�M���夥�d]\m��NtV��B��U�n��Y�w��r��֋�_&zP��~��RʥsZ&�i0:	Jyi;��D\4�@���\���|`ټ4��$Ysfuv��l`F�ǭ)���ʍ ��l`9��6p�iAj8�j����5h�BAS�O�����z�����|��a�;�G_\~�^�dn!����^��֦k�P0�T��pl�Hq���^j�v^:�)�&,BỌ~���؍�ҎJFO�`����U�fA0��7u.z���y����G{�#��Ή>��g�Mˊ��*F�k�d%�f"��e�Z�FЯ��_�,W�Xb�E��k��b�:��W8�<)���@�vI[9��X�O�����;��qwS�N1?]8&ť�E�rŢ�B9)�T�ly|�=����`V�pE����K�B�nq>��3�bJ�e��d�V;��)�����i�D���V󓧻ʝy�0��t�(���}�jd���� ����M�H8Q��?�V�Lj��)�e-b�̚~�L��Ԭ-�!�)R��'�3�9J�ѧճ��m.�N@�{�z���oWc�M��W�J��ި��䭛�G���6�e�%�
"�sf0��y��*�:"%�Y�Ω�C��6~���T�Ǣ8�J��
'<�uXGʁ}XN����iɵ!#��Y�&��(�<R��=�T��}�2Y�F�f��&2�0g��5BB��̐[Ƨ{���y�H�6�λu?z�i^jI�I`��`μ)2��RKq��-����T��킭Ct�n�'%�{]fxp]�'�${���X��C=��!{=ϊ�(hb��%/�0�>ZD4�ib��)���|�����?�E�~s�PR)�;�P�s���Ɗ �-W�*j��3�䍷��"��>v
���w$'U<b����i1�}�H��
�Ɉ �D��D��+ɰ�mӮ��)�Zӳ���0Dcdҫ���&G6���$0֒R}S���Ҋ�w��{r�袤zw��@�:T��SfҭJ�f��)2�tx�HX�S5�hI?F��	��~*�7Ɗ����� Tq���S�����V�0\�����"�11jOAO���` �A�#�P��xVt���e���N�QG�����~N��`��q�)_��u�����(�G�汿Oգ`=g��ꉅH��k>I�p����6Qs~@0WB�Ď47"j����
V����)��i��"�bdC�g���K�I�?���O��D���=�/Է�s]���d��XxBM�.���-[�f^v���tm)�_0Na�cvN�AB��-���?0�:S��8��@���qD�K�H��s3���)���_]l.�Q���XC\g��7�@�����7���[99&%���0�{���OW�kq!e���iH�Ǥ�k�:�+_Չ(]09���n(k_�?SC�ꁁ-@R������k�rH
�-�2lo#�P�kڧ��/�(͖�`b��B����ck>:4�)�h�je������)���L{A��俦�ޝ3�Ah�9l�@������)��An�47�Le�g�K�����=-ώMz�{˿IQ�[���z?D��<��M1ؾ�c;�|8��K���(o
TC:M���%*������)�K!�L��Q����7�t�mů�i�hR��x���w��?�8�B[Hs��g̻�
�
�a���ص�Ћ�\�|q�g)�/�M��l�|P}�0���ʐt��)�����NyXo��6�s?F��M�e �sRc
� X���0��<�!T�:�����03�?�ε��9���9�P؛H�E�D���<C;A�R�ѣ�d�<3�k�\c(���E�L>frx���It[ǹqY�gDy��x���7͔��S��4��+�d�Q�&�:�qa)����~�4����l-�b4[ 4N��Nz�!��|)�Q����$j\�U�Br#�_�UY~�_o�ស�xE_�G	p�;�B�>D'�ϔ�77�Ή
@���W;��D�DQ�[���h^tw��R��5kBD2'������P-9��ˈ��;��L�'nbl���y��dP�7m�8�˛`��S��3�^Ԓ1��[m�CȝE�H(셕��$�@�e�Q�1���)VNHe��e�(�H(H��׷�(SU.����<Gu�Xl6>��5;��d�2�qZ����I�w:��`up�m�mۑ�:���wK�2��vا�;�*̢Z,�^���@�5�q-�5�lD]�MK�~���M��p]ɂ��Q���R�U��VUҽK��_.��<KM1Ep�SBǇ��U��׻��O�W��ͧ��)DL���v��⣨�?������c.3�i:�Q[�]�B[o�"-u�:�$�6�o���.V&.K���X|~��0�
�ɤ�q�O9~QS�����ǚ���n�82�4NYâ6��F�� |4�B���reF�؈����	�b-Q!�e���0UӏTA��]g8�8L�����:�#j�+�;�VTY�0Dš%S(�T.��G�J�r4�C��t[��3!oV���'z(��ܽ�K�k�PM���c���Շ�5��w���..�J�!	i�G�\�v�72'	I{�8.�dc?(c�u��t��"�S�%AǢ�_�R��+&>�HƌS$�	��rǒwH���i������4��d��3_[`��Ǡ�����h5�+䵶�D�M#Ʈ��\�PEqt�*@:i�F�0\�d��Zf*g��KC�sA�)�-���9yA��9=���Ow�b�C�ȋ�~-���2{I�=�bA� �
��\�r	���a�丽���3�����Vٙ,T|*��a�Y#�n}��N1�'pT��������#��u����s�m�I�j�HS�Ǌ�V�<�y��,���͞.�L���.n�X��Pt���Ⱦ�B�X���s,u�hF�ss�i�4mh�j�]�l�R�wV�3�;�x�����w�N�L�BOV�1J�i�Oz("�-[s�b�/X;5eΎc�>�SF�R'�m��jI��y��|sq��o;�}^$��*��`7����9�Y�/炦d�~x?7%
ƭ��I�z��<��=?lD�@�I��"M����-N�g#���!4�� { ��
c�qWb?�P=��ژ{�JѦ�M�#��]`7BӚ5{HBM�ϺU�g�����3|;ƅn|����k8t�g���=R:go���]�tOȉݶ�!��0,B��/patѯR9��ޏR�~c`�cD�_�����˝.�qNݟO�Bn��g�;���c���Ť0��,s�����iq�> �
l+�sn�bu�A��M�p�eI�ryN�~Oۍ��瑲m*���g*�(���[�<�M��47W��i��\��~.�W���ݛ�U-���^�Ӯ��u'?����d+���߆�b�W��c��_��^9n��a-��\��|O��MR���q_g�9�[a�7��f�œ���P�v�`$��)������C�Tv#%�ek��[G��uh	0�N/;rD�F_�%�1-�
���֨��c~�,�}���.ܝSz��Q���R��cF
� 0:��{u~��GV$�5zE*��>���P	������S���|�������?A��T��1��1kA��ޡw�Ni����ӹ������]����G>u=��4�̟X�
�@�>;����V�9����(�
�<?����e�05���M?joC#��!x��;S:�3��y�>z	M��k+{:���M�A�~��,�U�=���4�~��ކg]Y�ن���}s�HG��C�~]�P��~S�� ��ϔ�c�� GK��m:��x���oyO�Q>Pʌ|O/7>�XlF�Sل�|��n�a�0ypH˩(�zP�W����\Q�� I�v�H�jR)���E������u�=u�pC��"��0����U&i�� sTZ���%�!�%��w�Xu��������D��%0�$��j�%�-�g)�f�    9�Y�U������~�P�񨷚�ڡ��)��H ��٦a�J7�U4��0dE���T�i*���]���|z**�1��P���]�C���G�`�`�WJŴp�V�)�0�؍v0��6Ay��OlPG�6��h�����x�]�0{���y�O���y��:�zˇ&C.:6H��5�Q�ik��7� JL�_8k:IۇV<\'Mm�x���������|��{;ke��}uϴ��b�a��5C���k�*6�H����,�I�%���E<��ЈwZ�����q�Z*����N =���RU?āja2�VKNB<:bD��m�W�Pʝ����}��Cga�.��N�&��$�c����q�P`�!W�<�C�Vx�ؘ���X�#��o�~��8���{p&��˙���������	E���`���X;�p�M&����rI-�//��W����W����\?�~{�t��o�����/�U��ǯ�5	({�5�L��RȽ��3Ѧ���N�%���������\�Pl��B
��hY���=�:1��C�ޛu=?����u:/g��˹	l!(��m��[Y2:�7כ�{Yڦ�i��ȃ�u�c�kU�T�J�H�b7���tw�"��`Q6V�n�a��EYqLq�f�3���Q��(�ai(�rF,���û6�E�\�)���J(��R�g<:�( �;J�G�I���Q����υC���iΆќv�Fu��O{�޹e�adÆ�V-�9tsCN�C��%����4H�Gz�>
�m�o�x���ʛrK�vy� ��!G����|J��EI�(xS�CB�t�JR�e4%Gm��r%�\��_g`m�ȳj�ʹ;܀i��g:oQU,�c��Ԍ��c�w3-{U��#O�mqD�u� ��)���(�=����nFK>�v�Y�@Ġ�(wF�S;G$:���-�`�,.w�g�~��)zg�x�_�F�V�W�!�ī�w�Uz�M���}ǘ/?� �=��[�Tϡ�x.`/ֿ�3)�0�vz��P�������u�y�K�Ԛ�6��I�0�z[J�e���k����+��
�Ox�EJ�ډ�vE�u�2��HO��� �c��f����RtЙ��e(�i��n��<%v��++�m��1.�-���[
��0�t����šD65�rCZ�*��[�Mi�#47����-ׯA{�y'M��8�Bx���N�%<�HP���U�����ڼ"r�=m�)���,_�"J���~�,M(U� �_�@w���R$����gY9��&p�t�o���Ǚ"�����	�=Z�IJ复I5"3+ӛ�JG�I�[
����g�s�7|}���{��n}KxZ���[���g���{	���#��~V�N�!t�9w$�l����T���هڣ�Y��}s����o�P�cҒh��E�՜"P��+G-�*�u.�ʯ쪄���jN'X!�X�r�J�D?�1��6�Z5�����b �������E��\����YPI-{]����!	)S��w-r��~a�=�]4T	y:��T���T�9��q �\�k����<�{�:�\z���AW�:�X��#T h�:d ���0�ܠ%3�̞��� 6!o�����"��f���_�����sC�����GAD����J���0���S>r��`�4�1�U��3Q��2�Q@U�e�'�L�]�}���cκ�󰺡E����
:6��u �Ъä�L�hm�r}Z��X-�4��+v]ǁ�TO�o;�\�QGF�뮊�zi��j��}8�Vp$�;���x	8�S�d�#��Nh�K�Q�1�z�
&Up9Te�4�龂�:w3ied�����L����c�{,&4��u�i�*�h��,. �>B�C��e��:2�P�hJ᥶w��7?�1�Gu�Q�X����(��֌�$�6"��n���=�����Yu��������~�6h��k8���;�kN��hO��1��V9��J;����:�A��]8+TB��(KeZlLm>�F�aL����mףUsPϗl$�N���u¾F��?[�v=�}�0���#�c5������Rt��u�������)Bz����Q]�&c�
��5�F;RX}���[�6���Sk
�A������T7=�[X4��"~(Ff]K��q�C�ڕƴ��MZ�6�y�>�&�$�eA'���G�u[��Sy
�*����7�}*"�I��P���v��q��0u�V�rC���J��+:��@�GB�`J����n{�-����F�N��Or���,~�~����S���A5�Z�,�p��TjXQQ�j����҃>�::��B-Z��GS3��.�L�p��T�0�F�Em�ci�bS��ƆFO7�0���!z�'���w�a���7��SR����<\���� F;b�9B�4��[�t�֒mD*CA�S���݌Dq��:��F൴�8Qؗ5�)�����E�Y��'/jm���z5��';:|}���T�����/1C�,�j���0�`La4������D���KڪZ���B�/�@���Ks�A���chO��g���驏�;�I�7�/$jM���3��i}��I�f<?+��x�6d���y�q{NK%i�A?4�P0��5f�u��y��w\�����7ӟ��pG��@�a Z��V|�D�� B[M��o#�Nҋ��ik(m'�TJ�-�Ek(@ i$kJ��*�Bem�e"��f�Rr�<�*tc��=�(�������*�O���r��'lF��s��?
1;��6�C�-�T���+4'����	(<�O��ezl-�����'P(1�%��Õ9lZs��FWLtN|8!P0Q��E�PОN=tV	��1��oЍ�Ğ6ˏ]��>p�ϴ��s晇�c��߯~�W������}}o��+j�G[�(�e�8��΂[��>�?KDot՘E^��(����\�>�=����t�)��N��T��fw�0�:DډhV/�qS�G�5��^�+��u�,�P��_,3�/<��p(�5A�f`?+�d+���?�*������e[��ԟ�����?q���������U{GOV���j�OV��V �e	��3"KMn�d��E��[1.�ˠ}(M��F;kx�:#Y��C���R�.��1}�g}9P����|�A&q�V@�#�P�/���.�5�XT0��	K���3��1���o���������)Z��Y� �0Ҵ�q���r)T	,jy��)��@���j��<�	J�i�<���t�q��4:�~���|�O�g׽�jW������l�(mJjf�#j��A7��`Nd�3�[�9�"���>K�0E@t��
��V$ÄE�}|�˭�h+�x~��9��n\��M��8o�s8�MG��陠��{�[�
���|s�����I�"���?���e�D�qQ����P�A��W��x��OVo�����z�ĵC�;�焈�d1���Q�W�*cC�#�8�%O;���J������/�	�Ӹ�ϱ�ؾ9�R!-w�5���9É�?�\a&O!�n‑^�p���|��t^�;�at6����{(=�;����빊�������[�	
���T�Y$*2���W�7"�Pn�����En�Wy�%�.����X=�"�%�@�9U�[�[��N[3
��:##3�k���)�O'ޓEY��P�pj�E8d�$�!��oI�1���7��UU���I}��]�2�\�FĨ㷾C��#P��ډGY�������ڧ�t�U	$ߜo��/D~��dq� ��󋑏�!�Ū�:h{(p��(�&Z4X�z��Z��yY����5��jK���g�����q�6On�f-=���
�Oo[:��G�\��F�hbVd_���s��:8�M1�.fZ�6zJ5i�K�%����_'A���	�@�['V�Zu�|G1������Wj�a ��;Ya��[��)�
�q\�>�m��& (B������Z���?��LFdЋ��z�_=uTX�Zf
�ݱ�MZ�H�T/���@
۷������    ڶ�N��6���i��o��K{�j/p��s8M���7���&��n�`��'�.�����{y4�2�o(��س3�>c}�V{�3$jZ�giP���[ZRQ۱�����8|)��W\�^��s ��$��ܼWe���tm�|�S����"��՗Q����o���2)vrW0�Che%��2���t8��OC����{�<�%����A���2� 3Q#�Jw����X�E鯑E$�����Wl�0Ķ���	S��[#v���eo�$%�q�^�B!�܏��Ǯ�<��%@|M��Ҟ�!���P]ݠп��ph���2�y�,����!gy8u[���"qļ�q��dds^h~�eSG��>�L�M� a���ft(��߶4�Q�f��t�K٧��N��d'��A���b��pZ�؁΄��uh3�b���
t���,�;y6>?���3.��)���+�m��7����rHo��Z������n�"Lt�Нr�KŮ'���\4˃9��������'H���!R�Tb�#�?@=���W������j�=���mX'-��^.")����J�4����"F�
�L��;�Hy�C��G%ү7�?�.�=~��ɖЪ��?��l��< ����Nݑ���m��@�DG��Ȕg���9
�����l�u�0^GO�Dݙ����e�#]��DC�>@f5$ 8u�H�D�~>B+d���(�����
�Z�!��/�5t�Pl��������KA���y�r���{�1.:��t=�J�
��Lh䇢�C�I�ߔj�<��2K	L=13���:��D53�GL�e5��P`�Hu �ܭ]'@��D��{�mҾ��_*�妚�=��6�:,�'��Md���&F���8�E�!�(���I�X�c�g�:�Z����F�?�i��v+�컛OX��k5cq}⧍U�h��e���x#����RLb�`�F�#�xȾ^n���P���Q!��t�`���ڣ�q��s��0@LW��tV�3�.��W@V��$	KWCv}9���/�t���#�8����'JqN�z�0�n)5�4�ߋ���Dy�q��HL�z�EUg�ky��@�9�������`2 �S���'�&�v���^��o��
�t��\
D�~�ʍ�x_\�Y�6��z��^����v��yD���*G�N���7�q��<��])H���|#�6w�h��>!��'����Z��ҽTF�5X�;L K:�DX�l�z=oc�K�􇵉>-��}Rkc"�KnVY�.y[�	�<���)��
��K-�<u;��������Tb��Dr̿e�N��IeD���:+������8k��0cC��1�$Ц#�*@ʋMgV��%Ҡ:%<��J��#��Irp}N4�R����*m=�$�,]��:������s�j)Z��]4� @nՓ�#�N�+�t�E���%U,����0�	�/���I�_o�6N�!�k�Wg�"��t�DS"`+��ۧ�xkcH5���Cs��Б����DW���Z�v�}3f��v�+��6�z86��Eb��	�<)	�{u�f\H(sÒWT�B�F�E�S��r�݌
J!+��M�yQ4Ԣ��zs��\}qu�����2��� K�g����W��)�ف���q!)de��D��������b��L������x��b[9 O��|s�z�t��[s	���HɎ�m�C�V�<���}+�0�	i��y��哾"�Qg,��?���k]#]x�:�r����"6-JƔ�奍��]CU�9|#��i*�؅j���Q��Y�JS�r�i]ee�8 y�f�o�U �?�Kv����W��4���<p&
X/_���x�ҙ���s5FhW�4����@�e�������R�9�d� �ƎJx3��'����:SȤ�����p����^�4��j+�y�E��K�"��㛠��'�$�`!������
?-,������`�:VrD#�2��[���ņ�j�@ t�a�,����������*6�Y)�|s��*hO~�q���O���[ũ��a�oA��7���@	&EΞY���2��6�iOY�!���w �7�r/j�Ä��l�A��C^���C*V&M��,�k����˙�'d�}��Fl/㕧�r�~{��|��&"UxG;����r��
z^����T��{E�C�LPFXJ���c����A�I~(��s'd��q��?lY���m�����{���Q�H��w�:�]�{�@G�NCjQE���\c��Q���}eaآ�h���|��N��z�>-��/G)}`���h�r!���P�P�S�$$��R_�R��w7��u�9�2a��)]������|����z��PD�*��;0W)dt$��g*��v�����;��v�hcKFb�bT��MQ A�N��.)Ǔ{��KuP8D�R[\�xU��?l�/��~�6��w7���I|���EP��2x�̐k�68������(��4�5�!2γH)G�h�;����"�lwE{W%��j߳��D�5H�iO�4�"H�9Vig�$]�\LZъ.Jy�m!?`Nv6����~-�j��J��g�<�J�ת�g;DXY7�g��ɲ^����[����f9����v((����ckX�V�#��OK�śA�Z
�(���u  j(�ڳ(-B�v������W��YX!�:\P@�.K�<{�m�Z)�6P�8�)��aާlu�A0^��]O�'��	 <tKF�j=�=p��;D�ˏ�^�^Ed�'� 6qQ6%\���ii2�H�CK�n^�@{*È��&���y��ᓌ'/�kr�!s�0չ˃�����p޴R���g��R�g.yȦ�1����������G��/t=�A�'����[����u�� ]|*�e=�%��hM0�/�ƌ>��^T�^o��ԩH��7���ɞ`-9�B�����=j�
<�bř�bsf3[�r�B��M����w<!���	��x�%5��Z�d3OG��P�`O��(�����!Y��M��	0��o\��0/ډv.��l��WW��
6�Uw�!��� a�iE�>E S�|���t�N��ƥ��fF�j��pV&O_w������-�J����6��m���/�8Uic� W����ˠcq�џq�{s�7ꚲtӇ.@J<�V�@�<�r,2�5&���E��_RR݋�e����-Dy#%Ƨ��tp��H��4/�$��2r�IG#ri����#t�B�C�l�����qq�9��3(J����K�uo�

>d��ހ��)&]��eL�WǇ�&�P0C�-�|����֦��R~��^�+Z}��q'������֕�w8�h8�9)��H�}ځ�%ѥ��w,�e�*�5B,� �0}F�8D�1�.j*���}�?M�.&���P�G�%�4P� Wv�{6vɡW���֧�e�������D<���h�������&��J��BC�W�����A=����2tbAP;�a����߅Ck�L�������� ���<�O�^��,��,�x
<F����1Ã�/0����`LXUC+�#���_�󯉝����%������3Z�l����6�<��P�5� |���I[ ����F&DWe�/�{�pf�*T���rj�����.��5�f�����9�ev����R`���L��_g&+�
��P�"�����l���I�@�B��3����A�H�zUY�u<� S��˷��\�9@�RUҋ,��I��VFi��rZv8�ΡᾦTh�dpC"_�<z��5�E�|�R�)�>��嘙Mg����M�����&.N5�;;U�s�Ú j��^���6���[�:rU2��Oj"$�z�E`$���#�yevJf�l?����t�ݽAyǱA��Jy�J'\�\�:�)Х��@��+�P��9)��^qO��8�.Yr��ʦ�]��TU��r��3ʝF�qQb_!qQ=ZR��n~L!�>J����fNo�p�2ٮYV��P`    c�Z�|ڮԍ�D�flY�<�A�.��e��N.=����`u�˩�fOq:�Q���ں�h�Y��t�l`�uwc�`�_ܪD �B�\f����isU�ߣ���_���q����=�6����ة����E���Q� �����ǋ��	^m��7"M�����PC��P o����|��8���%}N1�W�%D/:� 9���֦ᖏ��`ﳕ�N���Z�:�J�6�|��%	6�����4����[��� ���v���(�ߵ�d��fY�S+/y8�,�u�?��T�<h�MZ�,W���Y����v�9u�i��j���F� D�!����b7PhO�3�A��H9�>��DOd�P�Z��R�j�]�T�MxT�b9'�s�}2�.��nΌK~6���F�-��5�Cun��D�S�eT��K}��������y��
���l����qQ@����P~7�P�����|=D\ۇ�X]�)?�������f�J�j(]�`�0���6w�t����B�+F�[4q���1*�TOu:�e����������] ��~]�1�`�)D%4�#���x�v̼4�}�cD%Vx�Ci4rK巬c�S� @��� �XQnT��A����ӆ�iZ���t�D��)ۢJ�5�����Jڳd��ϗ��6*�:.�续�����wYu�:�#�`���b��q����Z7c�`�r���U�M�<�`��W��<�xWX�r��5W���%3��x�U�@|��[�����cf�!M����Ӳg=�M���G F����u��cm9�@�S7Ѐ��'��/^�&��h2���&P���{�9��͓�^S�#���7���~��DH��J��6�pU��ЀP΢G��Z�����!��|�C2��0q�`���B�yB��[y���r����b�9\l/(���olOӻ��y�rW�h�
am�C��	�'�
)J���������� �4�]�ᄳ$+axaE�H�v�O��������C{���YH�l���j�h�Y`HgB��-�p$�a�%e��P�f�����nv\~k��A�ʃJo��R�gtKC���~�a=dͬ�^g�7�������d�$�K4(�0 �Ӹ���ʰ,�Ҷ��8 ��"hm(K�G��ͤ�+�DT�H�Q{�})�� z���|�f�WL�.v^ �A�_'�p�[<������a��q�(���ꎄ��ͨA�Ř�=���Oc��꩔�� �G*kLV=� r��bP�&�m:�-���F��k����E��9Q��(裧�B�wѸ�G��Rfn�̿?�9����Y �9��6�0	ꎸ�((kf\�1�^QX�C8Q�J�D���^��ְ�4�(�@4#+����w���|v�0a\}��W=�S���	A�~�q�Jk�&KcL���:݈�&���y�.��=`c�{��hE���f&H�F�=�^}yNQ�x�4�r���Ѥ���^?}5��M��A�2q��5
R/Z�&�[K��1BK��]�)n-���Hd��=��X]��|��آwaXT�B�^u�cR:|s $	��@"�}k���|�uķ��ԑ.����G�pV�Fݛ�� x�q�ש5�0�Ӝ���z�A�ܔb �Rh��9�<�6��,v���©y����r�A�E�F��Tj��I����r.Cc�P�m������#k�9���,�C�����_���f���sJ���S:c~;"�ΒK�甅�1���'�)�\�Ўc�L&����8|����_Wz@A�m�(�Ё��d%?����b>�Y�҆8��l�N�p�t4 /�_tZE1�S�
�X��(��ŤT�DiI��J���k.�<�N$ǐȸ�օp�u�D�NM�pW�h�6�(�X� �6u'4�A�<Fx���:4��:���ePS/YX����t��s�se���	�Y8�)��	q�"�2SfC9��e�rat���=��.�����T�^'�
Y�>�y�w��5�ACo�m��o�=>���T:��K��Ś�)�y�it��L��^-�D7���Y ��W8�i�x��-��ҚR��8��]�+�aw�4����t�Pϵ�������n�tdP�ˌ�餙��G��8�ж��'k`�c��4ҏ�K6Hϛ���z�C�/d�eW�	:�mf�N�9��h����� �o0����[/�@�]��s	�5+��ĳU�����B��5⢃<c-ЉV~z~��|�§pE���ʕe���՛�ʃ;��4hW"/�xp��0(C��H ޤ�|T@�$	����AJ�����d�}�v�Q=�?��i�q�W��k~d�;�OF�1��n	�JӡJ6��
����y�v�&vI��QOD�4�(��!��z�g���@�*4�[���P�}~��͇݈��jI�ߪ��. ��=���=f��/ћ����!K���ȖJ&�]���|'��h� ��l��+���r���O�B[�g1e��#~�Cw���5�4��R�j$�}B��>�!�g�}�2'��x����NH��9Û
y�eUeZ�r�FAg�jC�P\��m��I���m������P/�t(rYTn��X27�{.q���8A��ѽn>\�����ǋ�?���1{��$���H!�{r���^;��ߜ�'V pt��#mL��h^PWs%1z�=wW��lﰽ�|� �$D�����` �N�esfA�狘�����s^k�V��N�����^'�jW�|Ç`n�����b	�Xe3E��DNc[�#!����ߐA�+7�c�e������7���i�S���^�"L��_��S^q|�A�qȖ�sr�Pt�>	�7.0N�]�z�|��U��;Ϋн-u��s~%J�b�o�=�hw�#�5��@�����[:��6�c�>/�N���p�Y�_3�̜�������.;L�M�k�.}	�u�2�����9:d��)Z��k7��Č��暖�{�a��+ؑ{$���@bG����]\�K\ ���%�f���J_eݭ��l�E`�iN<��0��1�)B���@����V��p�9/�9O��CU�������jC��'y�}�������ra#��?|X�h�^^�4��j
- �k0�V���c@3�Aj:�E%�*Q�ckQWFJC*�p�?U_��7���g���&u�Q?������S�1N~��ׄU�7M�{:�lv}��0����{�	-3���$�]�ӏ7;ؾa/�w�����X��
�Βkԓ#���#�)��=N��)�儮7גX.��Q�ߝMKt�)�\^8��{�����Ň+H�d�ڳ��5�����b��&D4,��Z;���i��:$>����x�{�؜�)����st��� ���cz�LgQ��8XMQ�>$č'����Pn��Ä.[YkƢ	Ja�x��PjТ�\���?r
[�}�D�I���;-]fr�u��I��(]b����|/��%]V����zg�ː��� �y���s-�H QM:ظ�F�XTډ�n�`�i�M�fC
��H��.l���Uy�I�s�����çfi��li>C��E���_v�ظ��T�S�z�"ɜ/5	�FM����ڐcr�E������[!��G��7���~i��?�$sc�"].�+���Ӝr���F�h�2A���`���]|�7(#M(�
a�ZO�:y�|����a�Q�@܌ɒ�����I�]k?�J��xwtf(7�
@����H.�teh�nW�
R�j�4ĉ��$��}�I	�p�v
M��Ut��xV��~��,o7[�I���������t�O�>���v�3���=��pT�h�	�j�b�+u��� ��p6����������:s���'��y���\ �Y�H3�\�n=2�bČ|���;�{ʸKL�t�}����oW��z��/eAl��6hH�:� \�刄h�t��;�7��W����3K7|�7�L3k5=�����P�(W����I�ClQ���#nH�>bI�LWs�q}\��V�&׾��    ��d����͇ۿ^f8���(0�Q�µz�ŭ�0�⼻W�opM	Q��F�����wU=�C�3��}��i牓NVG�S��	n��%j�����\o.%�-5"�Pjv�g c'.�w������#�O���Ж ��`X��i� l����G�
��w��R��wt,
�]�(��hlCW�g����^2@�l�VJ�4�D[K������鼇�Ƥ{)-3�U�<�nK{`�=���:J{�W5��؅%����[b#G�S	@NO�o���G��\+=ĖC;�����z���\��7��*�� a�������D��9���&�g�Q��佑h��bm�J�7�g7��	F6��y่P�a"�M?o�� ������Ƙ�q�3�A�� �=Sᡉ��<��!��A��/�dƼx����VI{[M�˧�3Q����������!<�0�(D��o������gJ��t�ҽ�=m�?��V�,Y@���
vP]�����H���q��k4�b��-=k��ρFI���9����i='7�yQ����?�ﮮƌ�'�nҔ#�
g	K�%ކ�(�Z7�}����`��E�yN�>��	�s� "���1b�<�K,B�5e}����?�u��\�`w�Wx����z��t�c��X*`lJ�)i����N"�`����}�&0ڐ������Ǝ�p,�Uq�*��'�\�R���pk��B���48V9���e}qq�\$
Xo~>l� QܝM~��>�#U��5.7�G�b�Џ����ߚ_;�,��:�^vU�Sp�P��{����]�H<�kϛ(�@��^P@�ލ ����a5M�$�����@�A_���ŵ\;��p�V��z��l$�t���,Y
a�+��a��FG���LZ��_a���w?����z����O���x>��M��;� 2w��r{�� D���uC�J
��FT��)��ła��=����Ktv9WJ��ͼ:��s��GL�A�*�W�?�:��x�C��r��KN�2:�������@{K��XAZQ'��]~D�~��!�&����]��4�GU��W������Tp����0�HL�����q����IFK��1{���Q�l|K��!�t�C�><���ן��C��T��ͯ2����^���$:6��S�o��ek3o�A��Z����~�S���O�'�z�Mm6��}ݘU�0?^��O3��oX��	E���+�oZO�Kw�-:�jmi��C�r�/�q����`?��s�+1J2�2V�KH��ڂ���(��Sr�󤁝�2rJ��ѥ
�W�אM#�ןo�z%�t:�N�ޕaOI���&������D���� yd{�mnwf�4:��{�a���+vaQ�UI�l6������c�@�� g����*�薵qD�2�O�q`�ْ���G yl��5�$�����ޕ�.R<�ʉOߣ��6�b?��Ј`��~n���x^�#�q���0����ޠ:K����{��r�9��^�������͘S�V���xq�D�>f֐�PN-���"FS8��gt����#��z���Y�ݦ�LǇK
�|�����1Ũi.P��8�z���&�@(S�3@�$NJL��ˬvt��`�6y._�"��ߤ"�۲�����,W�m%%k��6������T-������)�krI�j�\�\����V��b�YS�Jl1�g��O���'}�����p�sVČ���s6AJ5�e��sѯ�8��ܮ���*�xY����O�׼Ū,o�O��(�\� (�12�ZME_1GS��C7R�H�?�E�R{��Q:ZW��Ә��(��W��zS<(_&�m�כw7����^�S� EZ��D�A�)�B��My�Ga����Ulu 
�|\j����ʉ?a�i�E0&�T�Kf9�R�j�k-N0�]�<�':�[�D��+qy�⢷"Gp)� �'�S���rw."OW|��Qw.R|HIR��5逴0�V�/��o~�"��4����2B�����u'Vn��)��KWY�,������"�L�~N��yQ������ ��E@G��qIo�[�Bx��riI� g��.��&%bA���r���!����	��d�j��n�/ h�/7��d��K+c*ّ�Lq"zM�������'��V�EY�r�r����{�!�U�]��i���W�7�դ4$w��Q�|%	t�1�[�G�j�N�0a�P^�6)r�;*R~�?\�s���Rmm�I�b����ѝ�Л8�#.e��������nF:��2�Ł\�ְ�j�,��U��;��9�TO��{xU_b�%�Gc%�t"��;3B-q����H���
����!6�7b��@zU���k%����� ��Эnl�X��l��a�����<� E���B��i!�(=UD�dS)]@���XJP�����&.�J��d��(��.�����e��`g��o�Hy���O�o$��`���2�C+jY�+q�Q�q>�ҙ#g1�v��!�ň�N:�Xk]�� H��|#f����8���T�H���7����4��`�^R�ĸ���(F�z�t���9+���\4��7h����}���#=åJ�{|6fÕ�Ѥ�����U;"�~㥰ğ�6��£כ�号����[�ZWx�\��V�1������q��VOįF�C�T���`�[�'�$J���v��$e`��;�BW�PF�
t����}�a���d�B�>{�E�t����cO)���eS�a�)��a&�1(U{3fh67:%ot�ma&zi�Q�Ǵ����Y��_����B��!-WL��e@NB9W�vv.�A>/aw_}�|����#j�S(�sRM�p�����9:���7d�t%ln\#�
�Q4�f�t��� ��9!��i�\�
K��=�T��8�9_���ҏ3��Gا�3��I]?�;����bY�wd�A���PJ��!ST3Rʔk��i�?���QF܃�Z�OVl��e&�,~��N�v�i���+#�7yc��~��,�A�&r�� �VȈ�P�41ݚ 
��8��U\`�WxL�Ol�5���	O��u��֌�TV�\�s�����`�^l�9����nZ��]��A]�Nk� �I�wҶ0c�;�0��t/�T�r=,[��5���Nb#(��_o�r��ES�����G|	<��8!y
��r|��YS����`��3�B����o%����ڼ��7�Ύ�Ɲ�b��4�"N�A~X��u�K�:�D�X4/�d�n74�믷�d2�.�ZV�F�p(NO�q�Z����	ܬU3��XưϮ�|��Š��I��]i��,^Bw���'`[i�܉j��.j�g��{W����^U�����k�b�0Q�+���
<=�SZ[կW����"�W�V�OW6�mgז���o��a����[!fOV)8im�4��g�{�"�,��P�HDO����b�i�Ǵ��*}�������%�y��hA���Rnt���Pl�*�b��������?JX��gA��n��/g�*����w�p��KmKi�.,�pй@['�8��%^�G��W5�ٯw��R^H�����J���EA7c�F�m:���A	�8A/ӷ���}`�����v��BD�c��'D�k��cm����Z�EC[:��6E����r"�7C����Z��3y`�5FC�;�vW�Al-��'�C�xH���y	~ys���7��M��*9��qp�6n������14��u��W�}���K�Z�������j �t�\+wN�0'�F�ڔƋ͟�"^���$}�Ԧ:rz��.��Y׏����ZHΟ.��?�V`����˱.����2En���ܝ:���E�~@����>9���V��'Lr@���2�Z�@���������d7
�DM�fs2[����8�~������X�}����b��*�:��2�ϊA|Oc�S��\�kh��tV�O9yD`�	�V��P���# t���m�kV�)g蘄��đh    �o�ұ��:���۫(��r]�6.֧Qϋ�hwd��$͢�iЁ{hh?��H����"���Z�^�Җ�䈮�Ie��UW����{S8�Eڳ����t\����Efj,=�S�7��O�Εo�~�M�Ƚ]	<�hO�<�N�+��r�y�!gQm��>g���Ŧ��x:��Y��K2W+����
v�1��^4�o���I`�>}����xt��Q�}��=�E�ٕ�a^�͆��W��#������^�i�G�^���V�Ϟo.�u�.�}z}~�����O,X�>+���sZ�����\X�o ��~�r�(�5�Q@�b���B��0�?���Go6�z���T�s~0��k�C����)g�l��(\�k�:���H�GaJ-���^&����沑�vo�&���]D���1�
"-������{��;�lJ/������_����(���2�\�|�Ɣ�'�'�����Ό��U:s)3%fɻQӈ�ڄ�<s1�w`ρ���u�����bSeIKmN(+ͥ�G�g}QW�T����R��+̫�"� ��A/����z
ڝ�kqV��ӗ���틱,2\1c�p?/��9��lv��Y���y�����nP�PY�Ęc�_�(�,����R}˦>�D�� @�ի�������-ߊ�DgS��p7��B�'���Zn����ʊM�[�3��b
7��^�y�ވ�Ĵ���c��on��'Y�o�p�Ck�hFQ�3�����_ۗ,����ŧ���&Qgz�!3k��Ԣ����I"%t�DHʖv~ ?Dz㨎�U�7��^�����^���vD�I8��3��7\�����3�{��k.�UA��U�}e-���JԮ���#�%AG�
��/$@�*eQtnd]#&�sG��i��}H�t6���i�E<D��7��k��#�P��N:V�rd��x�e,�WB�h��f�C�b��">��t���4�vtȭ���2�/{�qhj�[��ڦ�L��z6�����w�B@�8�?A=R��8�bbΣ?Jgϕk,�����{�½5}�G��	m#!�#`S�)6�a^?Ћ<�6�1����?MO�tO���z�w4
zP�zMaj��9�Q�2x|���Q�<��Qإ��!��"-����(:\+<O�va���J�EႛA��J�S2�%�ۣ���I}{ܠ��Qq)�Xm����Gm�P u�IY���s%q�zl[��c�H��[�K�\��F1}���ޫ��r N4����@��/�t΀�� [8Z��h(1[Y��WA�8�2�&�O�_���SNHSbI�dRgR1�Β���ؙ*To��U1S�dm館N~'�7p�-��{OQU� ���ig	T����v��og��Q)�ϟ��vmE�4�7��%9_�ݮ�іvS�c�� ����L�W���JeY�} W?��g����KuV�Yz��(ekEc��H0��pEF+���Ic
�Gt���b
�O���P�G�0���5�f!�,nPD�r(<v�A�9��,Im���ҿ�ƸMC.�4be'�k�x���NA@8F�N�38�a�<L:z��Ę�ˤP��ӆ�i|Ɲ�x�ZB:90?�T�N%
�敲T\�~����@k9�'n(lƴ����<�(�!�����������.s�Riΰ� ��{�ǉ�F��8�<�a�XqK���ܜ )H��N�1+��<"�_9��!�;c��Y�|D=�LzTE	�Kֽ�UrTxz���H;��VL���j����O�a�b\:y��i��=�٧%#�Y8ܔ�eD!�3M�?B������:�V&��I�K�;5x�e������9W������c9Dmq��l'�B��>$��ۇ��l"%��}�n�w�Rk]�R�<�w-T��5R?��֙yA�el?�:��u��Z�0*���ǒ!RZ���K���0ڥ�!�.VR��c�*�r�Յ�{�7�=���_��*���<�|>��J6�]�s� ��kFT���o��-K��	o����*e@��ͱ���8��l��|��A�
�=��BGS9�P��t��2"��23��� ���l�j7ն�U/�4��D���J�!���V��v�PZ���9}���,z7K�2	@��邥�6}��0N�TN/��������w�ZĔP�ǞAHY��)-��(�2�#e�~����?m.�=K��(��͊�N�n���g�"���+��z÷E)�8�>������R��/7�%��c��i��?��K������2JH�����fb�У�Q��!TtC[�)Gz4�\p�iU�����O�\	�ܬX����@FƋֈ�,:�!详��s����"�.j n�'=?,�Ya�I#�I�AJ�A3ŞAL12��2��Ҹ�L
�{�[�K�����t�n7�Yn98}K�j�awy�m�nr�T�ډ�j}�p��M��b��<ϰ��вRڳh�F<B�4�r�%�f>~�������;���u=���̕=Di#��Ĝ8����Q$�PQ�Sȃψ�经�d6۟V�l���])��Tμh��@��8[�T|i�L���T��}6qK.�x���W��o �3��s-C{��uo�ݰ�M�%���Vt͛�P{�BW0��cpԌ���/�إ���zS�t�����O�P�aT�����?$��Cf8����;k0�yf.����F����F�[����>�M7�f��޽�P�%���OBp����0�A\�0T��Ϣ/=�&LAg�4����r8�.�A�Nųo��{��n�����w\�j�8��{�/ֿ��\��Wu:xO�/�|K1ՙ(�JLȉP�Ƈ�#�%����ҵ��;T�D�u�\�)��M�=$8��	P��ϐ��5{tA�ZmS��t7C�npv7��)@N��J��k��m�舉<��3T�E]4Q:y4�h���9�z�T�GOw�QCo�y�oI+_��T�|A@\'S�~��U�������2Z#@`3�#<(�1-Jt���D���L�$a�@��'�G��uN�]�"R����a��~���P�y6X�v��;؁�`צ(�T�V@)���r8�<�m���Q�{֫��[Zd�B��;:��jU9�XZ��
c�!3(r8�x9Y�S��-��K�����<�O��������r�tF�rC�<T'��pO�a$��(!7�4D��E�:LZ�L'��o@0�.����H`�Y��S2��N���W	�WE�S�<�d��=:�:s��W�:�
���D��+G�H�,tt�B��@�15��ZvMg�q�!�9Z)Yw�,\��L�F��ni���l���L�	+��-
��0�ڠ�T�����T�&�9����>�i��Р��c�!��VםAQq���Ǘo�G���:�Q����Q�o��e L7��6����T.��_/�_wPk��;��<���.�0Oภ;��~ ��u338t�h޵��
�d*HKi�2�����6e؅������/�B��/�� {Z���~���5�\q��;�@.֋��	��Zׂ�&�@XC!��F�������`�W��ɕ��j�s�n���<�%�C����	C�q��~w$�~}��vd�l����e���\��X��ھ����y�����ݾ��G�2>���vj#e��^����#�c���(��\����wt���|������ArJ�6L��w�o�m�s�x9	h��L��^w�-d�,�;�޵>�ih���%]sKo��z5m#�C!Ȝ-� C`E���LR�E]�7�����:k�Y�V�4
ō��j��<�n9:�Ͱ��y�ś�
����
����ǻ�J�W��v��Iq��M�\����N�����BKs�����eM��/�Sr���q�Yu�`�_o���a���߻�@d������0�T�i�3�k����l�9@I�խ��hX��ƫN��^L�^y��O��%� �NΫ�[E�^F����D��f~���L,Y�e��7+6AKR�O��C�Mm�\��o��5�7g�0�8!�Oq�x��T �@j��    �*v�81��'��4*Rr����ܽZU*߄y9��rD��^n�0hU����D��;�A�z]v�������8�N�N%���'�\3R��$-�$!ñ<�Y�ҡX�Tԛ�c���S�|���[=<;�|�-�ysH�~q��qus�)�%����t�_�VF5�r�&}UR ���DY,+�*7�5�@҂�»�Y({Tyɕ�e���v\�[��\�.�։	"a��,7v����Þ�c)��)��@N�9��v�my����I޶AW6X��g�����Y�[r�]�o�^&�EQz�v��~� �B\��m@× e�iM���k��4"��f+��JW00S=�yhr���M���Vm�н�f?��=�,�G�dVpq;����˒��P�$ڠ'xD�΂��#d�?K��9��,#2������
�O��f��@`^�4�����F�4ʷ#� [���j�А���d\_ӣX�gv�O�G1͒���fo�=��8��9 :MKK@J,��dmK��|�<|��L�*G�	B�����i9����!Ŷ���}8��E�	hm�%�����g�(�� p����	����h�~���'J��]զ<@MI@�e��r�*�CG��h�P���s1s�BXLZ't+�UF��O�j9 _%	<Hhٔ�3hG3xD���<w�B�@���Q$EU�(���c�e���m�$;YԘxp�j� zj�A#g��5hCy�!N3@��2�6P�}�?�/*3��@�qE�\� tƚ�c���!8��%ӭ��V���SW>�'.[O��Y�o7�o��|�M���简��Y��񗤾u'?E��q�7�v$Kh�lH�!J􆺒d�h�y��l)0�i��U,]����/�)�j��j� ����`�Đ[���M�<��#�-*�4m�q���ѭ�~�na���h���9�1˪)�p$~�l�&��5⥟�w���K�F���F�#�OۡBj���.��������S?�Ǜ�-hw;^����A�@�ډ8�C�Kc-+��C䣚��gyS�0dp��z�� D��Ԋ����"����U�)�^����q%�����vtRR�N�h�K�z����g�GJ�b���@����� �����N'��{��}��w��gQ�)&�sU5a�70`���"��L��
��R�VQ���lw����c�JLM��FH��kJZv���wlU����1���'؁��|·\�{`�B��ޒ-�J����9p�N��A>?��3$�1���S٭o�T��;�r68�0�I3R�H6ZNV.��b�A٘q�Ʒ`�(w����M�vz�Qvy�<��	���igv��*ؑC�������b��1*�5�>�뾩�5��-�lc�Tw���E����߮����Н�{"����C~��B��CD6.OA׆���X%�;v�U:�R��<&ìv�LOW����)�B�KG�>QCo�#>P�+G��*�C��E_&���'I�cˈr�e� FDԌ�� ܃�G�5�,�q����%4&�7�`k%𯻋^���s�ʡW'�-bg�%&[�I3q(~wO�|���!gU��`����ݣ�*Y���DI�c�R�=�d�;З*��xp�~�C%ƍ2�L���Q�=L�M�1ɛNr�����e��y�:v��.����W�:&�n����00NB��R(F�_;��aҡ���0)�i� ��Si���=�,���i��P3���ڬ�C�I>�})���e��!'��ߖC�Ғ���.ww����yc#h��O�Ɉ(�A�x9���'��$)�*\N�=>}&{�[������_�3/3P|n4�F�<B�C�����[j��4DjT饄�(��"�@�QS,�ӽ�����'[Ɇ~tPP�F�D�VsVVt\9�u4u�����om����|��p�������&7%�fN��~�O����\^"3�]~:�r~�F��d����)9@D���}��w1&΃�\�֠�Ӿb��������D'�T��������ڮ	�@<٘�@@Y}2R���ˁ��c��}&$�~��ݣ�Ye�F���rBUB�5=L�[�����ZMa����m��:rO�a��$꼴������L���:2���*���S�� �;�7��:�
���1���(s�h��>�Ҙ�pVN0���k^��Pm=s��c�Ň��C������?2!l"CL�T��X�!�>H`�]sqR��n�d���dg�����*���7�u�HQ���/�zy���-�.g�g�^�M�
(�X�=�Q05��]���p+�V��u�"��O$��o���
1�~e!�T��b�l!fP�-*�u����n4�e�?��_������D�����t��ĩ��D2�6�
\pi8�j�q��;�$�q�'_?���༯.����l�F�k�������C��E�>��cϬ�q^
��%;�EnOψ��I�����m�o���
"�I�,BR8Oޭi#a~w�o>U����5�h�:��69�p�)q�u�ܨ_5����S��o
��
��|Hx>8M��zs�4~��q)�@�.Q�(ܽ�\�y��8��_?��"�f�1�I�;��naa
���P�P끔ܜ Yx����ە[���s����EB�4	���jׁO��m�>�m5|z�K�l�^}кwX�t�H�Ǩ�ЁVBe�O�"��v4�ѡ�H'��4� ���cx�t�V�y\�D�Peg����2�2kU��xNeboD�T����hj��(�z���2�5�#�,�}�������0����E�������Rp���[��|�]Qvr}�	<�]�2W�k���J�cv��)w�K��2��D�
h�>�r����iת��wFC�OQ�ڲ��&�_.��W77��۴�z-���	eZV�֋����le�+��'�;s
^��Cm�"(y��^�	Ǉq��O��ո��BwӹU>��9��xqE�P(:�lRs��&���OQ���(C6����Xb�iXPC{P��qo��v���p~�&�N�:0w��\R���Q�'�>l$$+�f���
��}oe���������%��<�3��/�E����%�4��en`�M1�N���RH]�!#S���}�y �YBy��'{'\��ILjs�o����9q���������B~��b��s="pA;����d .���K�Q��#bl45�sLd7�f�j���������̎�`��қ������˺yO�
)"F	ܗ8��[��0J_T"3�xu�Iq�}ɺ O��"�4���P������=׬� ��>�!֛Y�]�!(�Ǐf��9� h2h)��]�tL';�e�푓�Jn�I���8�'`�aw�vԹ�/��S���B�r�w�Ҁ����m���q`������ҫ�}2$ �9k��.]�0R�j��`�7��',��/R�X�:�g�������o�k�L��&3�����I�.�!�G� 9땯��e6��8l&����ki��e��4HR>�щ�L�hS@��R�Q#fT��{ѧ���{"�V����@��4��B`B[]�p���X��>�ގ�S௤������ ���fw�\��jaq��yp��J�H{f6#BBeD�mP�E���Ґu��O)#I53� }����q��;q|��82r>PTV��W5�iH卯[M��R�(/Zd<J�+����TQOS����8X��(|b��Z�ڜA���ȋ�hX�5�{���h6�X;dhh�GF#����g�|W�:�v!~w�/��I����x
�b��j�R��*�7#ʼ1�կ�GU�Me(wծW$-��a�ެ�wWM޲�d�«j���}�|ٱ���zm�Ѫ��i	v��f�D=�^AO�b;q_fᣧ��
���6�y���X�Z�FƤ��Tۧ�L�kkc�!+^���HB�aw�4�ئ�U�� Y�r𪔴�� �[��
��MH��r\��K�в#5�    @Gx���X:;fa� ,�cΊ4oV �s_�N_�x�j�D�EM�d����a�6�w���tE�ӭa�䁻���,]:xL*k>t�o��������0��-�rg�m�\����ˢ�P�<�a�m	FD��˿]qf����&�J����v���N�$�9;�P����,��<Z��Ͷ}< ��K"O��M���k�%�L�V�^i��.�	�>��%MA�mՙ�@1T٥��aE�Wŏ����I9i��o��z\�2�!�ƴ� "�o�D����\Ѯ���ҙ��$�6��`�D����P�V����31��;-J��+Fz��4��N<�@Q��C�B�J3k ����K��;0�Tt�J��|�#���$��|?uE���Ky�/ٽ�K9��5��8^�2�ͤ��M�k�G�i����hX�U}{��[on�FSs�Zm�i'a5�(z/Me��	�Z�,�*���!�����N���
vX|`$(��'��E�Ѥ���О.�"{��`'���Ux}S���xB*>�:Y�0��P�k\���P�iK�ћ���&�v7��6j��f�_�q����9�v��ߥ�Z����$��A�:(JB�J�ctu{ԛ(m�g��@ׯ��iߙ���;��n�'�b���N�O!����A����d��s(g�S[�.����Kz����x�;��BJe��YŠ��r���i	�V��:�Z<�.���V�pH�T|��>��"����J��5� n�iw��� E��M�[c�MOAק�kY�P]�M�x�|Z�q6���tTkYuh���
Bs܉����Ky�X�����/����L
|�u��~[� x����a���fih�����U�\�0����
��^\V��߽_5O����#D�Z	^�q��Ck�����Qђ¢�Մ�8O��������>��$������@
��C6�_|�㚟���+Z��d	-����p�2Y�|�51%Ʒyh�PJ��j�q<�O��<r�j��������9\6�IJ��L��D�<_9��H')��'���#�;̫RR؅zװ�8�C֞����U&\���nn֫;��*=�9�"~V58ۑ+P7�~��0ّ�=/~w��lQ6��4�:�)��V�Z���8��-6�TFJ�L����~&t'���S���4�N�ک3�C�R[7�	, ��q0�����z�)�4+M�J�-�ϙ������?�"��Jɳ 2�����7=|�B%3�Q@>]�U���.���"�W��F�Z���S4O ��R���_'�P��<{����t�ǫ���~����/��*C�ޯ-=]�Ӌ�p��/����Ja(�;cU%�rcS�o{�RT�������98H��ew����[��N?����w:e��%�~�p���e��;}k�Όm�����Dż&'k������n���^�_��^��UP�M�RK������t������:���-���[�ȸ�^���S�kS�u��Ǐ((h�e3�z��w����ao�,-x:u�~��ww���� _�����eHW?��<I�A�l�������h��Y/~����Q����e��!�^XI��k��l��7t[ҕo�F/��X� Ox�KG�+L�V^Lrs2G��XK�US9B�4�� ���(�
�ۈR?�d׾��~Z|4�X�pRRJ4�o4�5s��E�s��Ad,
HS��+O'Lt0�|�`a��>����7���
��$���iP�ޢ�G�s�Q�V�� ȥ�yu��o��o�?��C�O� ń٭��D �3A"&��ʈ��;��f��i�8(�|���
$A=z>Z��j��A���~vV�Qb<�a��:M��t�+_+=�A�,��l�����!�t�	�+�H��'�D�uJx��?�KѦ�ȡxF���҉���מ_�?�m�lZe�c���9�| �6�|�9hO1��ffKi����Paˑ��ƨʈ�gQ�tjSbR�L)T{�Ae1)�Iq`��{����$	�*��5����J>��w��������Dx}fǞX�R���A��/�����+�,.�N��|����7�غ�(�9���{�)Lu���!�ۅ4�].���+�Ȥ��)z&E@�TY����&����v�x=Z;_C���:��������T𡧢T��^��O\��mX�%����	����h;be��"h�����=	��0�b� yu ��t����F��͗_9�@4Ay����J���6�Y|����C��z�z�A����I=ދ�s%�7��LvU:>ر��b�`:Շͽt<��r;���	G�͖����uZ'qVm���\��M��%�֐zS~z�0NSK
ƗR�d�r�2�s��O�)�h�����w$�oW8�UN�+N�}���1��`*�G��n�]��c�"����4Ocӫ��g��B�K�Nǵ���s	�{�HT���C�q�upWIO]�i�6
~m��2�����o�#Wp�
�� �4$�.|
�M������DE%m�t]o����@��w�/VW_~��I'˼��\]�G��%����P˞O �HM�xb�A_8.�J�ˁ��|9�C'�bc]�i�8��H�5�1��P�l�]�Y[Y���f[W߷����/#MQ��P�
9t��´�Q�ҙ�\�I"���#��B�h@'H�3�D/#U����'�ΉQ��T��s��l,�RM�z�	�?1qf]:�|�-2�ʈ	dK��9�޻H}zssw���+jկRh��N���r_��g(���U�`ѻn�ߑ�.��cϣ�k�3�5���͎7W��ۄG)9|ϰ��h7U�L�j\��񉢃���	(�ļN�v����盟�\�̣MWt������X�R�=L�^��)W	�3��נ�����}R(�n;�\�nU��24E���P�q@Z�)�6�0�e��3�6��pz���.���M{�Q�g�6�B/N�l���G��yѯ/؝����d��!���i�Z�붣������}���;s��S+B86�}h����-�jhh����*���Uë|<O���;>���h>w�M���,<,���+s�CW4�`k���a�3�E�3��į(.c5^+[jO��n7w~
8
1��8�a׽���$��� �R�y_��Ev��Ȉ[+%o�Q��ԢS��0�}���\���t�s����)'hBؑ�P.�����lV-�S3'���Lワ�IԐ��l
���5�㻆f⁲0M���&S�%'a�]��b�\�Òe3�4}q6R���Y?(�/���[�7����w<}��s�P�)Ʀ�^���"� \!?�rA�WɈ�-i+r�2eh�,�����@Ȍ^!]���@�D���Iy��o�9��	κR�O������EY Xt��lf��U��{t��u�
{�7� ֨�/�Q
�Nͩ;N�\��EG�`��m~
��ԣ�X�����5��{�8(��+˳D�����t��6<�f%�l|b��R�Ĕ�����-�m?��I��)r���?��y���x)�a���PM�q &mW7������c8Oj;5l������)�b�
�P�&�4zq&�k��Y׫ قqYΪ�B(�L7ϓ-_T�A�Y���VOL����OO��҈.� Vt�y����ݦ,�"�����S�V���u�ȁ��W��b��� ��LDy�,��O`:�l�uC����Ȓ�U�3ɴ}N�����ם�Pj���Ah�'� =�G��b���*��J��Nm9���K�;�^�����}~1		���~l*CM�D١�k��b9��	Z\�6
��=,&8:�5t)�=����Ǝ��z��E�K*��?��yQ]|���;��כۤ�B��0���K^T/ww���g[F�a?��e��:���1F��X�J	b���R�h߮n��;(����k�fa���� d�϶�,%v�2pfX��j���4:}��?��AW�H^}��e�I9zC�4}��ǡVGԉ��=�b0��#�M����1ڊj'��B|��    �i�S�K`�4����X5}��S#�Ʊ��L���$��� ��K�PS@�خl��2����F�Ġ������w��3��G�i�<�p�U�'�l6���H����u���.�B��c����_b��a�D��5�����~�"J�Z�N�a	��A�7��P�-���0�G_�Ê��6E� ��+�[�Q;P$�K:����.�sp΄^N�I�������js���N�q�jC!�yqL��L�ܗ]iR�Qh"�P�C#�����9�R�ʅj��h1�m͐6�QŕV�Hv)������e �A�E��J��?�*c�,dH�엄�j‡�/�s�] p�
���]��H��^3i�v�ʢ5ql���<�g��#��
`�����ʀD�V�ڛOV�R���y�Y!){w��m����5rs�u�� K�Y�����������;�&�0�b����QL��`Թ��2Nz�PC۩TN8ާ)d�l-�~��ʏ<��r��4�}�A�L��i*�<  F?2	[U��C'�
ڻ�C���|�|�����A���O���I�N���a�79TΫ�]�M����>��Z�6�(��T���j���вz����W�F�$4|��M��R&ٚpg��j|+:E�e�*��&j���$ c�a��xQ�A8��n�k�L�u�)c��QaZQ�^2�)�2]�Ri~�~N$����֪F�R�q�qym���n
;�|W\�sd�~����5�\���@q�m��~��� w��H����p��7��p���m������B�9.EҙC�R�|I�/�Q�b����=:��xo�TM9��7P;�m��^p:�6d�9�'�[Mj!WZ��\�d>_}��n�t7���⋤�.8����kڈ���s��.�b�7���y�8�aH�_W{)�<l\���@���_>첱��#��^L�n7p_�����	�6(�yq?�ʙ���W�z�����Ql��=߷���۽�nҕ�{v}UT�Lk��C�"���t��喛1-M��QM��P9�5�h�2��5
�h] �'=�	T����2�#I��*�PDbq*�+�cƥǜ޸�� }�[x�5U�ճ0dԳ��5à]7�P��D˟�Q����T�3nF����!���#�<�,�ڤ�\���.��`E��%a!T�'Ӗ��vЬJ=~�!U%����^dM���9��,�f�q�M��a5h�`���r"���zO-�T�=wW�Cw��6�;�o�]��fb�tJ�e4C���0�K� �LĻN�y��p��޶!���O��������˳����w�%�)�+l�C؃5)0���iY8�A���vRS��6�#5<��F�J����@XMG���P��\�Eߝа�06̺v������L8�5?WK�4�.8z����@C�Z��8
a�$�_���BbW���&?���B�B����&IY7�yQg�s��0@�R�jޯ�&@��v�*�������*��굙+:鰉G��&��d7D9����������9� ,�#�󁷝E�D��o!�:ok�.U[����h�fiFv4���=��&,
����T��@Y����rd��Ϛ��e��z�c�n���e�fbu��, �C��`(��9�P��	�fnߦ` �}w�)P�|�u
t�̀�%��+�Z�D�i��9�z�$���u� ����Fj�:���w��%��M$�˿g =6�%SW�ٳ�_�������ݗ�\�nN�_���8(��x��̕
��
��a9أ�m&�;T,�����#�}s��\�K`��L
�Ņs��to^�7B��4)�\R��2�G�^�C����j�4*�9:�}�y4�;�Ҏ�B�A� @z)TP�D��&�#Q�*��:�SJ/!�Sm����O�:�,��Z��0Hc_���q��ig�StZTh>-�������C"�Zy�h?š�����	���q|p}�z��ل���#��(��1��������w��1B)��k�{�0�b��$��t�X1���!r�Ω��(GM���h��\��Gk��.7*�~�a�G��)������'FO��
+�"��(�1^P�h㳈E×Q�v�2wڇ|7Q�AS�fy� X�/���.2�����1�UYtU�d�2m�e��aA<į��
g�ou1
�i��mTGn�7��L˓K��.0�T�XL~ՔZBu�IM���a*)���7�wh0X���(�8m>����D-�e�Η�A�-3��$A>\N�ӾE�U��cVIw,�tČ�R�YU�k�����R|�,T�[(%��u��R�S�L��*6>�-�瑤o��� �R���	j�sq򁠕Eim0ʊ�`1��2Q��[�G�:�~dE�e��z�3�N�n��[��;��7�MS+�J$c�(iJS�Tx����l�m�rU�:�?���O�o�z��H�}R�P�/7�k61���hCM��v)���d����78�u��:vҟ9/���|��`Y�|��D��Ň��np�2�8���'I�8-�����^�EE(�ŽO����#,��ϻ�9��� ̬�7t؟����OM�!a}�[o?�	m����Gj���L�� +�y�c�2�?�:.[Z����m�:-�<�o��V�wL�K3�q]/b���}�ӁY�-:���,��G�mXÿ0UB��G�����]��j�ڑK��N��znS�k���Pt��|�:"+&�ǒ�4U��d�]���?���R��m��4�Š�g�aP����\l�n:��_��J�9�N��٘-4Iv �Z�����D��G�S�Ca��IYK?nf����J�-R��q�\(����i'CZ%M��s�Y�cT�B�){R��R^�\���P�m���-���������8}z������/��[��C5U��CpU{���;=R�׺��O$��_�	�{Rr��Ȭ,�>��HC�[����^D&���k�3:�	+��Y\��E�2PH$M��0�'�Kp`�����A
���RJ�|�����*��Ƞi��y=/W���1�N�I� Z��5���C�@������j�>���LZaڛz�=_���s��"�db��t:���w8^! Î\j^�<�RU}D�h�_����s��K��@��7|'pA�5�Rxdʡk��*��+�3 ��Q8�X���@#�K�m�Bfܵ�(�x�VMgʇT�Nj�֨\���A�j���nϥ��l��/)�H����U��Y�r�m��ן��H�GJ�h��.,�n���ugH^�I��� d���@?]|��n����yq_���M.Bs�u�%t�=a툊�� �t�p��h�:�%��#]���M�V���u^gټN�p�OJ0�FP��l������p|�({�<8KQ�a1ob�|��%�z���7ʀ�4���Uz���."
�$�f�B�j��E��BU�����GǇ����N�8E[�^�<p�jZ��^�c��e����~��ɬ���ȇ(��lm����D(r�9I�� �+\db(�����p,�T�����t~C��P�C�lԙ��Ak=�!R2�;�p߬��$]�7W�|A� 	 E.%4Z��g�e�ur|҉�e��'e�	J�A�[���z�pF��jK˳᣺��y�x����~X���S��vk!�t��_;ځf�^���O~��-.��iq���Y�f�?M��i&)/�[�fM�Uw� ?���p�I�}p��5�w`��LA,}{�F��y���#�@�ܣ�@��8����.cۼ��5���a�W�|B�z*�d~s�$" r28�MD�D6����.��ӛ�����D�w��c�$:c&Q���XP��M���B�B�ç����S�tGYz��g
}-+tU�P�Z���b�n�9>�I��K�`lT����.=���u�^QZz�)�(�~-��|[���.3�� �Hf,@�B�#.�����q�51jK�T:�!qoT����)=�9R8�����z���#��ůX0,-�C:�L��gy��Y����ez(/9H   Y��I�����J�rvG��(E^c=m��Zc��g#R�r��_"0>k�p���v��	*n'��.uw�I�%[�D�y�k�vU���ɝn����6�i+?����z�9�9Ł
pjƂ�76pR:�j!e?l�\�}y��i)�@�D�,.��i�^�Fq!�e�a�ֵZ��{J��;�x0*��6tgR�Bq�f5e�%}o?J���vu����O�p?aPx� ����!jHA8=�]h�qm�IP%�ɦ\U�+_�f��9Y�~H-!�/F��jF�4'ܸ{f���lp��k�71SJ����W:ڂ�<'�Qt��ϴ*%�mK�4('T��W4��ǒ�;_���dX�ǧ�W�&a��EÁ�IaEϊ�=�׆��8ۺ(ߌ筴ƚ.���{�y˟���nӎ�z����F�n��y�2{���S�*�c������!�2��3	����>Y�.���K�6zP���u�Ϝ�Hp��2�.���!W<C�7e��J�K1�_���M�?S�����VzW�|��tq(��2�Bx y�X��9!<)��k�Dw��U����z�sV��6U�@L��is@U.B���i����&�Vp�`���@���v9z��H�%A�msu��ΣKU�0�w=�����/?-�RR�>&~����1�m�������|\(�a�^���L)��#)���qՉ��>�i��!�4�k>p��n�I�k>IM���g�'/W�kh�?+�~i���혥-
Kگz�e�?���Ik�=~U�������:n��      �      x�ԽKsɱ.�.���[�Bg�#Z�k HPl�u ��s욍%�$�R�����6���,�j����jq�e�+�;-�ظ�;�2����M@UDd����Έ�<[4W�i�X�MU�,?�?N���	)%�H.��,''��������}��W���8���m޴��E3���Wբ�tT����-�-巴$|�X�o
��Si8�}\r9DO�o��o�岭&��σ�0��kx�E��f~]/n�Ū���u]<�21t���/���U���O���bU͊붸hg��%~y��*ŷ��A�	������ɪ�o'��8T?����!LM�5�M[<����zV�k�e�y3k��fQ�{���UqZ��E3���Us_	a&�|[j�t>G5-9gvI��2S�,��B	S���}Uͯ��j�ޘ$��P�x[��/���!<��`̽�#69�^4ռ-����>���y�Η�����(���䲞����usW-�Z/�'l�U{KZTWmA˒³*��%���2?&g�$�Xj6!3�E�	����=Pݵ��j~S]v���l�|��N�˶x���W��K�����y�l�k�X5��Ь`���e�~��&�]���+��ľ������Ha�!S���ם�uǑ���-~e��?���P�Sx�''?/p��������%,k���.D����޶����p������vRXi�9n���F��C{K�r���<Rx.z׷��ط���J8QO���M��4S;������s8�a�[��Z��w�9.z���y��y�[��is��ݠ����'��v��QX*a�Ӽ�'q�Ƚw~��v�I�߄I��Is��O�e��cR�19��n�%�����U���F��n��Eu�^U��ȚO<9?��6I�ɔ%u�S��X��.|��}���C�|?*[�2��;�����.�7������cT�Ww��-�6`b�U���]��ti7��jv]������W-���6��8jJ�6�g���{0v�]������cԘ���d�C�A��V�o#�M����4�a5o��)�Wh�:�B�r�ᶙU���#,!XN��`P�0���5Rh��E���Xct�ڸձ`��,�.�2�L�N����������~0z��ٺJ�?���=4��"�7;(x������D�L#	g׍�U�^<��V|ZT��������	%p�h�`���-ω	�<�n^��~Yl,7�~6x�񐹻:2��`���r;�B�0�l����Nq�,�By�.n�uL�{��f?	k�� �'x��L �8P�%S.�;�u�X�۳�������8���2|��̀H3=[��0��K}�����n�֚H8�ݳ�z}�.�?V3��p�pw�����)�{��JR<S	k/��i��ͪ�t7+\kW��e�1U��O� .ג�i��"<^A��q{�`}Ҥ_�k�&N���E�Mz6�������s�٪TFҝt�	��,,�;��:��?p���Z�X���5�}`-ຄ�A�������.����H���N���#8i>��^���� �L��6�"����r����НX��{v���4�W��4�+!�4eٙ��a���.��`��i�o�$��$�?lb|���y��\G�P�P)���7	n�D����_�����L~K�Q�伾0��.�Հ=�ܘ��&L�ܽ1�NR�#8a�\����5p���f^�f��cM��a7�)Q���&�w�dq�oِp�h?̇�v��j����{����0�Q��?kp�����g�q9��`W���Ut�U�»
 J�MᲾY���[�w�r[	gx��XDv����)��p025T�v�_�/�������{q�8���v#���28<w%�]���h��~yN����?��gm＾�>��u���fy�sm�6	v����(�Q�H�"ئ����HٱM4�&�K:e�ڛ��0���.�������j�6�'�b~��Sq$���E����U�uạa�T�����`x��py��]��k�Hz�A�S�p�hX�vqm�W��]�K�c-�V~[�[��wք������	�=�z���3'}�lq�^0ʜ����$�����eWm5���u{��o*V�e��FD4�>8Yx߾��~� @�҉�F�����F�c�n�f���Mk?��z�� ����&�;R~���׈[lgn%X�����pz�H0�4�ls���A")�Hu������r��Y��8�k�W���] >����;a�zs{��
?³z�,�9<�f��%s��>wnsh'�`Hrkhe�����:�>Sa���#�$%�i�e�[�xmmq6�\S�I܎%�����z�X֋S���Ѣ��f�� �ǆ*�ׄ���C51�懄�8	�, ?t����y�Pa��X��?�4k\�q�v�n��/�U]��K��58�va���x��"g��'�#�2D����$8a�0�~x�'8L°,�ot8V�MMi�#��+�( 3����s������������aXx�wu_<�ר7R"^�fZ�Ƴw$5N`�����q�#/��l9�n�:�)E�/h8��h�bo�ٝC0�O��Υ� ���Ri���|Q}|�|~)r�nF'	cS*��> ���6�  �=�j���q%� �2 `���dNf7�Fx�t��g;��M��q�V��]ٽ�j潁�nf�a�1#R(��2�lL)��Jh`P64Ե#CP��e��o;��r' �Jn{)*���8р��۫[ġ��Y�S����B�3p��0k��zى/b,H9<s~l���lJ�xd�ƌ��E�������û�7��y���]����8?}qR<>y��SL�R15�K��7 ^�q�!���x�����g�ŷ�ۓ��/^���3��h1�ô@�Ĉ��mB�ܡ�����f��ti�s0��N�6�m/T|�ws��������j��� ��
�J�EIN�e�DL���D�� �Ô#�?� 
�����0�q�`�x���ƾK��� �
q�0��>k�Uq�Z�XWŻ:��c�XX����5��1�X �K�W=o���z;�Ǒz�#�&��� \�TM5���#���
��۾13�;�x6:F"G�HJ�(\MS�l����0�T���,��0E����L�F�X.�2�J���@.W��`tJti#�,�U�;mkL�]4w���x�^VYSt����Vn���lV/,�@�#<h��18�\�q���r����o�2R�<ˇ�CX����j�}O��'C�l����l����.|�a�Ok�J�;��Ԡ���g��N��Y���N�)�bAgq6{���v��{����љ}�8���Ԅ��g�A��n$����d�T�D��a����X׫[D��aX=!��m�y�?\��cF�SZTm��h<!4z�!���� �ۇ��K�`#!sh�`?�x6�{��R��Nq��=��-z�	z�,��ɕςý�Bt�?��>_/��s��'�B�a#[M2c_6Tf��L\@����}��.1#��>��s�$96�O�rO�y��uS����&S0|����s��檺+�q�xY�`��:�0��]1o���E���7��x����~��+x7�˺x���n��m����_�Yr�����9�LrQ��\��/B� lX$|2pU�1V��3��1�hǬ�a��İ���}�����H�G���#LT����W|�k�'�T@��@�5��������O���,%<~~Dq���^�H��\�����Fv{����c
�]�)� =���!�������I�n��y;G���7���K�Z���5���v���q�.�
!��i:�< KS'�uY��=F����&�,������eg���ԟ��e;rs֣�M(���d����Pޠ&_�q�)O+�ܺ�iLʃ�. � ^>���dv�O�xZ\��=��Ϯ�������    �{S��N��Sg�a>L�Q�	F����<���c�a],
��X6�#0_���#�fW����n����`����O "��㿒t
W���N��0ulJz�0?a���^ꀐk�4����09�!L�2��ㅳ4�YZ�" ����E�|�66-��?���'nV���S�DJv魇WRq��Ԙ����s��m���g/���y���ˇ���%`Q��p��_?��7�mx�Y��^�<`v10���TctB�l�R�	���Y��FxńkΎ)2ӝ�0ѿ������qQ�}Y���U�X�¾Gb��uTp��$<��g|ʸg0��5 ߟ�(N^��Nγ�5p��^.�o1I����0����;����'���
~���������U�|��ݳ�$-7�j0!c�.�3d8��Vc0Z�5^�B��g
G�)��ܰH�(l8�T�}�` 1��ɟ�����]��ʍ����5��K��5z��
�m	����t�X)�x�7����ɏ����L$Ƒ�xܣ�E5�p�-w��r#πRR��?��4Ɣj@����&�S�~q�DK%��J�^7,�����7D� ��FnUb&� �׉��I�����`���	�^�s�?v2��jp��y�Ψ�|'&�N~�6�g��k��Z�*O�?.Ύ���ܐ�MK�L-��	=�gˆ�}+k�ɫ���-2N����+;^�*�a�>���X��G�	}�,}�^��V�OȐ��ژ)1F�A���X�"��~f>�< DJ�1�2�%��1��E6���O���;�Ę�eB6s�L�
wGo��H1c��WpG�NdXf�v��p���X:��!F)��讅����	>L=|�����L��6f%J֡'F��l��2.u�/�Pl�9	̤nD����K\�wսM0?�}�`b)�[K7=�e��+.�N�Nv�f|s�(%6&�Ϙ7�?�5��L�|U<G��rep����Pͯ~Z "�ߩ���aGD���b}S9	?�i����w
Og���[�t��c��1LKg*ߵ�׳z�M��(
/����ܑm�V�K��J܄�!�Z9g�ٝ��ۘ�%+׸p��@J=�9��t%C/�+0	�]�ôm���t� ��d�&�w��	��P	(3-�sl���!0so|	�b;���+8#�v!�2��R��Q�Og5���}�̯ۥ=k��
��V�ȧ�~��:�0�����|�&V���!������f
��-V�s���0
��~�)>�>��A[��������r��, � _J�����H�c��j,�!T$�pI�G���u�����������-Γ.�w�&�y�	٨(9m�,E�-яu�������}�s��{�������a��c�����@,�0$���)W>������`��|���҆smI�H�XV��lv�[G�m��'��~�o8�=g��L
��M_)�6�PW�F�������~�f1��?����/�ꎧ��N�TQ���~�ơ�TV���O��4�U �
I��uV��6�V��c��:����K�M�4O�̮ 5H˸��-�=�\�2�|�N�%����Xj.bk!�b��-?'.��;r��V�fծ����t_�)`T�S�a���)�^��fY�2���%�Lġ_���٠K���`����/˘?�����JO�c�3�q����̒k�
�K�'�"I ��� ��c��c���E[(�P1f�����0��v Ù���̑�pV �3dӍ82��ansx��s�`ث�DG��*�,l�&_���nv�S|��Kw�F���}�G�����#��H�F0u$�E2��"=QXU�Ek��]�',��M�2��@�#�h
������'j����Aԋ�>`4W��Z���Q�Ϯ���P	�K��~���R�� Tw�X���i6��\�7�f,�Mk����b;����H��#l\��Q�p�L���qѷs�M�=��(`V���c쎥M;|�\�t�xq_�-aב������6�4�ٟJ�'�"���� �������O�\��s�w���pq�v:oV��V�\��̞J�W���B��_���:�t�~h�0����+?�P<�9��h��G�ͮ��Or��4��*=ʀ=$e�	Z���ל.��W�r��}��/M�y�����7�]��ƃbٸ�v����� J�ߋq�ĶjJ��!�b�g�|��f��!vo�.�����hC"����*!��^l�����Fif_�ױ�m.(`q��5�
}%	������+���9�J���ďDZS�2�Vc*\|��|!c\�%���ǭe𑹮s@Y鰮p�����a"�顫�]�)���c��m�7�U�w��|T�|���Sͧ�R�S��{3ڂ6S�M��	�v���,�Q �i8�,����=�Y#%�0��cF���<P�k,{�_��-�#�x즞���J�k�>n&�[��n��) ��l�H�)����*2U�+��ܘ�sΏ%U���݇�m���b�����o�P��U �������1X�����RQ��_����}<JDPx�Ű�Q���E%;����9�N��YP?�>���h�^W˫�^U�;,�w;vp�ЖLO�V���Pש("`h�I[�J�j(\G��֝�S$/�#$��#߳�rN�J�����q?�?!nύU�bx�˷�E��|WH��Ы��k�N�#$R.!�
#�2?+R�=�=b{!�Ô�%��&�!V��^#��4�ru#��4]��{�/���:p��x�� e�]>��R~1����2:���p�Q⦇06]���l���|������/���䗏��xж���brj�������㳿��i~��>�6n/7� �=L�G�ܧ��يoITP˪���
$��ȉ�����W���*�ϻ��yomE��vD	�[���b'�s��o���{���������q��$/�7��Q�t^��@?2��c� �ǀ�	���L�X(;t�Siu���׾�-��YQ!�o>U(�S�����-���	��z��	$������ٜ�+������3�F�ugΫ�����ϭ���ำ)��2�#!�nb9�����M��R/P茨qrw�+��ש�t�o�n��{[�L�$\N�n�-��qK�)\����Pve)�g��s����	�av��� �+�"���O��H�� �q�8S�i"���^/إ�>�q��cr^�Dw�G�W�rvhY������ �@����忝��K��c Z�I[�w9R��b��D�O��_ʸ���j�L�Eu�����@�L��ť�Q���0t��u)�?�C�|ֵM%[�+ڤ����Ʀ�tj���dR}�,�[?�R��*$�[��}=_�A+�z�r	-㊪�%��a��Z�F��)���w|p�"T��o��6wx����R`<yag�Q�å��,RE�rh�"%���q�<��|�nZ�l��V�����.ן�B'ѳ�i�����v�d��A#�o��j�A��V���;�H9a�L�RSzW�m���vE��5�����[��r
�=�����r,F$�,o���-�)�V%��Z�1��+.�:h��+}�:|Y���o:G5RKOy��?0��!�9T��jQrbS�j��r�ġZ�1����E}������,G
{��"<����
RQ_����Ã�㪁�A�4F�L��MH�THN�EG�t�ٶ %��L���� �'?�'p��X/V�L5�<��[��(�V]�/�*���"���8�L�v�]��Xqr�%�#ǩ/�%��v@���A����6�Qe�-|$����0��>a�v�4�>VjW�ח?$1��U�wJ�i��K#��G�S:��r��6_z�\�j�9Ň��z�0E�WXi��tg����&��l�I{y�5���Dy����PN���S��O�y��9��9F[k5�ghX(�<Z��DD�..����-�7���RM&��_8�(�]�I7�P�R�
�0c�f,m~������Y?D!�    )�	J���~��h#e6/�������y�����w|� `�I���q��ɏ�bՉE
a�J�b��UA
�8��7���X9����)����	��@VKJ�Ts��[�׋?�Y���9�;�_ In��29�岹��rQ��_Hk�h'�L�<NB.���c��j�h6%�ϻf %���d�;�eK[�JD��$� ��J=���l�	@iidn�O�Xώ����3g�ܫ�G~��-1R�<�F�B"Py���R��x�\Tۆ��2�a�������<�<߭�2ˡ���+��E�ߵw?;Cj_I��9L��zӋԓ�q��ؔ_e�>	h����kۺ�����rD�L���-��z}��:^c���m}߬0�ڇԱ\F���=
uPک�ޖ�+#��V.�GHDr��Puj����ʷ�j(�j\��0F/� ���v#�'�_]�qҌ>�ޕa��卟��-�f����W�Es��?�1E���
�\�v&[����f�ћ-�"7���.���\�ҜB��[�mRW������@�t��H#�J������ZU���/��%{�1 ��Ύ��om��4O�6�LE�IՔ+�O"��`������
|�	�m=K+�M%%;��������3�]�B��T._A�"�iS�ȅb��N[��T=�T;��D9ߤ�������׸��:b تX��$����J����e�W͝m@�l0ӻp�#\o���Cx�dB�rxl��b�"�be�n6i-� �k���f)��LR��7���@����e79��'f��,��i�]�4\� �h�Id}�8
R�Q+�'z,��[��MQ�zLנ⻑����	c?B֊Ky�dۖ����S9�N�K�:�Y��o6�}T�OE���l�"4��9�GB�GBѥ~���A�>���{I�{�~@ĭ�k����5�S1��쮫iv��v�~��/B��=�"yaw�蔶��L5��2�|�)CU�7NJ�r6b���L�R9�:�U �o�Xc��w;�9n��V4�>�@�x@7�Q��V?.��3ӑ7(�Ā�b���	�Ҿ������r�D&)o���]��&�]aDD'�i���/�Y����-s �c�����y�HA4e`G����b�d�;�=�[J1�+����aCk�k�b�SL<j��\�A�>og߭[1A�|�Rb(~(
�k��WY���Ұ���5nb0� ̖��%��}�I�#�Z�B���@�2oh"z�P�%
��`ʐ� |��`��y��h5ً��/0%�\�����=��WV��Q���HSbV�;�wf�Nɤ/i��^$��A&�{��N~�k\�A�y��.���E^H�-��F�B�e���t�ؕ�������k	��d���h� `Ώ;�/�?��ֶ/�SǱI����8S�n�W��=0�c)p�`\�k����Z)��l�]qG-[��H_��;�GX|���ĕ�Sf�#(^�e̊����Pf�	gd�β����:(��ͫ
+�31��Xv�"�bZF�H�B�~��R�fFm�̈���x;Y:	�o'��Ɇ�۹'������k��frT��9�	��5�w��/4�: �l(*��BL	S������Ʋ���Ԇ,Vی?�����8�>�phU�C$��$/�s��S��m��K3)�ǹERB�~�oƼ�+�U\|�]�#lk�FI��ԍ	�
x[��5��Vߍ!$�\HC�vZ
�����Ną�m����⑂�}u>K|A�wWB��uz�Dn��!Sa|��^:��ľƛ�����3���?%b�"P����?a�6�{�S_ ��s�{Uj3秽��Y�H��b"yv�aJ���u/>>���4F�~?B�����U�[�.6�,��v�:Z�/���[���YIf�i�L�e���Hbޯ��-��f��[��g
�2��W;Ao5�-c�Z�ُ[l���:I��?��� �[�vzr����p��y�qG��ڵ�Jz �;�h��p!�C�NqH����&�eZ���"�}c��VU���`�~ܻ�G��1�I��l��|�D�p_�3���l�~��RG!�O2�1���jp3!���6�<kƴ]�2!FR3o��^x�.N���#�3����_)U��N�>Dg˽DGn�`����v��|�F�<HQ3�g��]2��@��b�\8iD;�B^��O�,�Ă�Y��8��0�qw�L�f&�`7-��	��
c~.�vcg)���J���f"�痕2�4u����	�8i4��F��;4(bJ��W�p��X��2��NQ?>d�϶3�&���=M�h��\�vx�!$�1Լq����ĸ��=�k�\/���ߟ�e;�0Nj6O-��ӂN��Їk���Xp>-}�7XwC���9u7K'2��(>o%ix�\�,�D���s��8��y�h��K�?D�A�Л�+�	;�4{R5T)�n���$p4�T'�^����m����N�T�޳������O�����~�Z��^�����jJ��?xi�+�z��z0���c��aM^ɼ]�q޵Kli��Ea>�:\�ܫ���ݳ�@����P�fx7�����芄%1�jK��jP4a�1�xvW\U�B��|���-���+~sZ��x�����mZo��o��bu |�u�  \b�o]-8���ͫjqզ|J�i���9-7_y��R�����,��=��0��by�j8=j/����+i�q|I�v�$�1!(.�N��@�6��ZaO��&Fט�p9���8K���ZP�HT����d�8��*dR6ܬW-�b�F���/~��x6��(�mV��ֶ����%�3�Xp��z�=yQ��9=}S<}��Ż7��gf
Ƅ`�2*��/V�?�7��n�w�R��i�Y��D49��������a���j��T��s}�l�8
��Hg	���l)��Rk&�T�(�%�+ğU�ُ�Ҽ��lm��E�!�n�\��Xڏ~\�P��������u>v˩�������+v�>̆��G&f�l�ۀ��#�����9��Y�V�w��Z0��G��R�.�}�7�d�+ڠ\��2_qPvQxZ���f��0e7�nX~;����z�;�7?��w�o���
��9�K��dZ*��f��v�� a�Kx���]J׃��@دԳ�z+Zb�7tk�vuDZ����G��v���M�1n<�d"M�r�_�HeiV����<�D0���+;�H鹥R�:T���������*#C�N hl����G�,�f���c���+U�<$�e�I�Q�`W3郒B���x�	V ������\�q�2 �/�7�L!j�����[\k�M��`.~��}F��Vf�d�u�5N�QSL�W���(�c�sp@��y�j�D��-�I�1���|g�H�%U��]�1�**n���c����P� �c�+3͛��R��U�h�s\����s���˵;��/v�a��?�`�2}1�Th�o�M�15�k�����B!�zj�~��������Py̅�-�$��g��g�J���?ڿ�A�d\� s�J`*���ؗ5�樀���,�D�H�����!�#��C+_����dU�#g8uY����F�լS�zq׬n]T]ؗ�O�<��\������+#*�׫�y}�|�w��sk I������*��
M}��ؿ���s�R^���К$�	��%���MK�X瀠����9�{�x;|�z_�\�����<�9�l��<� �3�DM��=of�5�c.V�?�ߢ�a�[e����ЯS��z����}O���� ��C8L)���3�I�&�]��-�;b�X=� ^;��DuIȚN�����!r��? \��)�y���\�h�#�Ve����B�y�
�3�u(���lv��*��������F��Ҡ�H<:�+(�1��CHl�� �� ����|�����f
�T2W�uw[o�	�Q,�-�@�.�c�z>�����w�@�o!+��#W�je1.1t�܌�C͕J���]ogB�K��n��i%    �H"��;;zk�ߴ�3��n�+X3�uo���\��۵�`����X������n9B�,�6��%�	TC�ק/Hi)��qb|S�-X$sX����M��r#\%�*��)
�Ly�@r�߷����I|ډjZA^�I��X���|_�MP#�^3{��2��LiPt��֘��I�������[�Q�.��?��Y��5u��+]�o�\m��6o���-��;`0;�f�쾲ڝ��X���N����TΪ+��lI��_�Y�#o�� eZ�]��`񨭼��J�����Fd$��(F<)�Rӯ��C�y~P�&Q�������>d�9Ƨ���~��e/�dTjY~�q���Bѻ��������x|��7��X?��uF�	������A�YBa�J@a�6T�S�[s����nQy����d�p��S@&�`��ߤ�#TEf&bL���\أzc�b:��;�dB��rz?D��"/���7��q�����zl�:��jQ'E
�� �G��� ?_#�]�X�bi4�J�2�p��d�� �h�d�@]Vމ�.;EMh�^�{��~�@�Ѻ-%Q��9Vܣ�	Fd�]>֧^���Jre��/�p����FE��0� �0��4|���Y��0k�F���"�r=Pϩ��W���A;�C�,�Ȓ.u)����f�}(�ʘT	�� UrK/�d}����*�/:$��(��S9U(p��YO
�s"���SGu��N��G����@�����ð�:��	gR!�(;c�9�����WVL:D�ߵ���Ei�9���{4�H��}*c;T35�{PG�}Ζ���4������HA$���F��xn��F�aO\㭠i):��0q��}iB?�{�y���˺�"���\��1�q|�H���%�=<->��8��ϱoSfI�4������g�����-["������Cp���A��Y}����������ϝF/��%^;��D��1l9����#�i9E�����l�=#����u���[�Nd,��,Q��q�F�Y��=�&e@c3�k�p��('�6Dʬ���N�'�ù�2�>w�b	�O�yG��i{��!b�麠����@Bi��8g
�������1�2�4�.K�(��+� ��)��]��������ǖ�h��|�aap��$��<Y
�ý�4>G�'uQٮ���j�}�Y;���YÕ}9��a$w���/��@C�O&a/o+nc>���p[$��lg*��,�-�F��c,��fL�ܖ:ء0���>:�X�:��y�qI�+&{��׶���:].�:��`�*`;Y�|�v�j�����SP�q 퍿\k0e�������������U{W������u���k�V���"�,��_{����ͦ�o��F�q�WT���g>��I�w�~�bq\�|�����p�����7疅?��,��;�Ӣ�">ba墾�Q~oP�ʋ�_,�������~��Y������ӓ�������_�S81~�(���~*��U�-!J��)�-�q+W,\��[t@��|��l��,��	��oR��B��n:��m�=r���j�+F�P��4��l��ho��2��Ǐ���`<藺�b}��lU
6(a�𥺷J�L]>;�8N�hqQ�\;��
%�]CA��\����m 
�p��q�{����]�"1pY� Z{�����	��$g4�I"���e�� �p%��b�÷3���?7��6Jn�$����6f�����]Y	K���� ��^c�6Uт�>�SS�}����$�^�Q�ς�4�5� I��n"��mĤ[5̭S��B)��T��&�7H��-eY�:e%I5M�[�cpՏ��Sg9�>̡�ڃ(����&J�O�����hl�Ff׀�5p�50�m:��Y�b
�s�b��1l7��CnI�]
�pW��8*&*�3Z\�=ߵ[A:r+��k�Et&tg�%�+ˆw5ɶ�Is?ԓ�Y/4Z��´G�7��hj�����azy�Jۄ�����ʈ)c�ED�G������~��o*WZ�&���Q�!�����.BÔg -[�4n�x갽��x)H�z3�-��°���p�m]qx��Z{���>���(i�0>��y���(XW���Sp·5������{�-B�4X���fJ49�7엘2��iS�0��ՏX��4��Dξ}�x����^��j���8I�)������q6��퉰:�y��:;��R���9���	_����p,��'|~vh�a�	qF0������]�P�D�B�&E���-���NfQL\����jle��=t��D&旪ul��섃"�T/l���~E�6�/*������U`�h|(4r6C�A��vvg,Ww�O�#Fu�xv�Ή�:㮢��z����WY�l��m֍N�IQ�%=L@�Ǆ���NC�e?��+��p���6C:�� X/�L��k�4,t�u�a������c���\<��:�&�z���b�C"�vˉz+4����e���d\�!ۍ��X�0ra��~���-������c?D��a��w����,^<����J�x0pZ�fjպ�ɰjo�^��q��\|�ڼ������q�=\�D�ļ?yyz��ݳ�Cb��
���lw߈N�m���<m((��
FT|��Y� 7Ga� �E{j�w���z�k]|�q>8�7�,o;��$��-^!]�A(�;�K�`�qF��hmo�@���C+�� *�X��8��rJ2�I�DVz���K���m���@�O(=�4��X�2֔<o3�����-�ꚴ�����zy�^���s�7�n�o���JK���؍4�l�8��uc��6�ᛊɞ>���A.�y��-�|��c�݄��E!eZ�]w��y�y��w0!�@m4)��Ha%�aU������h��Az�=���ո�}�(|����i�n�_���C�����RO]�����1gR���cȧ�1 <�Fl�w�MO�QC{&�$n��	Ĳ@�� ˏ�V�P�U�,6�r݅(A�B��sZ/n�BV����)�}�`楌�7*����L�K]�5@yo��S��4���"�~�9�1j����~	j�R���+"�ld#�H)�gU"��4�h�4QX��3A���Qx�D����ӆ����.�t��α���1��J?�S�������of�z��ԉ-�i���u�(����I�d����E�z ��kLl��u��gt1H��KD��v�
��VH�
������P�q��tǶ��vK��uf��*2 d��)Q%�!x��{r���ןT?��:{�f�����`!v�K��P8C���ZN�����j���_C���-��>B91T<�-��UO���J���\���u��Y�d'�v����Kئ��Ae��ʾ�J�w)Ԡ���֏2����k�b���SYvX{g�fۻ��C�R�\��M��!�ͼ�s����t��H��#,1��>��(�@���<�{�-G%�Rj��g���Ql��sn�bѹ��u�9�u����u�'	�����'��- ��g-���H��Vk�$�c��u]�V�2$�d�4�*ٱ)�11|�bJ��B�G^���l}Y����_̠	�K�c9a�]�+ҸA�]��V�j/�p�E�03!Z3�¥l	yxx�����lo�N��͋v���,�
A����8 �;��Q"���>מhӮKk�S#��*]f)��'G�a	9�RL�Rl�tg�u��	6�����i��熰���n����W�':�����Cg�K�`� |�V�O�6O2/#J�^i�vu ��ֿ�}[.V�=�����Ct�`����$`�]=W���6��ҥ��2^�lʅؿ�2�����r�O�f)�PT�ʼ������é+]
�0�7>��pBR���K�ۅ+O���)��
����+9l������CUq@�m*u�*);�^m��#�i=�m*���gJ���l1��+ ��]�v̉nxV7��*#��/+��Z�,    ��O :�$4��(�P��&���0G��#����,U�J$���F�lg-  �.�X��G�aƏ.�_�s��K��V��D����վ�69�xD�{vՑ��;����LT����q9������B\��3�=����vN	�XmQ��Z�*��wt�۫Im�^fۺ$~[��t�`9%���i�5|���y��E�%5]{(
VG�\�6SQ}��4�E��(S ,օ}�AG:S��T��0苻
 �ʲ�>ֳY�2��G��?�w]�/wu��|�c��)�Q*A���?���$�+8/ϖ�� �L�_l���t�4C�x���p�k�<o�N�����_1�PX�
�,�s����e���eY4*��.������cؓ ޔ͖�5fzIYCF�� ��u��q)���G��'B�����Qj"����0�I�$8^�aXv-dX'&S����@�^��z�ܯg7���}\�hC��h�
c=���57F�;�JRl��o@b�7��^��)3��/�iҘmh���\Ϸ[�u�5���ʤ���zZ�KM�	es���$`ܸ�/=�<	� aTk�G��F?�'�o!|髝Ԯ��;�������s����I<8��1Q2y�\�ng{�T�ٸ��DF%v��6~�����̃(���rR^��n�	�������!�Uԝ~Z�7`��l�,7#�!�!��f
�:��ʉ���0}l�	�=�O=��W�Z�Zl�)�7^��k�[����n~h�ۤ=�nf�v^�=�s<*.���ݰ����x�����	9	�����ߑ�p�h��� >Gr��7���^�A��.��I!��z�$%���/b��ܧ�[�p�i��p9���a���ā���_����=�U&�]n��
gP�������Rl/��/����2?�W~��<�6�ʐ����kB;M�}U-�z|�`�a���Q����G�e�Y2!�Zm����6��Mcն�FV�����E0�{�l��u�\{����_a+$�NrSô-@-sٽ-���cn�1|��:.H|�:��L�k��+����&+��1��K!J�(�sj���m���MK��� ��MC�;J,*<���]4��O!���YGXx�6heZ��Q�r7�b��|V� �%�:k�ʌ��_��g��p�~�̰��d����R홄�B� h.��E�D���V%�X���G%��0ER�
ut���X��E���>#�e^�5�-�(,��,�r��ć��?Jε���1G�#��B/;q6��]���w�^/��A�iֻ>ƟS����DZ���g��HG��2�}2Cx��;�M9̂��f�����A4x�4v P�/k[B�����@%<@	]�Br�3A������C<*��g������7:>���]���TM��S�S��ϰy��t�e8V�(�	��^G����L��"O�Řz�M;C�r�͍��c�u��y4O�;��}�~��#��r�w�����rl�Ba�^ d��x�bⲺ��E��+�D�7���~������@>ݢ���"��U�x�8>���!R�R@A&?X˵�2*F(v0��\�P����[�K&�Q�/���>�Ă���������ccګۻf<_f�N�=��;�$��1�T���#k@M���J���?��b��t��
n�4���⌙csD6�&�I��g��Œ7:�K��󒀻}\�7�Mc��2oµ�A���=�,��c��S{�&�����<����A�}\�G6��)��)�(䪻���\�*έ��S^r��z�#x�Y�vR�����5{}l���T�j���O��^b��:IY�����/�`�6lfY�VV��8�&r˲�x�yq����[�V�
�c����ǲ� ,$�Xɰ���瓏-��2��xQ.���
��6KX�/ȝ����+��>u�"2_�m��x0c�G��K�0|�B�L����
�t��O�d�����(�9�i�{�}	wt_ھ����k��X  = J(ߛa���e�J�����Y�C�;�Ğ���&]�"I��)�f�t���G�y��k����:��̛e�X�i�Bm���v�Q���&� �]�ə6���ܪQ&�!�0 [��4��S4 ���I ������H���~	d�`�#6L{����/����"-E�~g4��5r�Lzs�����K8��z�v �T�.G��s����%h�t�"���Bttk
>NOY���0׸��S����������ivt�魡��񁪋�����56M�z,�'?�V�`H�����8ʄ�4(��ʣ�w�%܀M�ɖE�o�s-����ce��Q�޲H�uA�RW��q5bkn7��P��`b��&e��7�=���5)�B{Z��P�pTBc�(�2�֜�-P1�k�J˽0��_��l���?��S輇��)��\����2F��ۥ�쐶5Q�8�f$�!B�-��e�X��W"H�uC����ig��i�^`����	�q�؊m��FA���MA�k?g�u� Pf��G�BI���3�~�[��?_������!6/����赜*�	��a�"?�i�J���.b��m��]8��]8�~�1i
�v#��;�y���� O�_��r���ﳍ�{5�˼���Q�-� �5�o�X_��e�Z~�ժ������QI-�貗���ǌ��79S
g���D��5`G]���<�}�p�9�^�1�퓘GR��ɬŞ��5�����WΣ1�	>����-q��Y\a9�w��!{����(Q�F�t�1�(�e.�e�*xL��}��e����a`])+�i��6�s��p��P��|������.�~��f�Bܮ��M`��Jy܊�MP8,<���6߯g�6M��Q<��?^�|�L�
���j_Q�P������@�����de��v���a%8!�.�ܵ�1���_׎8�D1��K�2lB�iK	Q�ϛu�WSV��Tl�h�g��3
�_0޷�i݀�;��~�})]L���(���V��]W���K��ⰿ�b�W����a[�R�ݐ"��b*�fʑ��!�!t�x�}��9�åc�C��0��	��;a��7X|�[���\}؋U�q��ף�+6�0[v����ǲ��A�9��5	]W?��&h㿯on������?̚�r#ӊ��X�a�&J����dFow�RFҙM���83��1@d��mX��ln��Wj�:�����0t:�����̝�p粒Ǚ��*���pF�e�y��J�fh��	␲�$G��Y��#$�?�j;\��f6C�y��.�)'N��7�������]�Ph�u��(J��.r2�����THx���G��ք��w����\�N!Ȏ.���8�[���@6N>��v��6�����~a��I7�סb	�f�V �v��������8Tav0>����t��iڲ�oS0��ݒ)�d��Q�?�؂j>���e���(*�|l�#
�y�!T`Ջ$�{b�RV/"(A��;D��{v�S:�E�w4�")>����v�M*�C����x�!��&�?����V�V+\	�J��%��3���i��iPs�!ZZ��q3}vWͱ�ړp��r8֑��}�ū���*�FC|[E���,5}�fK�T) ��<�2P�	v,($�mg�"K��G(�e��eݯJ���h[l�U�	R/v�TT.}h�ӧ������P�2>�`�p�Q�͖�p�1�\�uC��7��@Zࡘ�+6�a��J�RJ0Y:��R�+�9�m_�ʹ��r�� ���������8�{w��Ý�{[P��b�F�*/�V��Ggg���/�7��f0�l����������Ջ��3]�y��������X εִ)����F7�2{��ш�2���?����5�5`I�r�Ȫ9D����of��R�Ɉ�!Ny,�8�-x'm�8#[�N�$l8��8,p�[�Q�}�Ѝ�iWN5˘R����<�R�b]�˺�[�	�6��n��A��q3�[������     ��T��m<1���=�m�����RO$ڇ�X�Y�}���*�r���r?�!7s�@�k։m�:�;79	ȡ*���l���`ɿ��8��қƣȄ��ꤱL�xL R-��sz��=�9���c��I=��f��"p�">d.��&I����0����!����V|���l}���2��`�Q��@�PX�)E( e�K*&���l��_U��.�^�*�����]#��(i	gz�>N�6Ħ�{Kj�F�LB͔��Uvw�����s=գ��{�5ò����p�N����v�)�X�Yn�g���*�K�À�dÒ����:\׋�o�>_�ݨ��ڻ��d.�?�ط��"j#b��^�F����9���������}K:������u���;@/�rj�fu��+��$|*��ҢA��>+�1Vlܛ�S2Sq��XW���o�P.<�%cX����/ ���U��h�qv�cv��Jc��Z5��c;C��)��塠�#����Ꮋy�!O[N�D���)���V��#}���}�+���A����EjrO��H��d[rL��ǔ�c;��}�fr?�L�����z�2�Uq�?�����ͳ{OF��M>���Ǫ�A
�1zZJE���clvU7��;d��O�ˇ���r�c�8���>+~�}���	͂�u4���ڍM���nG=/�[���O�ۮ�,b/���kR�p'�������*ٚ/����gG�nlWM��ų�����{ߥ�F�o���dX�1��7��.��G�1����k�� �%����ns�����a��#&�iA�E���5�S}X�4��X��ꉈ�BCn��E0"��M�P#/Z�"p�J1Կ�O���l��!R�;"c�\�k&х�O�� q\v z��% +b�e�p�>�E�^t����jf��4K�{�<������XI>u��eX9�����c`��X~�����m�`�]���z^�c��C+2����ë́W�_y���=��a��_&;*(�ڟ��^	IsY�)&d�R�*4�|�A�gw��H���$IƓ������-�Y�̜J��gˏ�+1M:ډH]*���ji�{2s�vα�[M�(ω��˱S6yHE"���\�]n�� ��_:e9[�r�	��t�Ӡ�1�[�f��!W�Ыl�9�%�������:�b%�>[�x��KE^\b"�ө�N��`V��m����lc��-�#��D�+�R.a�����?� ��W��|Ħ�s�=������ ^ڔ�m�q48"P�FҁR|+�JC��?�``��)~���ͽ�5�g��l�X:�]B�C��xG�׌��W(5g�hn5WI�����w�m��ŋ�u�ʨ��x�\�:��!d��2���8CIFZ$3��[�i2��p�;�� JdC��as���xw��H��#��$�AQ��
��#���Y����5�[sl��q|��,������6�e�t�h�(�nsm0V���4+'�4�a��}���^!쉓�]&�S�Y[��@�h�1�>�t��h/����p�����E�!(�O�˜�]���#l�?4��ĥ������Ic'����m���	X��.���嘟�.���3Ͽk? ���E��H1nX��(rYZ�s9L�!�3����m�6����Δ�Loa�'�Ի[eP�b�v��{0d���X�xl;fxYb��*�1�L���a��ܼE�w�SW��(�{���i5�*/ �t��,铔z���!k�ֽZ�	8�R������N��{��a�~D����o5:�B�����<Y�8N�@2,P(���N����?R�!w�F�k�~���3��Ҿ6V༾�o���3��"�W+�H�E�+�t���|v���S�̾lJ�v��.��E�ߋ=q��)u��B�mI1����l��+�(��t�1�/�gc���u��Gx$C"��Ԁ��� ��V$��}f>L�$�uP�l�.��$yճ52�m�V�G���������uP����TH� �K�oe�h�=��J�=��Q�Q>�bʾ����et�����gU�V�ax�0����.$��q{������էȼg܀�g|#ܬQ^��z�q�S��ܚ1���J\}�͵����*�J�c��c=*l��>�מV��m)P��X�|�":�gF�����B�uW88}F���3���$لF���e���O��@�xy��f�l�awA1�u;V��Pl�q���c�~�Ǝ��l�`�z�2h��<��-L�.5� ��c�!6���/\M�����]���;X��2'+����^���rgx�V�mI��+���ˋ]�Y`컁�� e%d�]`�5X��%/?�ɮ밭��k����'6t�l�u����"�����q��b�,B�M���	�ƻTi�r6���x��]��3�W�<���o,y��eխ�D�.���f��l4�� ������U��%��7��0 �m+UO�]V崚���+�l��X�Q׹����Ĕȴ�#�F}̊1�!�w��Q�6'<y�e�a2M8n�@���1��W|�ĥ�w)�_��)���͵�K��r�ڧ.�%u���\؎�����S=�;��~t})��LY�h/�*3�+���dj��RΕ�r ��ζ�CJ@TKO���S��k�0��e�&͇��~��=m�26��1d�;9?q0v�:�=�)ڞL6|��k �b�6���1��!;�(r"�x�$8��b�`��)�l�M�`$ɋpqnM��X_I�)QЍ�64�n	|7$��j^�9>{��nu���$�ѦF8B�D�.�Ȃs��u�7��&�����gH4S4���J���+�˰��_߁Wc�����!���#C2_@�36� hF�*u*��)��^uSk������
Dit6hp���L\q�C�A(�C��(���'��OE\n�R�wO�.���Sjnoy�J�/}�i$e���  �Â�y��1�#^��XXj��}Q8��%��&�"���L���b���c�]]�I,���%���ueE+���!���
%U� �t+}K��A�oL3"�w���zqӆY��Y[�E�l�z���s����"jr�A��`Z�1���X��wL����U)����f���7�euh��Pr��f/�p[�R��0�U���m0c��m?����Y:��������,��?�����ׂ���c�������>rM������u���{�c�Q����y���{��������T$�R&3�"r�	�������s�t=�������P�µ!v��l"Վ��]='d�
,T�}~������u�N1�Uf���p���R���[��Q�y�`������Àݰ(6U�o�NJm��#�T`��@#�KN����=\�O�ƿ�O�� [�e���`D\�V�G	�~Be�NG�M������F11"B�e�#�IM��W�$�J������j���*�~D�淀&��m��Jg��>�?�	��E�&��'Odv�d�D*������4\�
�7D4���-Nc�(ғ8��j1ކc�(�)Ġ7 �(p�(#��1\yR��`��,+'lk�`�����L7i�}�����~�]}Q��O�)�#�cѻ:c_�j������f�N-`v��w�2*��m�$����Hq�p|�}���I6�x�~�n˩��ؿ�2l�v�,��������2��>D)�B8�3�6�e1k;��n�-�U�ť�;:��љW ٚe�f����IԪ4FY�E�l�r��d\{��ь�n�����YI���W�ܥ�-1�9���v����X̕jD���m�����R�-�A�-b�̉�A�	�3K�V�,�O�$�[�f��B&(	��>&�	�PFR@=Jy�&&�cy\��i�wθ�h��촘�Y,��I�İ��ա�D�<'�	?�VJ��^�I��1UI���H���ͮ�+#����I���G�ɱ�O��*:-�V;��eZ�;�{jduB�*�Q�s�#���q���f�$��W�|��6G��:�pE��?G8��T��X��-��    �M�MO�D����O�����Ա�.%ʐ��}"6������X���eEa�T�fJ��g����Q��U����Dl��e�EM+�5;oc�-T�e�Q�<8R4��cS��M>V��n���˶~h#��e�g���aT�H��&*�E��v(�X[���S�ewe�[��H�/��Ӷ���$��f��!�ѧ� �������Q&9��i�qO"M��D�I:/کi��EE���yΝ��<��?����7�|X>�}��$�qU���*���}��t+�QcWn�?��ب��;KS���[X��j�<>k�~��g	�p�����������WE唂�ܹ�5�	W�`�`����j�D��*k{.���e�R������ $"C3f�G�i�Q�즩r
��R~�R鷬��lɜ������v�{XA�#>_[W���8�ǧ��j�L�RN�����Q���F�����(����F�6��N�����`��e9�:|�7��͙N��2�j�*����s�6쬄N��X�M��6I3y^].�O�ɬ��`����kC\�1#;���K�wbW1���t�&U@63ՁyG4*�{� 8L�I��_V�>�v���,���0'�	����j#�cHF<�t �s=�^M||�3�����$�X����(d�� S0�̌"q�O��Pᔻ7x�S��n�`�p��$������i ��#"8 8����ꦽ���XW���@��^O������T&�2��A\�9Ψ%'���q=p���.Oho�a�x�ܻ��8�x��f)�-�����<u�_���EEl`h�y&��@�b���,_��W��i3���=w�X�����R��@��;�|T��ׁ��.�s�0��f�1�
F4.������¹3�a�	�w��Ox
�W��D�"W!�c�I�F@���G�9�+����<Ǣ~�׶���W�ylk�,	�c;���?�7��(���2����V�aN	���"E�Է�s�Y��/�u��!P��TV|[he��Zb�Ӓ{]C����[�at9UJ�������G:�1��ی���u;wR6���? ,\��mk�"qC�ۮ0Imsl[H�[���JQD�L��C�����dE�r��^�,	�pT5w�^xY��Sǋe��-F���-m��# H�S�y�z�5r��Zz�Ŷ�ӈX���lPe0�f�1i*��D7�G�9%1n�>ا�������G���5��W�i[����y��?���nj�-Fǽ_b�yQy�F`����;0���T�,��;�&t����JG�� '��%�� <��-��a�4n�~�N5�p��6�j"�9R��nu\�Вד���oy�NS��h
n��68�jp��6c�7�J��<' ;�m!qO�zx��D]0C����5;��}Ő�i��j�Z59��B���:g�
Z:���0���,���3L�����:Ww+Ǫ8)rV!.�T�,/�*v�v���W��`��1H[�^�n�l�
�����S��pq:l|m?سvq�� )7���w6�Ď�dspV���-�
$o�f-���/���
G��V ���c;��	�����-�\��]��4��k�[/��[���m���Q��W�+���;^o�S�ԂoT�t�̈�o�i�J�\�|����\"!&3�]�v0ڌ��1oUņ���\��1n}�����<�0/�<���X#�r՜L�(���`�L~�ע%��c-v��$�
w�<L���ܮW�K@��@��Y��#U��?�1_x��0�o�a� �U�q��������\�w��:��V��qQ�>Ջ�-jG]�8�F�yo!�T�r�@���μG6���s�D��ÿXs�\l�b�����*]I�~�/��-�5p[>,�>\���.:����]	V���^��|3kc{-%��ЅT����:���#��̿�b\���s\|��nk��3��jd=��}ɹ/��2M��l�Z���
l;l���h�KX��y{�-��+ml\x�R^���z�"����n���*Y8RV%�4���G~�����Ł��Oz�z1��z��Y �����beD�8��]0�!G=̖��D0%�c��?2����@1�M� �r�g%�j�j7����u-�����E<�L���";O�(��Y�v���u Ӝ�N�6��6�8�-g/Q��������z.�I$��G��K���Q2ɬKC��������o ��]c�\�����=�p������|X
�
�JUyYB7�>�7�9ڮK�_x�.��y8ګ��_��� ���u��*:��M�P����	��Q�s;��[�b��6z����GUpM{��#����*,��;�=	��Jo;�&�ѻ9@rd��8Tv����t1�9���t\����^����;c��k���C:���~���jiC�_�|�Z5�>��X�ƨ��-���#F*�>.�4MY���&Nv�a�|�������=�k�iv>=��r���:����W�哌
V���ê�����Vp�l�,�(�.L)��!��&���|�	K�`�8�Zł�bZ�Ԫ\�,8ݪ��@�­��X�p�����,��2��r�����fӼ�Q7�h�����=�0z�-��m��v�� ��]�J���B�&-6�e��:TU����1�BA�k뀿�~U[dc$�����6�-���7lK!x��ByW*��\�1�ox��߮����uֻ�[m,�	hK�i$�Ӌ$S�E��E�fZ�7�/H�C�B��5�p�I���sd;�OmX\��O��^��&g	�饟�W:¸3�C-�儡nBi�����,񭆀h�.x����0���B۶�)�p�Ƨ;Z��6�p��C(�G��*�*�B�i��TE�1��Lg�x�T����B��q��S��s��	I�c<��&���f㑢�������G�o��9�k�J��:_�bH�[�OV����F�}lZ-G�dƦ��q1}��
�.͡���T����l��l�JZ������,�y7|�r�x���RD���fy�B9�����~;�
�-�2��&沣���}�5����q�y�\k/��o	�,��mn�p�����@H�9\͕>�vh�o���{��߭���F��a���R#�ً�r�eK�%����2���^��D&H��ʓ�y^��>" �iU�5�#��:�@2C"���4�,\0	�����X���;��nuZ�t�@��i���>e���ϊ��t��+�@���hW0����
s2��vs�vi���I`	M_ӟf&vߎ��c�^���c[N۰��2�;�����u����A\���N(h��.kD5�R��ċ�v���_n��s�p�2�E��~�򠚣��:��,}��=�#�E�vt!�S�+���9�����[��n�.����<���l�W!��v>:�W��\Z+ǻ��!�:��d�s͕sVR>�Hh���_�	,��׈��q�22�6<p��G=���.�cƝ��?A��lD}c�*9H�o����\{1ޢ���O6�3�KyЗY6.��_���,�u:XJx�_D�� �ivԋ��OV�3\H�Ō>�&��� Z\������՘�?B��h�jx�~ٮ���o^��Lqs�I�M�*:���t`�k�p[��H�E �F��ƒ�f-��,J�Z��x�.�:#���(2;9eְ����{n�@��e�z{ �,)�仆3�5OŪQ�j��{Z_7a���Ņ�B>�l�)���l���)��h�Ʋ�<�\2�Zܕ7���?��P �-?3��p
W�����xI#{Љ�')���!��s1^���,��M+P�������ք�η�E`��!3�ت b�!w�;-¯H��(Qƴ��Q- ^��nr}�ʪ�� �s�K6 ���J��­����{�L�Rƪ�u���w���v5������r`�V��e1VA��\=�����X�BC�KX�z{���Ӽa�1�F� SI�\.    �Ȇ�L�jC>>�?`�Z��ƅ���?��X)����/��8���a��"f�H�$��̈�2�q(�p訾Q���ژ��ag��y�l~[7��J�f��<p���m���_ޭw�#����@M.L#����?��q�T�mFztŔ�-ޒ�����o�0�������r}���^�i��Ȍ�i�Uaz��UP�)�	��k�����Kgj"�ZK�J�V�a����'|�^�YQ��o���~�D�n��:���$�!�&O�:L�b"Q�":K	�ڜ;��B��X ڏ?�:�ִ*�����y��	�Ƌ'͖Ői��4u�M�жˈ��P��ϱ�����t(�{��`d��J�J\�(,�hl� ,.HQ�}���!/�<n�)ퟜ��k4���n��Io% �^�A�7=���r���O�L��*7^���?a����NcO�����*�8����*�`���Civ�Ł�0��R
���4?�wY/��?ձ�ⵖ+���0��+/�DP����_���z1�J�^�f����Gr>��X�B-���)���3�3��Z2hVkmG)q ���t3)��ԕV���[��/��K��f��n�B����G�A��G��oҌ�(Sـ��,����C2�\- 9^&���O�q�����-'���"_R�Xٝ���z�^pM����6�kz�vH�k>y�i8n=e��
;$.J?�����.4�7�!�m�������`�+/R[5f��tTsĤ�ƔS�R�:��0����I7�,A��b��H}���ŏ�O=���9��/�o�@"��bt25"�򶁵M+�(qſ6).�8:r	
mb?�"s��q���ͅ�b}���"eZ���2خ/���Qw�g��u��So�+�aW:��[�x0�r�Qz�>�q���=��B r��(�\�v��i��$@Y֪�bfqfo^S���y�-Tv�	E[�T���`r��ď��'�a�-�K�)K��"MS�N=��I�f_�0W�=�d�M��m:�oJ��Lc��u�!�����>k��l ��6��ȥq��Zz���Mن�Kz���30{ ����}�?o`��:mA�e��	��86q���żB;
�>oWYu��'����uP�j3H̸�d�Z�}w��P�*rխ0�tH+�[������i�>�W�4�xje�"ޙ�C�j�Ѕz��2�g�Qƚ�vP����d�����AF����P�E"_�8#�q���bɠ1�vj�ނ����!լ�M��¶Gèު�h fV��X;V�$"[��O׷11_�7c��>
����j#n��ᦗ-�����(n\�����_����/��?`m���
a�r7Q�Ѷ��Sf�`]"E��42�$OP�1���7��;�b�ǆ�(�	�/�C�����( )�P� W����J�)�'�v�6[>7�<>����3�ȱ��ayR��l~�n&w(��֨aKi�i0-�W� �nJU�q�H�
���o����T�Nx�"�V��"}��g�%���4��ˇ��nL�[��BU����,�sl�Y�&;����Xb�z�if�(�Q�D�8x���u����Pd��x_��|��ڛm<�%l�r�+Fͅ\����~ ��j���f��V�_��D�j��v
LK��>n��^A��vCF��k~@��zё-W-� �pa��xG�dFgJ����b�h���Q����x�;�j�l<��5�Տ����q��c�����)���X�zH~��?c�q1���Ԑ;�c� �H!G$Xz�d4L��H�L:)���5aȡHDK>g�c�y�O���w�Z��B���۪�2�3{��!;�� X����ZX��Pl�ƾ�T���F�V~�������}����B�*d
�c�>����d9�l6���/�7���J�<6���*v��àM�J��A�S*�_%�6E�������O���a�5 �Y*�M:7�S�a���zғ�طɹ �TI��h�x� )u^��x��M�Q��*�뜶Y7�ʅ��������d+�&���b$Ȣ�L�US��C�������ja��I&�0��/߂[��渭Mxf�\o�Zz ��E�1�ly��V��� BV>����ˢIn�L��##�-*^��Cx1FjG'.�[a�i�"���4�Y����I)�͂H+M���F(h�d"�Ȑ���cH"e�&�Ѭ��<B�Lq�-��;�)[]S]6	i8[U��zR����z�]b9}����K05���Y���v��O7��F��l�ɌqKg>o3��!��ȡb������m�	F|�?��i�Mo+_N��[csg+ T�/��ꢩ��`|�4&
?��R���@j�}�"�zԥIէ�V]����v:(>�SE��y� �)VgO�xN�����\��%��Ꜹ�(5��,K;��['r�TEh����V��D�}M͖ɞ�a�ɓ[F�aNw�Z磆�N���ԣR�B�����9�I������_Ii�������hP>N:��4����OD�O��2sιo�*�O6l�g}n�n$��ƻM'.�PΡޞ��b��e�+4sg���t㍭����3	c���a��B�l�\�20DZ�}�7��4Š�,~���$mc�����
ˊ��ltw��g9�?b�3 RIÂ����x��x� $C�G�\GB�x1�d�i�1e��ي�ꍏ����g=8�6�v�x�a}��P�Izp�u[��[`�w��=�����l=��4f���g?��=��������)� G�crn��p��w�][������۷mV#�����F���L��C��Pd���I56������\�Ưz����껲+gD�^L�C'�nO��_�o�ϩJ0���\�K�����:Y"�ʢ���T�=�B�k]򎔚�ԟ���P��w���)�?�x~I��˛B�Q���*�i�1y��!gfņ(o^��� �
5��R�n$m6Pgc�z)L6wJɬ	Ÿ���֩�E��2m��nC�#�������iq-�֫�L�_�ʆ$0Wݠ�ў�?A����|:��gy.�x�`V�ؼr�(�e!dUP�'�ƫw��1��e,���}�M�h���V`�J�����!��#l�[�1l�d�������R�[*��߯W�e�7�ިϱ"[�̑��dX2%���?��Cuf�>�b��B���l0�3�o��,�\�/����^p}�e��<ۘ�hV�0�@ܖ�x�;F��aA�ɸ�檬�Xs�����1�߉A�mQW�/v�8�'��q�5�t�P��:X87��yQƙ*:Fz�]��U4�Q=p� �?4��؛�a�۠t�"�q[z����t�	x�J�w1��JT���+ ������;x/��l7��9�8{������B%�j�cs;jE���Q�R5�ʏ��/�����^z�"�0�~0�������؂�Xׄ�KJ��>�c,�EL��U̘��"�h�������N��ˍ�UCT�w��M5����#����K��UN������T�X#ED8)"k2�6��3v,1������NU��Y�Z�֖1��&�q�U��F������MK�P�N�j�P�|S��i#�A�B$$�At�(�J�-[�o[�+D��y�!�,�;.�C�������T/W9e̯�@�"y[�Y�fa�XH%a#�Haw u���rv#KF�_(o����Ӳ\���[	6p��Mr��]r�>|nC�6�S?�^��3��au"�����v���,���W���I�#���c4V(�f;B�]��T.�2U���a����["��Glbo�{^�(�g�����= �x�X;|���S��c������㈟���n��ڳ�i�#i�0�zRI�%�K�z{x�^B+�Y�`JYσ���4�Q9�Ȓ��T����J�#�j�,��k8��ޑ-���m3!�����&��%�H�x}�d��>OʖOIT��֦,g�Ӵ��Q��_W�L� hL�ګ�i1yH�g��e�t ǡ5=�kVPj�L�z+�B�¯<���,w�    �V��A���Lx���G���-�&(SE�7ouw��y�@�_�b� �]Cǎs��������~q*����*{����i��}�AQ�q$��ǔ�I�[�@��a��	�!�>WZTv�<�<D8�V��5���%����Ϝ	6g����O�6p&��+F�u��~�����;$���������.�P��f��}��㶰;ƹ��_���Ƒ9,� 6H���A�퍉��ܣ-]j���x�]Q� 6i�A*�|���æ�1�=�r{ ~mi��
�ئ�P�8��>j�Zb��#���J��Yj}�I��F��i��)ʶb 罁�|]���
9ʩ�����, �nӶJj�@���Jd�zx���`'� gc�3c�RI� �WMH��=�-�E\á���rIRzi�R����J����/�?�n6	 �.�O
0���A��X�ϫ M0@�,��4u�U�%��y	T�63%�\:�>�a8@�%Ѿ���
{�-�۔�7�B ���U��&�l;�ZE�c*��ј�WrJ�s���_�*��a�,��@���@t��y[
Z$��IM+!�J�f���޿�&	E��&*(8-�X���UC�N!��;EK\�մ�oN��Dw�)m��}Y��=I�[/M���`���+�=�+3���ޙ�a!�)kX�{B����6u����%Y����^_�n�݌(&����u�'l^�ۯ��8���7�fߚ���M�|FW'�[��d��Ws[�v��@f��f��ˈ[VulIG��DU����դ����+zb���7ɚo�4e{V`ij@<�zx��'�R���u�֣3{S���t�)���Y��M��|o]>:�mv��`��6�[�St+�P�v��up;��>X��/Q @LT�ͣ�֬�Y���F��#G�;�
�`��O1oIJ���z.��5�q�@G*~&����>���di�w��\�$�nM~'���}���{�[�[o���x%�����*a�~��aVep+���.����g}���u�0�]�~�:˓z��t����5��3�]{�ݜ�
����ض� `�%�tjCƯ�w��Ҍ�5�N(�UcW1c��?�w�]��.d%_a��x�$�?���%�J� ���4�#����i���]}w�.���bM����mǩ�YA
r�Y�fy�V�v�k�1�9�������e2i��b5�����g4���+�q֗�J/�J�<41��	a���3DX�I�'��I֊/`��5s/UV�O�RY��1����1L�Uo(4_�绯Q�LB�MOH�U����:��$Zl`0��Gn'Gt�T_{¹��fr�/��~օ�f�0]���ѧI�yǷ����	���+mn�$4��������R8E�!�kt�ُ4!��j�m�lM#��b�נ�<ZC<��L�y^,׫�k2���f��9&�����x���ȁ��@�'���ws��Q H��!�+��ߤ��~����;}�����X��&w�X�}�Q�|��pQu�:��JԽb1��z���Q`+J��;��$᛬�M)�"��έ��%L��)G�Jl�8��r�^E�!�{�Q���_mh�&N�S�`���Ǐ�#1h8�#���;�*S�J���pA�=��C}7K��K_���ܤI�c��B�Z���M�d���}�j�c|K5���Z�N���f,UJUZ���ꪟ��j��Ý��m�7?�R/$�cE>R �/��!8��F!�ABY���̮�Ty�t���cW���Z���l]�K��D��4��(�/j���@��ǯ�k(ξ��`�'����?GC5`�0�+x>p�o<�X~;u�}�	�P��:Ԉ��G��ԎA<����酲�B[�|���,��G	��~��Ê0q8�
��j���^��ƥ/�+��q!��������I!��S�v~6�<�lʫ`��/�@�ц"͒N�M���f�ۣ�2���d�vt�?%�Q���tT$;�x.�P���	O[:u���f��f�����-��i�q��IN���C��J`s[�e\ZI��żC��v���w<��s�K��<kB.��^����z1�	�w>8���J�V�?�zG<i����!�D(ͼ�,� u?�@�'�ehP���N�+6�ت���5כz�����ڹQ�u��Dy�
�ç��%0��e��g3�����~�&[z�:��q
�0*S�86Id_��lM�S��h'7��Jzb����9�N����C�VE�QG�Z��e+Y��]g�h�v�R�Ёe�	�.���I�ɴf-��@?��ŲɗiCb��KY��6��1��ɷ��k2��G�G����=5ˋ�����r��e�n*C9C��Қ�ξ�#@X�2=	Е^J�%���HGqQx�++}�y�D��I0)(P���^?�c��[�Ǳ��{�N2Z��j?�̦/Ic�_��&����M�b���C:�r혡.�1�&G�:�
vB� �Z�Ժ���I�#{�.�� ��A�Pa�u�^�;�5�"��41�;)�K"�];�W�A�6Ua��WGb��@�ͽ.�2�6���eq���rKD?�=Yr�����r�jΙ���Kժ9y��S������T�B�2��v�R�xK=�G��r@�r�����]}w��z�*�
z�xV������g��v{�6�ks+�p3_|����1��g�@/OO�@�d���>������^�޴�+t'�a���<���9� ��o0�X�E�����MR2t��A�MhF���H ���D-X��`��в����Қ@��X�BH/F��0?lA���d�ui���<m�wͶ�V�e1���f��;�L[2	�;y0ܮ�a�؆�����B���|d�%�T�h����e��B�<�q)Ct�śEn�`_
�OT#M���4��W��V�]pH�})������ ���,�8ĉt �C���Բ��"���[�$�r�%^�x��E���Hf_��7�_�K|X��ϞA�f�߀`o�宎n����.�x���M��J���8E`�4��xg�5�� f��T�N��!�@��Ţ�/p��g��L띐����ֈ�O�S��卿bQ��z�s��. Shߎ��use�;v8�Ó]W��XOT]�Rir�R+Gٹ�.��l�N�u�t���M��uw�L{�ó9���Y	������s����=z]�H��EJT�V���v��p��:��H�𮨬�"Z�ym!C�@t���t!�K�ԍ�nbW��S�] �ٕ��	tOO��@�h��L����e)�mUIm��9��Z0j�O���	
4����pB�)7}��}��~���mM6�}�E���(Y�i��Q�t����uv@���g�ו�R��«Y5*�Tcr����� LurΫv0S���4(}9qr��I� �@G����k�����=��CɖKl�/iG�*P��b�P��&��[�X\s�P:Ċ�����J�Ee�[:��~�Y����!������<PG|b�϶�q�c4���?4�M�I<��G�j�1�Jө�#�I`9�V<��M	v+8�C��H##�:v�%R	����s�< P�����4�W56�iv�Al�M�O�ET�,5�j��)��"x������r1�v�=����U�	�,��"�OIe���+�̻�R䈪����
�C;�1"^_���c�J)�ثb��{�'��Y1y��<2R/%��U	H�C�7�9��W�W�K���5d�����Sʣx�c�^׻��u�#bU6a	|S��͹��E%�r���{D��� y܉V]{�[�5J��eF�%%uZ�ty��.[�C(���g��6l�~>O4/��Б�hJv*�P��a^r���[�T���w
�>�T^���A
���;-�������qX\xvӐ���O���|?ն[hx|��K�%��4��O�.A��.n����J��W�{���i�^r�4r��Vv*1N���E,�x��^�f:��N��0�$��^�X'��#������3�3�5�|����:ny_��1=�'K�lN    ��X��v��u�6&���*�N{�g�\���$��8^\/J��z��v�x�A��*�18@�g�������mPJ̴�������P�%���7r��^X�l�cB�\�?�oM��3ơ�,���2;�B	䔻�����z��]�ûvn\����hB�H�tG;��m�v�C��ڐJ}#UAt��
ñw5l�w�M�\_7�Ss�'_Oƒgk�Ο������u�MoBr��㙈ܹ�L4U��t� H^y�hI��"`6�{/�`��.� ��Y� �(����h��mn��t�paq��&�%b4�J'��=��\��!����y�[���2O�:YHy��ty��E��v�R8�71㋒E��>R2ͼ�/�$�^Ďx�糪BMQ��mk�y�Ǖ���\�y��S܄�u�޸h�Hln6�
!��dL���]���X����N	)I�܆k94R�Rd�SB�C*o���T�F+*a �5}*�2�Q��)�������W����~�(�����1�fh�e��Ё��NV&�as�:�/���`=�R�N!�o�
)@�̅
@IeÐ���a�Q��2�?�z^���^��'�^7�����֙[8.I��R%�������^ۨ��w���#��0���	ru)���g&:�}�갞�t�<���z�J"Z�6��?���l�������fI��nBU�&��uu��߽I{�U�D���ᨪ1d���h�[���M2���c�6�`A�Ʋ�&΋��I��!R|[�^�2�qT�H_7�߯�ȑ�s�T�-�G��C/[����P`_��,�>���F�ٺT!x��T"!
Q=��LCX���Gx��W*y��%�ly�]e!���/ZH�}��B�눯����v<n&��_���q>c�fŬ>i�f�?�����= ���7���پ����sl���S��)~�6Ru�;�>��TTȳ9�*]Go�Z����G�)ϖpB�M��S1�	p����9-�]�Qn��0������@涇�j�v%��{�c���	��)XZ�������b��+8a#����5XT�A��AO�郠/��+	/�af��F0iG=C�*�~��&��?ӝ��^��/��	*�@������9�b��'����1x��B���cnƜB�������59�~w6�,��_��g��p�	+~�x���R�@�e��:�s��C��Q���QFO y"B� zgH�2��
�J��A�̓#�V��AD���v��^�W}�L�����n݋�Si;GAH�W&�}H4&d��{Y]�r�>��n�N()��Х��X�'.O�3�^�G�d�U�E��@F�|^"����xན<��1
%�v�hf^U%�'��'q"��q�p�w�x�6�-����/��BK��xB����P�JtD�#��hW?Q���8�و���f����+�	��r��$�W�$-,�?7/�vk�NϨ�ݠ�Y��
��C/��)���n�e0�ZX��⎵;�>��' X��� ��
�#��*���>�ȓg��?5uVdX3d�fΪ$�k"�4���h�?"fk�l�M*b���)ə�5���0_+���?��γ�������Kn�����4�ހd��o!3F�ȣ8z⪄~�@2�:�:�Q֐F�n�����Η*วuO�CrѤ/!BG�ܕ���F�+�<o�Ʊ���)o�p)%�X�]M��[�y@��aQ����6�5�a�Qo�XE���Vfnm�a-U}�먘�·�5s�y'��X.��g8�7�R"�;�ptF�@�>ϝ�a��Ԝ����Tu��Ŵ�����V�V�J����w�JbXퟘ�\�^�F���m}!wlx�����vJ�o*����&q�\_��8�Z����c�3��3��o���~����&��2��r�n������Q��٫��[x	�&7S��-R&�%�%Hl#����p_Ք�;ʷ�z���?����h-�ne��iU�M�`�L�v�5�cB�G�5�t��� f�`WR��s�b�A(��.��c�qX_����,�JB�r���d �
��u��Oƃm�G�z]��+�*,����e���cE�N���ẹ����s�7iDZ��$ �}=�]�2�]�#%�$I���K^�9�K�e��U��]p%�3�(ˎ��A�@����_�_Dr!T�URF��_ab^�T�K�_	{1���� �a_��8�j@p�+L�Bǋ�Sv���k�L���%�0���&��FbD �T��L���'�:F4'����,=��<t�-���Cf7��$�
lҞIe9��S(�i]v�@a�f�9���q�j�����:M\c�vӓ�$.���*N�T4�����^,o���0����6`�����x���;��[aS7��b3��I�3K�QξXT=�����Y�b��%~g����]\S���zO���<��O)"���4�(��N{��;�O>�`Q;㿝��BЂ�AX�u�H|��B9�UN�l�����V�V�hA�R�F�r�I?ק�%n�5"��ӷS/���������	�+ņD���eu(����`�I��M�������X��ϑ���C3��`̈�N�8�6���/K<�.7�r�~)���z�~�w�g������ѿ@�a^�/pz���_���v'OLq���UТ�ՏP����[<��n~д��	�����S}Ӳ�G�0�TG�3�A�~���/vI���g�l6>�nw:L�J/%0.0q X�C8$ec8�:�U@K���M�$$BL�*j68_ý��ջ`q��.��a+���9�x����[H��q^��
.��W��o��{�*�ݝ��v��ǨC� ����3�)�yu<r¯���S�\��ӔR`$��*ʝ�p�3A3W�Ν�Tѡ�\3�>��M��A$d�n���d�{
�~V £c��n�D��"0�0�/8޾�$5��z!&�l�qY�dd�c�ph���wGm����.���	ī�П�{{��"�	���v�����H��m�>�EU�H�yo��RI>cVb�l����z���퓵�m� KCΗ�=�ɦ�z ��1dhq��3ĕ�l�N&�������`���X)��N+Ξ������c���>O�{��$2R��ū��9����cu���KP�kg��z�� �z}�����:r�ޠ�;����,}Nđ',��pH8�o�B�-�]��]�qU�若�2�E:O_,�X�D�<5&F v<̑h�N��Å����>�&VQ��s��7Ib:|�����]|W<1�J~��{}�\A��8�˦���I83�M���1���ߝ�~u����&\����5��Jh9�� ��+��$��Cz.�Q�m�(�9A������{����"e
��:,�K��y���{��GḄ��S��~��yO���~)G6�L����.�	$_o�{���p	,���>�s�r˭>�V�b����+���"%C؄��Ug�[~h�=�5��O��G_m�h�#��ڮ���V���Iy����(S�ƣTUiG�Ɨb��������Dy9]?�ָ\ơ��K,�^�:�¶�K�:A<qD�0���Q� #^��6�>;�ܳ��Z�e��c�����)E1~z��3ȲP���e�]��^����YD��5�١�I�?�7S��to��՚�딞m�G�Z
ZZ�!ɬ�@k��^�k��=���hY�[�p���2�;�~�
�X�*Ewb�ʆ��l�ps$��&a�Im�)��"E�O��q�2,����[T̼�����aϨ)2r�@dr��g�ms'�n���%�����ⲙ�Rcc��i�%���;z{ x�9<���G��"E�aX~�MX��xy��������T��R�+����i9���!:ъ�G+�x+W�h̆�һ�D^���2H�ȋ��] �6��#�D
93�#ގ���|���v}����[DU-OQ����(	)Ӳ(sa��`�.̗���    ��\��Y�)�tE����ݗ�:�;r���9��O������k����=s�'�o5E.���Y�����ZM�X\�I���Cl��J��ӊ���W��%��+Fb��b@ƴ�ϰ�';����:��Ob�=�8S����<sש �w#s�v��a�,̻(���k4��kN� ���η�"̛:u���C�%�5P�6y��fZ�g@�~Jˤ�2�%�0�ss!���a~���|��̞�����s֩�ul����qS�2��F4�e�Z븝 �Oy�<|�0eB�wB�2Rއ|.]��Ax�}�6[H���;E7H/����?�O̸{��B�IxXj	�_�)�`7�x?H�0���x�
�5T)�p�O��\��Ϡ|M$��Ȕ+>��~���+#���5͹�U{D��ȅ|<ߪ*gs\T��N�:� �&��O�FǛ*��u�
�^:����F���%��3��Bjl��T_��]Y�}���[���p����>p��(Xy?m��uѢ��ފ6��Z̕��a�b��z{��#����?h�VgΔ��?�V�1���M�E�w�xG�K��|0�L�j�e��b�|)����mh����c5I��m�F^+��[`s7�b�H�bJ��uC������VN#��5�T�c��lx��ϯ���x��f�n�A�`|~��	��L`��؏�$�G�
��x�on�+��������^5�̏ͪv����d�1�˔�"�j�-}@��'��*�bo$V�,D�4�G�<�	�"L̖�<�0*(�&_��^e2�s)��Ff/��6�N�C�M3��U��?��nY�g�K�s�W�m&�^ -7bp�$�zg�l�x��l>�w��	����DXs��rX@����Hn�s�����T:�~��+,�L��G5�2�ˡ�y?�I�I���Y��)����W���A�%�J�;�������bp˦1�l�;XqTP}�+��)�E��E7,G ����ٷ��~�p<��˄;�&��
���O8�M$~>����PrI]�b�=ĠQ���>�Ƃ�PCI٨eH����/U[�T���������2ҞR?PC�)�ς��Te�W���h1縄�5�l`�՞N:*�t4�=<Ą?6� /���!�P��@�A�ahM����D�FO- Ddg!]=��� f�Mby��$x���NK���#��>
͙3�Q�8�Gh,_ʡ� �>�ѩ.�CM��O�����tc��P�J�x�K�Y�]�Jb���Wܥ�&ۓ?���K}�L�����#r�C�'��@�fV�g?�f�1����vnO��)6f�e�sd�O2m2ic
�F�/��*�Dbh&-<���.x*$-:V�L�bO���dW;cQlƒ�CWK���������]�a.�s�����eeJ�,��Ƚ��#l ���W������Wo,���t���[ea.7��V԰$���&b�c(HEb�7�W~юq9�2%���-6{ظW�Cp���3q<�Ѫ�T\Z�"���3���%D�vhd�.�.��_�y\�k�%�}ԍ0�0�qG[��0TmG��M;�52)�2�!$O�S�w�&@$����V?B*�jpp�=��+J�R������N-V��h�QPsZ�-��S�V$��Pa��Yw��I�V���H�F�����cجa�x����ĉP�a��J���HjZ0d�0��B���C���gJ �9��Md!������1�i5��62=��Е�C���ci��ŷ�p��Mj�����'��%o�k����\���ciO�DDo���lv'���N����w�r�ui��%��T^�k|�QӇ,�u�.�Sx��3��lVvU�ׅE���Q"j�.�A�砻��3҇��fc��!d���v9����
S�R3�א4��ސX���͟����F��Ŀ�P�/|]�}��-PTۑ���&��	7��z���Y}���+(�R˩��*#�v,��X��3}�~��������Q�J�*�����J5`%��t�<ѫ���l�=ZV��v?� �cL�@<��M7��0��.���Npxq0T����d6u	=���E�O���(j�㓝ɧ";4��y��Β��1{vKn��>|�sv�ʟI�}�8M"vжw}�]�wrH$#8�����T��m��6�̨A���fӬr�vNb�q�
:*�哪l2��Μ. 3�Dr
�3ʗ�C�H8�fI&9��8o���Lݹ,��R��/���L݃�_��b�/r�V��=e���ë�˻��g��
O����[f:qח�M��;��5����;��!��Do=������#��ٟ�a���b���'�+y�t�۔j��c�4��^�.���i�TE�E�_O׷�]���)q���/��aD�g�Q̙ؤ0��'�Ŏ�M	�D>�P�1���e�&�b��u�t�7����]�R��`㯎u��--�qqD�����$[���k��],ۜ�6��|Hhm���tU��Jf?��
�i�<ު��R��n(�{6ݯJ�RT��N�Aof�n�7t6ÈZnhE�#h�*�y71w\�`H�y��	���JVѕ��qO�8�i ��Ql!�/lGm0DA�|� �ra�x�{gN��Vm��ˏ�o��a�Â�D��-�sc=����n�Bc}.�ЃI���D�5
aF}��؆�~�zG-Ǚ��H^�}�J� K_�{�d�ې��]�㫃N'GU߅?�K��"ъܑ�U�B�r�K9�ց����c�?�K�)��<��iS;������ ��������Y�ߣ�/�e��X����1�EptD�5(��
���_n��?��զ�v!�L/X���sn��V:�*o�=��va��z�!�%�D�ts��s��sF+�p�'��I�fg6~.�ы,Y�^��i�QU�h7��������H;�#��^n�����Z�#��f���;~�omם��u��o���ŤB�W=?B�;�?	�vA�1^4�'��a#�5��֒�`6���l�~YHѯ�E�%��/�s��E��Nη��]e����:#�{���=k!u���r�!��[���H�\��hwx��E_�BsR��aO�W��)ۮ�C��j➛��/t��ؔ��G��I(����i�@)Z�T �ucu2�nԴ�����Z�!~����bn���7���k6{,&꜏ �˄�
T���ʎ�Uu�Ď�1�2�հLz�H�!���L��%9��~)e��w��
VS�v�\�_@ı��>�es[���8gJ��&ۆWiOF���M?���$��t߃�ش{T��o�oۂ)��Z�g�����jS##�V�<ɏ2����V��
"z\�+���c���Ik1l�k4|l[�5��������X��'9��h�q
f���]�|�{��X�c��-w&�Y��s��:��� >�Ar�o��0r�O���
�9��P�vt�A�ҽ�#Il��"^	�[��w�!q�P�f:�JH�7خ�,���'j4��]�{���,|	�Ң3:���A��]�a��G�I/��6��~Vϖ������Β���Bi���tT1�W���`ÕgӫB����uW��f��LR�Tc5��n��2�լ��$)�SjzY��)�/Y�ʑh�`{����W���K�\pE��	b!Է��paWx��S�|�%Br�N(���0�³_�������fE%\�U�5~~���r�[�y�7�� y���Yò(Q���. ��ҿ�P�Pm<S-�ׂ�Օ���}���o8|�EfI��W���zC���+���(��6��7���Km�F������.�������z,�! ;�}�S�h5ۂk�J�F<9H
w��>�`G��E��5Pf>�����!�G�[+^'����tL�qyGv	�0�X��5%�?cJW8:�!����GȾ��ϵ9��)��L��?J�SoG�;E�H�e�#���Tp3cEn�i8w�2�艤�yy�b����>�#&�I����f.�f�����"5��&T���a��1���$ҤM�����I����λ�~�����s����@^~�N�L=�T    �6�x6S�(Ś��3���+-~�����e�EF���A�ַ��N���e�3�Z�:+���(�wU�&	-��:�Q�"�����X��I�Ʋ�HplF�a%b�7��ڿ�!��^��W8x%IN{jT��ӝ����o7˛ �%)o��]͙��hN��s��Yp�L˹g���I�㜰�y÷��6��(ӞX��SR5��k�V�	Ӣb$�����r9ȿ�,�{�#^��G針2ߍ����ջ:��$RЧ `B�'[Q�jG1�b�	N��H��	�(�H{�<�s�7C�ө*Շ�\���X�X����.�6�,�#��X�HZ}G��ֻ%�(Fi�%��lSH�d{�s뒓����i3������nH�%������z��7��
a�977���W�#��7�Z�]�P��"׿2dM���rI��7/��>�P�ES�%+R�AKQ�s�hL�T��e}y��u��K�� j&���_��ܬЙ�c��e�ŧ]<���9I�:�С�z5�|dM癯����>�ð���70��;8K��>�'��;L�n�����+���#C$q&M��� D�#��� �{����
���c��`ĲF����&��C�.��@Ԛ�u��fND���7j®g_�˾��g�Y�������2i�����Z����B����L3�� ^+�^4[��^g6�oҫ��H'�&�����]C�����X��l�jH����h!0^-�t��y
�����4�e ]�+��\���c��TsK��/�a��;�4��I�i�-�`�����s���5��ahz>�������	cWÍu5沬��=8��-oHt.s��p���h2��A�����,ܴғ�m��-�uR.��Z#�UEߥ�^S酑��>��F����#�6`<P�L2���ĕ��!�ٺ� N��$/��MR^�h�Rg�d̰h�*wB��Ɠ���avn+%����	96�B^�T<ǵ��̛��s\_�W�!�~�$�$s�
d�C���t�B(G���H�)c9��[͘�6�.Y^E'Ep2���\�c8��O&�^�a����m��e�i1Im�
�<��0MN��^q�|�P����{�Gl�v�b^m+9G���=�7p��N�Wbb)��_l�y[�L+���哽��������i���\��	zi\uH#툳����bD��n���K�:�pUV �c��
Y���|�d)��L�)0Y.��N�Q&_�WC}S|T�Z���p,{��9���#��z�V�j�?������'B"����EG�8���kN�7�a��e3�e�I��-4�5���;�w���D�l�SY:b2�)߽J�4m�_�-�Ł�S��M��j1ƾ�Τ��%�L
�:ñ��g��S�"	�,cM�`r1-P��W�Tz��}��P��l���80t�J@�[�Գdc<B:v��@ic.��pi��={P��
�G��_a��������ٽ󱧢�g8Ž'*��GtvX��hF��V7kj��{��1�<u W�۱��}��_��?���ި��dFf��y�Ы�
�Pd-�X�L�Qבy��R|��/n6�� �j�چ"ŵa�|4*$"0��`����w�g���?|���%��,��:�q�`S�:�m��5�0>�*��Qm��BQ��Y�_�,�U҅L_O�f4k�ɦپ�=�`C�Ph���;.I�Yj�O�"�?}'�xɈ8�;�~��T1���������S/_���r��������,�((@J��/{��1p{��&�����_����%�X�Z�oD�ޱ���8.:�p����c�Pe�ԽAU�d�	%��� �̞�hP�|�X.����G�ZH��eE�D����B� @��&CB1�T�c�j���$Z���4W0�0�y���iEe�%�U�-4�r)f�zkɳjFW~�_�E%S�FCU�ϩ(�^�ڔ��+J*���b%���~��xޢ"�"Hb�|��0K��m(}D?�b��@�c�����U���Q���l�z���j?_���_&���^2� ��i=O�Rj3����8���vyEzeك�Pk�V̝a	���xP� �.Ϟ�o�5o�#o��J�h1O�*[	M����X���dN�F,��-z����ww?�e���mJ¼sxz�:+%���p(霨�X�(�%1�Pl ��$�QJ��&1cх����9�6 ��leE�6Ur�<�e�=��j��2jr��k�fb���@�6�E8�a&7�q5̱�4W��ı�t��n,$_e���g�P����8�m�{�����A��Z�7!*��!CB�{��O������FQ5H��/,�b�Y�At�|��"����ܮ0k!�"6�Mk�b�hJ��n"o�UR7M�J@���Ac�Pv�U����� ��-��l��˃j���T ���Ñ#�NG��G��#���a0&D����D�˛fl�O����	r3��E�E�Y�|�B"=emԵ��♯�
�^�K�%g0y"x����q��n=�\��9�9���C�l�dLX�B]j3���p1V ٚ�����n�i��&0De[��D��̸\��;����p����Ƃ�sqBm���[ZÒ��d��B���	����jt�r!{j�8��~�́Y���M�f5�/�F��6]�L��e/,��"�GP (��%ŋc:��rZ▹�����2(aO�!w�^��e��V0:�qT�����ęg���x��>�lf����[x�0$0�r�ٜT������͎ء'�;������¤�_n��q�������O"�E_p�^�a�m�:AAGf���ch����"�S���Aty٬��bS@�֙:G#>?;<�"d��%�RB�2���[h!���d���L@�_����hr�ϳ��-��׳+T�F��]�>|3������WO��g����=���Fɏ�n���a��%G@�� ���v�2'��!g*�4��a�]9�^Ã�xS�]\hykv�����eE(sb}�^��n4F�:����c�6tDaQ�S!�����?ak2hPy*���}�`0x�)���TT�9(��M�d�&�Q������	�fPP�Yȉ��r�}.�W���&���c�G{��,=29���5h9z�����@��~M���o���� ��M�_���PC����Ad�)o-y�DA~
)R���q��<�n\0�
�)��lm����hO�"���T��������l�
����ޜ�</PCF����ѧ78�>`���n�����s"�C�F��
bkeVe�<%�f��U59�ܓQx��YQ�C݄�ZE�j�'.����!glD?�}0����x�r�5��+�X1�N��H������|��8����8��ӯgV�%��D��p�n粼�á�(�θ��ُ�n��|ih���ܺ�G�'�:��5��Un@��W����Y:C}��|��QϨu�iy���3qI�gW뻟֛��l�Ľn���z����
ɢc)���hŁY������������`���!��4�w��!j���A���f����>3�d	��>X:��@j'�l:�c�Z�/��φ�*��t��g���'=G���SӤ!{��B'�?�[U����Y!_�5���ٶ��g��#3Fi7���[8����L�x�}M��7��Ms��Y����n�V����Nj�+�5D�{]b�Ȉ*�w��(��t�r� ��
t���!�a ~��_4�����;�Ѩ���dS�)j9��r��Cxџ;�.K�y��� ��]��Pt�'Q�P��ܝt�<������lP������N���k?���7����p�W]0gF�"	m{�����#�M�?�Aƛլ�C��"�rv�܉���$�c� ��o'-�(��KhD�֠x栔�6&�J��-X`P0�U�z����`7+��\�����t�S��m�L��N!�bI�J#z��Jf�Q�|W�&��jD�~�qwAhi��C�>��
����\�,�Ex��e��!�ē    ]��B/�����\I����zg������-��r�zI�eH�� 9�+[��T�2+#zã5�Qțn�-�6/���=߫�;�2h�Ҙ����F�^��D���D$/DS&��裛����;uҾ�vU��m��p���9�7GP����{{�����o��
D�c��`�*��/���r�t���^��c�	hJ s��
��R�衄=�x
��ӚQ�5`vޡm���?y?qw����}P�[�Q^9������Һ���`�m�]%Z�)y:A������s�-�0���rE�\S�D�O��Ӿg�^�us���(�n�S����˪�۱`�Z�J͍�ZG�9M�"�:h6�C�c#S y�s\�.L�e`9��r �",�T�]�-W����L9�x�!rEx.D05q"�ST�)Bv:Y��*;�rv��rh,y�����Ӫ�p~�"1ᓪ����T��Ҏ8�s�O��2�{�M@ۯ˳k�%�zH��.�x�Eb���x��"�9�j�O3��0x�Hf��q��8'̎둛i�C�KS�heKM\
���_
�@��
����r�9���\�K;ʡpؔ�G��T]_�W���/?a��2IO�p��'>�b?�gU�]�'�W��TY�LpWIA�ʏq���"zQ��#�$;�E�9(����>Z����ָ]�����g@�~�8��c���	*9ȅt�����t�P4�:P��Bb��y9��܃f~*13Q�O��\Ȃ;�W{�@c❧H��i3�|�R�ƜHK�]�u���Kz��u��L��G-���������E~�$��ɘm���<���f�����Z��U@!iv�ƴm*g��\ȹ��8����߾]7�}�ݤI�PX5u���0�CMQN�Z�E~��h	9��l~�����3oi����r㷼�hj����Wl4���"��@]�EF�*^Jâb	���Y���?f߿�{�|����$a��6b�����	�ޤ�׵,�z�HQuNOkI��i �A�\��Tf�T3�a�"mia���������&Seek烑M(Y�Xd ��,=��-"N(�%G!�������\wMq�x3��_���E�R��Y�S�}�]��5�>嶔��i��r-��duT�1�A�y0��ߌԲ�?X�WAuW�o;G�g��N�����{�I:�L}�G���G6őP��e�4�2�΄6G��$�H�H�L��\9���Q�/%��Tf��Qe������5����-�۷�ջl�[�j��&�/��<�T&mQa�8�Ƌרj<��r��*�WV���q^�v8D�/2H>��>uՆo�����B(u�U+J0�M,�0mZo֛D7�(8�6���D���h���3T��A��h�jn�[N��p�8sb#@M������h/(����"J����H0]a�������1�-6�X/�ĖQ�b��J����9�*�������J�3�O�
X��۝�����4�owHY{��=��co���Q�����1ı6�����&H���.Oxh��1��3
�&�bIYI����[�g��I�:as�S�qX\�����E'"��@j�����H��6x��h��CiZ*����������������ϊ͕<���O�S6u~�">��.	Y�k�6	���<�9��4b����M��e]Y��%� c��e�JG����§�� ����Bg�|�<��]/f���\FV!�]]���Ԃ�^� �}�ȫ�94L:l4F>�#FEY-�w7x�xp8÷��v(W����>�&)�\�ْ�p�=,���%֭�5b^�|�0��\8�C��&�l��1ޙѠ�=���~�+ͅ2�k�Z5�J��-f�M֬m�A1��%��ٯ�}2�U��X���� �veÑK��^��{��*��-��	S�BL��~������Q����ea&1��� M�n9�}�9��x��O�	�΂�C<��.0~�]�8�!����S���S7i���*�t�JПfd/��zѬw}�E���ܾ�z���S��|�<5���co�B�۬ޅ�H�مy�r�z���7�������P�T}�|@�|�u:3�U���+&�bz6}�i��9��`��(��"���}s5]��,A��u���Y��h�hӓ�g;m��E��4���~�r.�$�^����kG���
#����=Rs�Г�3�L���NA����~�h�F0-_���(�!�-&�[$�e�+�*����(���j;���2�#4T;�T{�:��ϰ����w߫��g�'���pS�0jF��^!��_(��4|UC�J=��꨷=�4� S �
~�Ԁ�J��gҲ�@qҙȣa�*̻H�Qc "BH�7x��܀�=h f�4�����>]�I:�{eS͵�
Ų�P̌^(�R :0�Q�\�����_��di�ב�09���c�1�R�ô����G�������kħx����ջ���:d��|�!�\N5U�z���}�iL�VK5�[�q�7�&�4�%� �Y���
�ŷ�ݻٜ�XX��Y�~7CP"���w�%���<b�Wu\pRN�}Rdl�`�L��C�L8`N��<d�7q���Ǹ8\:���0S��Ua���W�KK�BCG�����1t$�Ѕ!r��H�>�VB#��W&�T�{�N���;�����Hh�)Z�(�o!Ke�%u������U�R$^�m�2���Չ��.�U�>���Ae�=�J�J��a��j�^.��N��b�P4%��֝(���^MS�'��%) t{Z'(R;�J5mf�I�|cm�R7���C�2��0T�T[�v�CI�@�Á��y)�8:�1�+�/)����[�
t�l(s	S���N�-·�NGX�C�����m,����s)�hJ[A&C����2ǈcPG�
FIE@��!Ճu�?S�/���d���ZM�tlҺ��GTz�m��x�Ai�dRi<���[�j�k87iek�	(��^ÇB���g�L3�F����!©4�����w]�;X�}x��a�B����|��k���!/t7�R� J�?�����Ҟ�:����H?�L	�r�v�V��GeO����h��©�گE�#]E@�Jp��"c��bP-u1{���a�گGI:/L4j������co~��>&��G1!0n���z���ŃP�#��!ӻ���Ϟ������Ҿv̩�[��G��)u��Y�=g���o)�,�b��2�Z��>m}�Pgq��b"Svش�,����*�-ִ�D���a*3d|1�>�й�$x+�s�7^Z��e}�@z~��4��(�1�-���d�A���^ٹ������Me����2ޚ�������y��]	�ʹ�����ӭ���j������z�o�c�Z���w܈�7^Z+��O�J�&�?�T���S®}	�\�GB�H7'�r�~}�}���a�>���Y[��	�#���l�$�]'4C@ٍ7f����Q,+G��oG��M��F�9�'�(Ӫ���1��@��Z�Ǳ�*+����e���Ut��C�ޜ�ޛ4�/гh!4͢(	��f��Ro�39�n���ҩp��t��9�q@�l�$v�i;�#��U"VC�G&�P�u�8�O�_��ޣS��������~{n�,��e��[8����<a;?�Ǭ/��������26=ց'�ĂER�*.g��ĘW�(�:����߭�"�)Z;*�u�|�b�i�8e��vP�0��8�ҕ�k-P��M\�<TZ���z�����g�N�!�l�����Hp~�_�hvP��l��� b��c����n	�V$dz��% �#Z�v����
kBi{_MA�ߵ@�9%�UU$/�����?��E6�ns��o��J��S�����&�����h���u6�O����;�A���u�3)�a3�j�b<�N���������*ΨϷ'���p=d��~�o?���/#r�';����a�\�+Y��"�ڬ31�    #}�R�c�|4����	J?����x������%5���~�F���uv!�%ظ�*F�8`��:����� =��PU��~���bP
)NɃ �o��YD�ao�Tj)7�Rp����";�߆v �<��{��f�z:���Eٟ6�j��ȏ�Be�j��\�7���WLdMN�b�i�����ng��CQ��*r*6��@e.�<?�Ҥ�[ЗiEE�Dm2��C��%x�n�k5�I�����aa�(,�]�\�x�OʰL%־�?):(��/���TY1B��r���^�ѥ��Ӟl�	>[\w,�ġ�3곕Z7��B��8�t5q:��PU�t�J�q��4��Ks�R[��"{t_���i�9�D���hP�XׄB��I�ٴ%���)����@mpsľN>�-��TI��N"���V�S8$`���@���b4 �(r7�ns�C-�Z�9$���OEG�ngɕR�ֳ�u��B���r��}���r?������{dE����wE9����a�oج�8�_�~�lg��;����wB���z���n]ﯛ����7�b��G����ś�������}}���م~p��M�B�q������ݟ�E,����_�QZ�&�{{1�-Z���\}�������!�HT��Zt��-�n�������_�L�7����|�U��8��D~�"F�9א�)�e�3�V��G��A	��t������n����dY��U��fr-{8�@s���Bǀ	z*=����C� �f��f�qg�S��n��2�o;�1ǚ�JiN�3��8�;�"�)7�㢰��A�a~�3�7�]}���ܘ�ʘ�
JBd�x<��fSdÏӆ8
᧧ a"���	W[�aԨ�RG��,��{��p�;E��w���NWo�t>3��������^@���'��cZR~�#D���Uc�t۫�U�1�^k8���+a�O>Tۙ.q��hZ��7��K��!41�feJV�a��TT��SL�D��e�"L����X��ׇ�f����c��ҿ���z-��-H6t���a����H�$���W)�?�o%:��WU"���3@���-$��hC8N���vPj�����1��Pʡ%bhY�r�f{q�Gh�����1�X�˔��������nS_}̽R1�}�b�[�>�����F�7�!2���������a�e��BAX�p�\�y�~?.7�0��W�L�tla(�i�J�פ8.g<(>���s�2,`p��Rn��t��o����Cr!CN��P�Ŕrw�%<��Pʈ�MF-���R�8��b���z�<
���:��^v�gm"�u�}��.Kr�;U�-��8�� �Ǥ����':�G�aj����Kp-��=���r�^��<K�nxsP&Q��OK�:EQ�k�/��K��e�o�Q����ܛ4�qdi�g�_a}j�$ܩ��SV�	�H�����!�a��;�t2�>ΡO=�9�Gd$[�����5�ؼ����-3S�f"�j�O���ۑ���p� �\�ڛ�~�6a�5�	�N*O&�K�p�!Hu�U��T��d��|<,�y
6�'ډ�=�8+�ì�:�s�!i/���=�)�}_O9�T�-��Ʊ���Csx��F�)D��J99Y��H��Qw=Cb��%��2���[�Z�)�Z�Z��#ڵgTDJ0���;]ɖ�����W��)�/5gZ	/�1		�c ��!�R��ƥ֚:�u�\"{�/}�)�Ep�M&XCg��Ը�`�0w����M
N�z�
�š���x�E���<s�a��x�.>�on��/M��Ձ�իf?X-�}������n���t�S[-���� t;h;��[�='�Bc�V�43�1,����Yz�ahr��>ǎ��Yz^��V�!�A,L�nW��h�c�(+���F�a���DE�ք(�$�b���;1��f�+�E��E�����@��۝�p�9k���p�O���E���S�K�����ԻU����hZ���������ñ�)N��G%��H>����"z>��0�Bd#��q���V�����p�5Vܟ!�/��N+�l�Y�$j�]�i�n}�N������2oP�)������o������2�_"?����l���X�������e��Gs��!��y\t�Z'q Fڹ�&L2:��.�˼�}R7�O�p��0��{TN!��iLخ*�)�aRUOFj������}W�s QBE�Z�J�&��������E��{[�c��c��%��8Oe��!��6�+��k{�X/c�B5�aJ����D��yfSD%��Mg��+�*�ث�5�_��_��\b�$��������L�Rj����� $�+�A��8�1���6#�\��n��I{�v��S4�5�}�6C+N�T�4m�a�z��]P����a�l�d�o	�G-�Z�M�IpA;�,�eJa���T�j�.�0����Q�ި�� 9��[��ų�c�&mHQ����G��L�>�R��3�e$���(��b���w�(�����uJd ����4I����\8t LO$ �@���PC�F��gzn���*�GQ��Z�<F)���~�`| =Yz�Qߖ��.t1{S��+怳� T�\h��ј�I�a��P'�Di���ց!E� QFLB�WUg��r�`$�b貉�2J`A'�B���!l�ݲ��*D��������JR�q�+J�u%�`>Mh涾�����r��P�_���ѱJ�����!�WQ����OP�nʦ�i���#*�ʨ�P�Y�����D�~-@���t!�+����E���+yrT�%�b),1B+CIy,��[2�Y��uKR+��*WT�b��))�:�������h�>�L60���"��+��ӡqɃ6k���ͩm�����p���w�k�v��� W��xL>JٽmD�nО!��fТ(�^��T�$�WOc7���;�?k��V��)4�b�� ��;��㰶�0LA�'ރ&���D�/����>p{a�k�aً���m�z��Vc�B~a|��c��: l���$ݡ��l�`�7�`�}�:VI�-5p���3l�ݲ�������֪C�����L$�;?���`����'��t���(�A��������C�~ѯի���,O)�Eܐ�'Z+²����7�jK�;[)ݾ��M��"�����G��KĚ&	��n����i��b�ս�T|�Ʌ2M��,���8��q3-ؔzB$�{�_��C��O�_�,����IR,��3����������N�В����/��r&:G��l�͕�>- yw�"�v�&��L*����F�:&�/�5`�E��|�8��L�+|�;���1�<B8�Ty�,Ewb��	* �>��x@ĳ���Ѭ� �o�	}	�l�[�U�;�Hn
Eq)�:Y�����k{����7F�/�������X������d��ڈː
!-���zW�_��9완y�I}�-`lB��r�0��bN�H�Ӹq�N'�$���Bo�݋�R��=�Rę���[��NHC0#b��Xt���q�)m��J��f^;*q�z`��SkA���p�Q��CK���:���+�y������<��	��<./[{��;�mD��OiH�O5}c�e4��B�����MrP�B�r�^ztϞ�9fU@�Ο��w�w�����U;CkQ���y��i ϡ�n�i����7����^R�6
ԓ�ʀ�"�u�_ɘ�တ:�A`(׾�8��&�D~b� ��Ry$��y@ �=6	�]�n�}��c2H͘
��$��Q,(�"��:����Q��IN�1�l��G�d�m�:�w�ĳT��M��������C�V��{
Dɇ�7n|����&�w�5m��-�1y�u�����W��v�����"Tu�gb��n���9$��Y�1��M����u�AuϷ�x>�4�w�|3�fx�kZ LJ$�ep�G21���	ܬq�o6[/C��ÔoK��ov�o��e�S7)|H�8f��vW]���3�qx伛(�3d��|���    �����p܇�b��r�SP�)�P�������5���>wAS�{\��b��N�H����#8l���\J3�;�-I�E�-�n'4�G5�@������ˎ@B�̖e|	�����@�]��2IN��RԂ�?���GRV����H���w�'�J
�AX�����k˾"x�������K��7�ץ؞�!B��X#$�I	6
GE�~=y�{�f]f�E�c� O�iXn�T��O��Ub����w��M6���� sFx8�5^ס�{u����/�d�M�`d�'ˢe"�N>�2����038qA�jE��+�;7���BX�t�x�`b��\i�Z	��d4x@]xKR�kH_oJk�l��_)G��������(�0�\�;��6/ri��d$U�]��X���g�VEH�v����܈��ԍ�*	�'�1�ZNv�S�5wY��N�9d���	K1���)a[�Z�:���[5�狟��Y���CA`����!'�d�+���(O��!��pJ�+X읮6	�i�/L��@*�����
YJ	%���wd|�.�M�P��$�G�a[���)9�ʳb��Z�L���n�R��N���L�rE�Vͺq�U�5N�@td�J��3PbQ����մz-t���-1��cP��G��wl 	�����+<��:>8�������psӬ�%��2c��[��[��~�	�JC���P�>E�	쉼�-?��C˵0��F��s/�e�i��vJ��A�X�
�q a�sgN/f`�#�Sf�����D8f�Q�{�T'��Z|Ld���g[S�Qˮ�bw�x�������$J��e u[�.��a1�9�(e�y9��|D���_ӻ���R)���Kk��!O���jU�
x'U���o��5G����%(9�O��2ܘ>U�E��e~S�.�5�+��5C�d�uT���%��[���t����8g$߄�(���@���i�Y����W<�0g);S�)6��W�>�Ήވ�`�6P�T�:iJ�:�����-%aE?�:�х|����$�ǜEy�Tz�l\��fYB6W���N�.2fȌ�s�q����L��MJș(v>�/o-ONi���ܔ��)�`�<���{��M͞���H�l�UC��6Y�i$w/��J�F����m�9���wPKrG�t$��&��zm��ckq��*�@�s�d�\�)�a��Е�S���DbY�"<+t����a�ѿ{�y��\�7���G0d`ߺ���si�u=BǦ}�i�<�s�`���Z�H֏i�E����A�?�W�?*X߅��I��b&:�o���&��`6� �n�ͧ�6$�[wd�H�R�x%�(G��N�\�If��c-�3<�И��É��S�����y*�/�I��#N� �'|�0����0#l�E�}
��;�]������Kp��w�5��0�Ǳ%�}�҈�+��A���*�a����ၜ�G���WPz �w"1AYh��S�9�4���z�ݘ���ҵ�T���'q|W���?���������WOϫ�����ޜg�+�PH��R# 0���~|}��W�_=}�����U/��cu��!�¿C�e$�i��vє�P%�Q�ГfI�Dpf�yìB��R���Ǥ�����b��h�m��++;1BPIٝ�rP��Ps�Y�tԠh�JRd�
���7��vW�ji�C2�CHF�H �&���[�����]ȿ4��:s�T�112�uu\�<X3�C��8�ȣ�Ш�ܨS9���1��ܯZ�7|����XTs��c���!�Y�ѺYa�\гGG��a�w�Lԃ��T0|K�z��$���eb a�␦`��2T:��S�r%�B�ӕD�U�D<a�5���ݕDxKI�)�+�ʼt4�(�/{4c)�E�D���?q�8z�L�BEr�
�*HB���-�� ��E���B!1�fse�(mp?�u��a�x�r)�����{V�)�v;_�����^��ڙ�no�˪�qP����m�qa(w�K��~�����'��9�>���H�,!�^o�_7�+��|8d�O���4�fN�z�F[��~�c��,�9F�#��_V���((J�?*\E6M�{n���ĭoW�J��l�bއ��=��BJ��2^xW�k�S!C�f������N�5I���8��<�C�0�2�c�,��Y������7�Q�M��������9xO�Wأmܺ�v�]��$,It����uZy�M��.��-B�XJJ�Q�pϷ7��
�a,&^^'NR��4�ȹ�-E�BO���Z#O��x�7h=w���bsS���R�h�?4��q[�r#w.���^ c0w޽k������������U���9l���)wP��{������BVI\�C�9}W��z�[V����f�����<��+5|�������n�H�7���i�K�-���PQ��P`>�P`?ƅw����<�f���s1� � ���aӭ>�p=tj�HdJ�������Y��<�?`֔��Hx�+I��x�ݛۿ�VR"NI�$~���%���r'��g�љ�@��z6��\�QU\0Ҟ�OV�FL��͖�I�g�-	�%씘n�`�V}�{�hJX*b�*p�d����`��us�U*��}�C�<s�}i���ƮÉL��͋֫]`/W�Y�&����E ���`L��"q���E�(D�V���	��m������iYW��t�d]6J(��
!�U���bZe�/�b���;R�xBv~�#L�=p�r��z���[G��h��G�]ԉ�SS����u�✰^HMT:6&�{�^%B�g��$Q��}^�[�~�bG�.Aƃܺr男9t���@�禌��j�G�~�a���  ����|���-�B�k ,T�̃X��2�$�sa�<"�A��U�Ub-CJ����A���}��C[���'�_�q2�зǬ�[ȩ&nӶ���M�*%_a"�+#�)L�!���ƶ׬�!�f����v��p�ݼKp�=a>6OQ����i�`~�``�a�|��(���"���C��-m/7-�0����O�ҭK+㋇��Å)|�A22IUM/'s�k�ԝ�*�\ֲ�"�� �m2�N�����;o$_mv#��{6�[��������Ti.8�����V�����6"�� �Ә	i��p�"s�S�~]�6�N�J�K}qQo�����`n����&�mcɢЄOF>8��n��U���(~G����
��Ϫ?�T��Ip/ B���m�É\-��;����"��F�
����r��1X���"�pL��/Y>�����je�%)y����qt#>e2�v���ݤK�������7��H�J����=z⅜ہ�I��J�D후P&��IGkXW�'Eʑ|Jp���(7�|&��X�3���T��_,?8؎�#;���A��_9U��F���;8�T���.EQ�B���/���-xw�Sٯn�u��T�s�$�A⊐s���t��K�
.+rp?�}�զ/��Jʭ���Q�H����];13�8�{��G�_`,\��AoZ�P�@��D�|R��,�	�:"��"�U9�(@H�͎ؔZ���fo��ךɯ��毹q�άB��%	>b[�st��P����Z�'Vt� ��PJ�
�7P\�5����n[c� �kĂ�oL2�dH�59&sn#Ҙ".5LV�	[+��.ް6>N"q���q�����`�~�� ��b��΅��v�I)������Ѓ�L�y�{��n��� �ʂ�H^�B�w�.@/�6���6>
�d!���6��J e��������չ_��Ś��:�<���Z�x>2U���Q8}���Х`8CI9����
і$#�&k�{��4̮������N�#3�i����M �g5�s���#�ڬ�ys�Y#0������1x��vB�R�[�ѻ��Xeɪ��i�a�*,�J��	Ԧx�c��;�4����zt�@�k�	��7+��l��ڻ����Ni3�����    ��%%1�O7	mҐa�tg�ƹ��#V�C�U�ׄ'DE���T���_FM����D['npBo��?/P���z"�m�]��q	K��RFO�>�q �bTj(�8*�BD����%O�L�������֗W[0����G	+�`��Ӌ}pF6Q2�2dn$9w�yg����BY������qma��3�?�M�B�R����8.�I���z�u�gס�݀�}��0`T�A����.o��kҦNI��|
�m�*����%8�E�ʰy�i�L�+ɴ��S�G�u��_P	Lr�b���߿�ay�_"4�з�%���b4�do��7�]_,��.7_o/�/�������
���D�hw�|r����-x.M�պ�o&��̺b>Pe(4�,,=�o%�Ē���$����K�����*�W	6]��#��+�?�hV^���}���-¢C���E�M q�;k�O�%�����F?~�5L�+/��Z��K�"�5�g�X�@�c�scI�2�
�s���p��~�!�D����7Ѷ.�h1��>���	A���
��}��ǩ���薊I�9,�m�1��Y�Ĺm�P������"2��NJ���ͱn�篺����%��zu��`��n�&�������@��)u�4�	ދ@p����r�T�j���4e/;�1-���q�^r���A��-5P�+tQϐ�.q��X^�9��%^8v���AB8jSl$#��x�4P��#��ex ������up@�(�H�ͮXV4<�6��dd��jkO�n�n�S��ҭ쎉z&HG1�"�J0i�'�n�M���e��RS��:υ����^���M�/G���\����^2�\8Ӻ��]����L��qX��5"�s;�.&�G����;�Im����*���x�F%֠a���]��z������	�.�=R�0/��廗�4������Y��1�c5�Ѵ&�U�z���vy��~�6�>H��	�V�W�ͨ�����(X�a.��(�g��Qt.�wN1-V!d`�w�mq=R��=�����Є�OF:Y@G��V#�������ӑ,�+�rZ�F��pm���� ����Z$w��fv8n���v�M�(C�?�	�YtC�^�تz\�r�@`i�Pr������j��r{u�[y��S�����B�5��u��A(��;�k�\ٶ�v��v�e���i��}�{��1���Yl���lR�&���~���g�I��5�����j?�X��˪y%�CԫP-�gp�w�O�$��-�X��W��t��S����9ۜ$�HN�O�M��L��#�K�}��W�/���}b
cd����DJ��O�ae����n	A����e��J���	��(�$�o��F�q�ۍ�.���c�i�,M�1YCo_Y��,��\�|��˦l"%�:$���͝���e7�l�!qS��m�ä*�-�SRr;Nʭhr��4۫��8f��4S��N��*�w�ܩR?�Y�цef0�F�Tڈ�F�M�]I��4��+�=7gtW�������>����e��L�� Nzm�����j������*�/�Mi!W�Q�ffc�Zd�1\w�+c�lS�*5&c*">j� �3u��G����S=9�S�a�����M��Ԭ^=ڽ߬w��~�}���K��}	��:i��w���S����jw�y��Y_-.67��ۡ���x� Y�.�e��A}|��@y��)��Y��{��B��6���GL�6�֖QY�q
s(���z!8w�/����E��[l%nx�@��@w����iq�1C�y��[08K�l�m�t��X�}��2��#s�c*|��=D@��@�:̷11�ֲD���Z��t�(v ��5����Xn~��Q��H���s.�F�uN�����@)@X2���z/�	�^��{�g
��䮻�r�*�t�PZ��!�q�`�[?�˺��Ǝ�;����P��~u>�d��~Ni��u*m��*T0�O6���_�g�L�\���D1�ձaBY"#5�vW�����C���Y$�+Bk01�����Q�vH ����?�ܝ������q�Q |]
����R�w)�GzQ�ou����|
��`:C�"@�0�y{��8�&��hK!Z�������ʌi�z1bP�m���t�-/��,s�֫��R�t�������z��X��;���e���o>������P�Z�<˯ӝr��׸+�㩜z�p�^9k��5�񱓼zc��Ӵ§�m��f��5�����������\E��Wq���n�+$Jā�d
n���".xki�g��{�0���^�Q��@�=Jc�$��V����a��'E[mRK������%�D��#����q�hHǍ���o�;�(�_����\�AX�3���c��BhHnCڭk��uZ��Ȝy!�?��݋�#?����%Hh|�#��ųV̈́Rq9�D�!����1S�J�LڅRv�ZfȺ�������f�Z�"�@�H)��4AaOL�^4��w��f��:� (�D�c��R0��ub��x����V�mj=�卑�੐b�r�J/D�J��0�C�fh;�����R���	�x�A���M:�/�>��_V�w�D�C\�$�/�ԓB���L��s1H����X1��[	�$��O�>� Ny�D��gp1���HqQ��RX��0�V\ g���|�ywS��^�;[��n�Ud�ӭ�>c2�h����|l'�r����j�;�O#1�Cl��Ż��/J�F����Eж�(;�Oc�_iQt��3�&�q&�`�5AL�ݳV�]�H�o���1^�[���b�卣l `�)!SߵI��h=?���zם��+	1�M�r�Zo�ai����fs�J�1������Y�-{�mP��́;`��eI��ȓ�H���>2%��I��$��$�-���u�~\� N1�z�w�m�i���r'%f�>�CM���)(+�Ѹ6�eSY�� ���`��ˑ|���!j@$3�-�=?9���������E|�<6[Ɩ��͖�B�7�/m�[.5��̝I)�
U�|�W�*��6�;��q\���7��(�M�zp�L�q>o�O�wkG�S��D�&�NM�¿N�`��9&�����usOj=���A�I��Q����_K 燭˂~@��W�f��7���%G���1W0�<s��6��
24
<��c�^�r����m��V��Q�6�aT�9�������m@�$��g�8}Wf}�~�Onn)]���|�����@UcSp��0QÚ�������Em�j�8��j?��Y!o/6���1��h���/�|����ûӛ[�L�%[��T�3\���M�禾����k�C)y�S�,U!�:�����At�M��B��lAv@�"G!@Ԃ�ă�:��d�h+�4$���M#�<���9dWu��p�}G��T���+d��T"����.����̀��r�_H������k��}�ɠ�y�Wv=��t���̐g0G݀W�Q���h�ʫ�4����T�Һh�B�j��^M�%oP6yHCiDX4�ꇱ���FY$y��:��fQ���u��
E��s��q���89EE��^Pe;�VL�ʚ�?��g�m��眩XK��쓀���qS����	�pD6YS�������A����8�3�S���ffN(M-[p��j�D-��p �է�������[�D�Ճ���D�{�YX*������G$*�\6E�9�n�oWIک�6u�f��Һ� 􅆪?j��}���\ ՚ ��8���>]w������ ����<�z�uK$����?no��q�Ko��{ȥ��X��J���bְ�sR�cJ�"Ӣ^�fS��G�񣧅wJ�xc�S3�C!����u���H�F0=8IL8'I���.v��e c�ʟמ�x��eiz��~���/�`�!lV��:�7#6ζx�s:Ի�s�kvg&��r��k��`Z$U�U�0�)ȱS    :L�D��敆�k�Mci��mµ��AF� |�?�/��y����\0�����ܢOj��z� c��q�1*e
�&r H �\`��>�b�Q6��H;�|�<8Z���R��Gpv�$Za�yB!��|�����˄���zy��$����!�W#E���@�����O�.�i��s�('_��|�}�c��2�nB��4[O��,�煂�����������v��B��*\Y�<�#��W1��eh@�� ��x��Nl �R��C��$�,��*���m2�������,��a�=q6�!� n�l�Sm�3�4J$��M���\ >�bTiGjIK5�ȑ��D��\��/��8������
=��5G������y�s�Ξ)�l#��Ԍ���J�S���z��
B�[�!"���Q�"�ܝ�/ܰ��*A��m�֘FS6�JPd�K�Q�d�Ӆ�kL��Q4E����ʟ.����o���5��!Z5p'T�����2LæG�JL@�4��ٟ_����%L_Z3]�p�eE�Xpb��	G��d*iA8@�`��!����>-��b[yx��Ԟ�w���fy��yN�����Ä	d�4WG=�+M�	����2w�Jd�ʌi's����o%s��K�K,�Ȉ�<n�e`k�����~'��i��T�tΰHt���������`N_>�㦟�?Yn��C�]܈����᪍�W=��CP�����4S�vH�,:ζ(������
�?4e�m.\?�& >v^_�Y�g�}%p�k%�R�`!�_ƲnA���YO 7�V��I�y��gŶ}��c�*�l.w�K߮��^���<#x�˛J �?*r,w��_�{�:`���z�o\��Y1�^c�d?a��f��HR�����w]-�������!~�n..6A��<0'�VKr,(�T���H��/�����g���W��&�V��YK��dҷ8F�
<�m�k���1�1P�����k' ��A�\�@w9�Q������"#��
!;6R ?)Bl��m�H���>h�\"���a��Sl��N���\�\Rp���!�g��;u!idQe�C���Taݡ���A/���yR��s��
� !�w}��WK/�!�c����9@�?�_�09p�&E��������VIi??��#)��Pr����+|Nvkc�Grk�n�Yp�CZY�� �*��*���׷���X*�|��ʖpY�.pĺ;b�7AN3
�z�����Jy����W"L�Xw0�K粱6���o�M���F%���py�N��EnŴI̢�$N�t'�zY_bۮ�+�{J�;�/|���M�װ�gp ����f5D�D�(��K1��"Ȕ��-|v &�{� &���zE��~�lg�������L]�� xɷ��rD�d�Z��=�b0��M�U�I�?�r����'��~XnTt�	�ҕ��Jۏv�^�{^�y[{vX���^��b�~yJKO5�&�w�m�����T��[�
=�9�!�Rm9/G���W��j�d��W�e���,�y�]"1�������&���pX]yu�Y�9o��Z���!.xX�"���!J�ڴ�>������D?-2�B '��qUC�0�Lu)�,���X��zyu@�v���w�<��*��q&�=��h׃����s����s�L�>�X�ΑB�U�;�5Ҙ���ve&ᠷ��ʕF�1�p���'B�x�)�I�@G�,��"8O��e�8����zꭕ%&�[�3����U���T8Ĺq���Gcy�I���F��`]C6����CV*z7�����s?����b�**�������B��wl�"�'*[��V�F�W#:^���ЙG@�����P�,�S� 5d�Ѷl��k�|�9��������S��t�^:�`|W!QP�QHNgF�a�s"
MJ�ٿs�C�uh��`%i�H�^��	LIN`Sd�����������b�k�(�o������Sj��+x��2Rڙ2yh
��D�r�b�3k����M�35CL���K�D�<B�d�N �Z�S����V81���oo��;�B:Qeᇯn�m������Of� s���ֵX���GQ�Ë9��ApqMiNH��8�_#G��WE�7�=���v�e�(�0�H���V&�ܐ�	b��Һ����0'�x_
������8��/ItM�p:�5{�^!����p� ��PW��-v��\�2 ���(�^/W���@
=Ќ�LP�����F&j$��8�KU�;�}v!~��V�`�5�O,�$���򲧨
{�=c�H%P���tl�(���?��ܡ|���pB-Qք�qY�䅯�١��x� x���4t�cp�@:�_�M��������M�&qg������9�z�����5˫F�f.��^�L���U;d�衮됸pj�,b2;Na
~��#����C^m.�cT��C�L{�}��JUVr�>:Jke��t�r�R�|R=g;���^��HW/�m
]�y������,�����A��EuQ�L�9/ҁi|>�U�1��Sr�~��e�^���y��f�����KдB��'˺0l���k����v�)p⛘l/r����������3p�����p��-~�S��w�ՕTb�\��Lj�q|a��_c:6�k�H���lh��|�pO�����j��r"`�v����$Lŝ�]P�%�c��ޮ�f��dO�3|�Ԗ.-�?����3��m��;������麹�i����FҜ!<����g�����Ӿ�<N:{U�Cb����o���,�ǔ���]�ESO�#6�H��	f#�DҹD�(ot3r��J-8Y�!$�Co�3�i�m)%GjRL�+����"���v՟P�0r8b�$�8g�I�xpy;�)�#M��d�ɢ{af�*#����,{�;��O5gJ���g�(���ᾗ�|�|Z�y])B`
�;��g�m)cV`�q�a�y\���^]�w�̹��)��ˢ��DP�����&� �&j�uh$a+��[%➓b���\�#��s��)�rV:X�,t��=���&���Q��sU�Z�\��X��I�k�����Ĉ{3)��rl/��h�Ӡ�o�Gi�b��L9���WW����{�N��i�N�p�D!��{M�C\q.z��]�`��~>*�Q�W�� +�-��n������b j�x�Hq��<R�*��ﱆ�xe>��[bW~�/6o=�{"�I�YCr+	xa��=(6b���/�����O�y��Hmo0~L\�P0D�>��+I��C���Foiђ����R�aZ���ҡ�f�����_�hBC��ؠ.�i�4#��C��5��R���U:�q�s���#ۡ�릲�����*a|h���$5�0VqYq�h��z7O8�i��S`�-�N�s#h��ҡ���u������3��;v;d��,�ޓ6����&�0d�����T��`��pK����h�A@���˯^rm�Q%z���w�ވE�~D;���?]$�`��^��F�[�)�j�(O�%
f�o�	쀫����wu�s���k��s���7g����<��mQ1AD~oҚ��`v��@�˄c��"H( dC��1@UJv~)z�K�|�|�]߇;H�9E^�@7�(K��l,�O���!�l�|}���7��B�+,bh�i=V�KEʊs�l<8�"�F��� Ho*=��b����kT[I]X�r�4btR��yw��_� v�i2����8������eu��f��|����ſߡ{R]ln���3d����r�_���n�/J���������-�����n�m�Ʌ�M&,E��N�g�~�Z�{�Q��4�/�m.`��u!��Ǯ�oPu��zcs
�(r)7o��7_a ��]��{y�?��v�n������Ý�!D)�df�~ \԰U�י S��f��q��C�_�K��l��k�l�g�����;�$�ID�\�)�#V�k��we�ç���<���K�ȂXO��4T�o�    ���v�{U���H��q�P1N��fbaK�� I��k�9�4�t.OJ��v��8�F�$��$�M�se�����6��'hl�dm��K"F5��H0X,K�]]}"2�3��U�j�ѱ�+�r�d�Hq���ь{��3�����S�s�1K���$��.
.��i�0�Bd8W��h��Ks��k��.o��hͩ��&��ĺ�n��T=_�a�m�Mƕx(�S�E�o�a�/#s��JP�M�8,�3.2G���UxR��;;֪��<��0N�����T�~cc&�zX�Q���À	�	���\���FFC�M�4=�����u�Z�F�ӊ�_�M2�ΠC�
H�F]هض�"���zIEL�W�r5e�a���UV���t<I�װA�����	n^~lyM���/cX���9�#���������$�Лf�H�6gX����_K7���n�q��dN�,'u�M@`��H0kd�8�锭#A
�R���a?�>�^ gӢ�$#/EFO}%�9�?��q�{D�Dҝ)���ř#�^9h潛�c8���XC ͩ��40i��vi�������9����s�|ǥ-��l�9��D�ѥ���r��0-ㄥ壡��EJ�'�	�nK�6A����;�Z�xM��}�Y�=�+H�ͤ�z%��0y��v+?�Jp�R��������i�N4�tϼ���$��I��H! �r��;�vf�x#���X�ߤ�]KdYܱ�#!�0G��џ�77�=��T%����|�4�3N�Tp������X]� � �>���&�+�$�$�'�N��^<w��3�]���C@նA,=؏�W&��RI����@�g���[�?V^5�tb�q֗�4�`��:�1���[	��A����K��7��ͺ���t��`������ܯE�����}��Ѽn
'#����4�`M({�4g�z��Z7�a���?�w���%|�&�
C���Z`�Tp�z��r[l/���d�}s3�"�w��o �D��`�li�yS锎x�Ԣ(=W��˟=$v3�RW��̔+��ay*�Y��0�䥄�4vSV�lV���t�:8T ���>p�8���㧾́�TF��mɃL�P�CI?Әhv�4�Wc���*Yu︟c��ō\D���q�Ic�79�j�:�a��A�vnd��)LldW�~#��������?߼=|�PPp�R�,s��gQ�	���
����H	�'P����k�$�������%l��=|��r��H�:�4:*P_����+dm4I�j���_&�'n��
������e��TAD���ވ_��N���Is�o�\#�,��z�ȟ�<?���`��s [�<t�大�YT(�m��A���ւ�	Ob�����)?!z�0p��{��6"zĴ Viy�^����>��8��o�h���a&��	XI��Q���ϻ<9���tq���5c7���<_��W6�6
�0����6�@���M�aKp���)���1n{��H�X�5kK{�S�	I�����x��`;���O����} s;N�x��C뜙.�q[y
K�Qpmj���QzH������K�"���?{�m}�ϕ"���C�Q����B�.Qԅ�a�@"x�)�BrG%�>zg�������ff���):D�AU$=��6]��cR=E�N,�P�����Ή/Q&D:a̅j�YJ
-�-�	���r����/�꿾���C�7��c��"������{3�=��x���2��"�=6v�L�π�׷Pn��ޡ0W���z�^��e�5��� ���8}oේ_B�g��jz��X>D�9JT?�J��C 1�^5d�-D�"�k�>�\��������W�Zz)����0��>���p�*5�}�9�Ɓ�WG`,r)�u�rɪy��_�α5��,�d����mQ�ŷ�h�	��r�/�L��wZ������רg��A����Z��� p�ij@��`ZNVtV(7(�j��ef>u��9t���)$��9�v�ȗL�gE]�r��s�(�Dq�gK�M���O.�f�_��zs��a�;�R�w�`f�w*��q��H��t2����QI�3"��z�_��
�����\-���M��Ή�J�1�G6,�&�����WP���1b��֕���x_(��#�G�+Y쐜�����o���%y��yS;�a;��]�n�����^�N6.�N�ߞ"���υv\�8c6�j���4��K��9+�a��|��۴�gW4�d�牤��o�!�#��Je��aBF�y�p�y���l��W�k]�6Ix�Qk
�-V���y��7��51��u}�<"�7{/B�찮x{���Ǉ�׌���T=on�}45cб�9m�_���j)��z#���6��x�z�z,�+�S�1�2B� �w�*f�cIZr9�,J4:��NWXh��5V+�����w��C���șO���Է��N�7lNx`r�Z�	����~=��u�U�mt�>	d)���Z���&<K�5��=�=���5X0G����Ȧzux������R1������~2�b��0(c<����dV�x4r)��lEA��㧮���M~��O�t�Y�@P��}�?\��!4'9��u�$��N����z��=w�4`t��ma�nK�"A\V�p��x���2��=�!�G#rf�F��mHޠ��t��D���n�>���4T�\�iL]�R�]ꪀt�'�����=������z���<g������]Y���{�9L�݂D���ԖCF�+�#u�9^	���w�I��	������;C2s�%3dASr��������gӺ����	��,�6���,��+Al���|FN:U	�s�lf�$s�cU�R7��ߏ�8;ID���QdMz�E��]3[c[Z�~��U�-v��y�Kx���޷�+���\gX�
<>�Pg\m;�>ܷ<r��j[0�zj֑�w*YG�"\ݔ��x����Ʃ?l�M�|3���1,���ok	���-��#i!����0�����gC����oB"<�"��Ȝ�&�3Nc��iB�.�7'Sn�'�Pl�I���ɂ���J�,�'F;����R�֫<�)���]�+�_h��Y�s�j�����$����N,�fh�"m�ћጲ�v$����_T��bb⚀��0�:!0�$(�W�Qg�� 4�Z"�2r��K D�����ȸ���< C��:��H�dV�����
��=��ڰCN����)��Fqd%��Ub��N,tT��@�[�s�M/����r�r[c��EO/����O�Zq��c��1�n<q� �K?�U"�g|1~B!�R^��nL�=�/puZ�R�>K�#H�OBg_�
c�"7��9��]?BmL&�t��Y�����IMϷ��p�F�Q�<���ߪ���+,y���	IBt[����z�pV�&��YE�џ3������O�N|9R�2;��x�	�3�42��q�wFg�
�L��J&G���.��^"It�� �p44���:�D�k���,h3���d��b����L5��6f"���jέ��&�'�䩰��k�V}U)CZ\ӑ��µ��D�(l��,f�R>��4(	��QMc'��+�-ر��B�a=g[�у2��퓭I&�ݭ�|@e��;I�Bf	�k0U��0
�Kd�cl\�xԨ�T� �g�v��G'W�r�n���o�M	����]���~����(ߒ�Q|oV"�/z��8����Pa�����nb�&6 2�;z�ض�4�J�JH����r�Af}�j�:A�%I��,��G��n�h/PY���8{��ni��[��a�DEZ3��Ϩ�;����)�).�,w&� 49?�B;n�X��~i�p:�@�Jx���pqܦ{��|�z㗄%��.��-7|��v�Bo�R�dxB�=R<���1j%��I|0�L9W4�8J:�:5VhJy�    ݨ�ހ�%�a[	+!g���u�,�����%|6º��&7{X�?5W����P�ɴ���{�F	;��吇��eW��M,Gx�,�m��r�s:��M�*{M��7���er�FG�w�퐺��C����Ӵ��I|�G�1�#�n��Ӥ����z�^m�+4�HkC��b�p�&%�G��G��f\�;����`Ջ�;#O���c�]_}�<���g߹ވe�Ix�9�tNQ�Q��1�,��(eW�L[�~\EY�b7�'�U�1.{��U�}��v��눒� �J�ˠ�@A��
����%(���Iyo�2�P���C>�O:��Dq�'H�!1���
~�I̧5�6ͤRv�J%�3�~�_:@�����۞�71���kF��^8����cb��h��IK9��V1��g�������u'd�%�-��e���)����+܏����	�(J��6l~�~�/T���+x��^.�Ȼ��]J�RM?I�!�-r�J�RH��h�i��
��|J�!��),��N�tyh�,4�N�p0c��'<3z�n)�XXlE�������7'�~�\��o�b���������o	ª����x#smo0��I#�ΖEs��|�_��4�J^��E ���ں��5b��Jux��������cld!w}����������tNc'[v�����f��llbqKC	��z�Bww{=u���nnR{ƃ䄓e�J)ʥ�GeE;��8!E��Ø�����(�-n����u���c� �v\y�S��D)C��0��ecaJq*;������;��S=�'�n��k�ͫ�o7;~y�9�ݵ���Iil%��8��ǿ�z��H�ǅ����p
s"; �6\���G��a��a��1�s�xּ]nk'a�%�n���qT�[F�<5p������Ԅ���>��N�ԀiD��j�1SCȨ�Ƀק%lԐ$�k���~4�ߓ�����d��W������,�Q��-~ ��s�A��H���\��Xʡ;���O[J�Jd��X��g��PeY!�Ӿt�B�9,�Ǹ��`Y����~�񻅁%ft��`Z�lwq����8��/.��_���}S���%�=E�E�>���K�v��N��
�h2Sh��~��F� �W���_V���0�ҷ��v*l��Ѯ[e�\Y���b�^�ߘh�:�۲�=�i-�������X ��@�p��0>��*��妕z�l|�����˅u��1զ�*#���5�2��sF��i��
�q��0�pR�gy�@1`f�&(��y�w\A�u���%��(}����i�u��`s���5���b��-?��?$�:���*�O��_��
\�w��`e�%��^n��Aܒ��~g]?�
�=S:�� ��}|�Dy�\��H��9����,�h�4���,pu,����/>��������jxio�l�IT,H��CY�����3r�K/�sykU�5��CX����F�������Ľ,�r�o���w�;{�}s�2��B��㭶�dQ�L�u��&3}]��~���!�y�9@������M�о���F�k;糭O��+a��S�Km���3H�g���o���%�*r�\DNL���L�1yt~��u�'�����ր��3����/����3º�pkD��x6��r ��P(+J���A��M�oE�"��a�n)�B
KQ

T�����?{��
٭+nD��ˊ�c�:
�sb�Ly���+\�$���Ǥ���8�1~�'^��l֐��C���Y].�n�xp��g���N��.RdZEO:a��ю�V��nբnB4E�ҷ�}��~|��e��l��-n���D����Έm��*H��qI��טo�P��8"$=��x����ʁT#�(��O����+�-���`�q��} >XM�SN�����' ����F`�ϵ�y!���e��h��x�̧��7�û8�q>~Er��G�g+��>D�~ݑ ���7Ob��8)�s�L��Q9�6s	񱒃T��ܠ#�@��~��m���3�)R��,��$���2 ~���pe�n����oct����X�#l-ء�J�bW���գ���6a,��lW�Dξ���2��؎�6d�:	
"�/ʀI�%j�,
v�zn�Q���ܯ����W�l�2'�]FXmS���͡�y�q���yhuO`P��[$���[b�P�r�`�.8s�O�~���y\�F�ȼ��9�ހ夥�"�h݂�E��1��q���|#汍S�3��鲍O�C�t*��Ms�Ze* ��!scԕr�ل|]A��Ҙ˭�@�y�@�ηx=���\ςp25����a����e��BG��ڔ9@��Me���9�mc��g���eHxDza��������徆��n�;p)Pq!�b� ����_��g�:=�U�.v�L�ozi$����X�z����D��� N���0Q&���)y�����g"�(==(�^q	�gwF\s�.P�d�q��i�,У!"��m�簝8<����Rx��	Z燫*��I-R��^��=~�7��Τ%e�K9]X����V��'��f�xk��՗��:N�@u�/����?[�M�8plx
�8���0G�{D]h�2��0��-�`o4A>�I�v��-���w�]Ǻ�%�(�sb��Tq�`� .�i��? 7h�Oilκ������K1�@9��P����Lc�f�CeZ׷�O���ϝ������䛂�<�����n��;�¼"V�w΍Ah�N�_���~o���|Q4�õIp�\�aQM�m��]�O4{jH��o /��f�\n��[��;�;��LY������v�g����E��nn��1�	U��Y[��[b�G�����|nt4dj��w��)Y(A��#��P�^�͵�<���?N!d0��&f���!�#>2j�e}�4j�2&���zu�.o��(iݢ(�Ba�W��C�� ��z�F�P�Z�T�����Q�?��;#��4V�c���ҭ���ѯ���t���T���/A읽��>o��6ؐh�������Q��+}�YGԛ�ͺA������"7 (�=[v"��<�`	���ρ�e�6�����\#�0Z�V<�}u�ʉ�R9�:Ug��d�3ІM�KL��Ч4��pӔ �_�ϊ�?�W��P
�����u\�)Y��;X%�s���s�h�ƨG)_^v�{vJ؁���W;j��.#
�"9�*�da�Ŭxk�[Gy�鳻��JQ7�vݻv�XyJNxۯW+wS�_z4����v�\C	�\��8����]����&׳�b��)38�&�����7���QT-��*����al�Xp��Mi
�,�w��g�ԥ�vl���s+G
U�tբ�-�T^/��ˠ�%�&��1g��d���g ��T�\�kT"��%N�,��.�&�@%em���EP[��f��TX����-�}^_\�4�x*�G("���ңN�=)E�!`�t�A�Ӣ�NX1��N����'ǐ?�HkK���^l>l�ā9?�*�"pt.Q�'F?߇��O����)a��_�w�&j"M#,Pi!��5D���(��;�,ez��������G�э�]�,o�K���w�a��4C/���6>�VX�3��1�F�@U̱��E����Q_���
,$q�dҗ�$U���p�FB8�A_��G���a�8��|�b��Ҹ`C�-|I� h߽_���Y�OLj�J��f�lȟ������7a�1�p�(%���1�Y2*�ѭs����PlAS=MU�Hqm���5ǧ��kg���,���ξҍ?���@����0�N4�j;��w��a�0*��>	Y͑B�T0��x�����b���{������E��z�����������wՓg�^<<��������zq��(���={��Տ���G���1ߊ�?G5��Q~��T��^�� g��3�{U�Y���̊�ߍ�~���nE��$�������כz��?��N���Q��6����L,v��|�`�    �(�,�[�����s��.�
+.����r0�m󡮞��c�k��:*���ö>�BF��].�*iv�u��ϙ5l��[�U�]"��&y<IMF�Y� ��`�?���O��Þ+�eqA]Kf�ΚY��;����rV�բvV�Y�H�j.�-�Mq�pCP:e��I~�.�1��ǅ!�Bd(�'p�-��d�HN�S��h�A�Eah�"�r�_H"�;h�6�&�tz3��p߻9��<�0�8�XΌ�9X49^�H���=�0Nl�;`@U�9"�R���B��K��Բo�����8�P�gP�>}s��+�ƀ�K�'~i��{&n�؏:&�ἆ=>����{�e�=�Z�Vr� ?խ��uZ�\�47!y�H1�ҹ��W���NxyHt����W-HUL�l�@}��c�N�����:��P��(ВV��&o�D�"�8���tn��R���l��|���Vz�����;��;�ZG��wMQu����>����(���Œ��q�7�۹X]���H6��C��⯬gH���ޝP�#b�L)�(9A:��e��8TK8&N��j[�*Y]����n}�-5*ה�w2X�[?|�_L�	�~���g��T����Փ����
�h2T R�K������a������m�H:3�.-�&��c-����$ �g���m,���v�֓G�b7�֢w���r�!x��n�O���/X,__a)9��JhL�{PG��������Y�����W��A򧬓+�y��� X����pU�ᦙ&O�=w�$k�����W���s��K.ؖ�����$����j�����B�j�����]7��	~M�}G���G�� ���+6A���a�t,����b�������ˋ�r�nw�R]�9'ս52Qs�O]�+$���	�9� V�w�����b�op�c���Źs%����W�_�oZ�$�)�������;�̳e�J�ϑ�����U:�~��(A������o��iV5¸���
�������Qz��4^���|��M7�!�)VM�60D[ܱVq���$���H)��}P���=�ԡ�J�p�5�����ꁊ��l�/�<%�v�T�/�&��Ζ�3�� ��oSF�~�Q"wmƬD���ӈ��Na!�,!Z�t�	<�N�8-�_�\��&N��r{��n��l\Il�Ӌ�3�I�� �0���<��B8.�Q����M{�%`iP*~[�����M�#&#z��V�<�h�M��uDc/���R�?7�ꆀ%u{��N<yn=��á��m� ���~z8��D*�����?w�暞��jKқ�7�i��FX�>l��Ŧ����7l0J�uh�ˉ��{J�� ��\)1v��}�@����ӣ~zS{ ��	{ r��B�/����0l', -�30�x�#�)2�F��:��Hf�[��(4V�����������T��<����h}-�:�IBfc��:�x�.}�=A!e�MC�+mS��b��=�B��n/g�IKr�$����8��>
X��lY�1q���F��g�~�S��U��P�v��>I�%�
IP�.U�q$DH�-D>�'Uza�Q#oJ�Y��~�q��+`�M��ډ&"m*�x���V����
���A�w���<�Q�	u9�)!����X��W�M�s��Ѐ*>��}�_|3��Et��̙_C*�w�mU�>�Jy�p+9�uÉ�I��FP��m����I;~�_� 4�z�I�5��f�֟�= W�ڜ	�����R;g���=6J��� ��Q_8jk�fC�>~�:��8�#����na��h'�έ��K��]75�\��a�[և߫��z�����%l;{��(Y0��ga�	_H#�n�ٌ��=8���.��"�K��K��v�w����?Zz�iC��[��<��\�K���nMFNl/�z�M�v�f/��V��_�ӽn�=㷜�eKt^����xjS(�ǔ&	�'R�,�v��?0������<�V�ڼaI{���:�S������Ѕ�>�
%S�=^�+Ox6���;�#�&p�P�`T�0�a ��mPʘ�Ov�.��m�E{0��
�g�T�j��=���yL6�#!�e�%�S�$f�"��S��fsz��`�=C��v�:�K�n0�24���Z�&/�s˽h#��a��)ĵq���
|g'��Z.�B=X-obw&�=��K�u2P�ͅ&�r���Q�sz���ΰ�(�~b��} .��TIF�2�/٭��kR�&=1�W���)�_C��3(
+��1KGK�;An�ceU�|�sboׄ�V��Q"�4��#ZzB���)��V���(���o�|��ד�q�U\g&0�E��>��95q6�F��x|Fp���&#~�[#8T��Lo��zJ���=A#j�D�fS�D���� 	~|u�B,Y(J�f�W2��I�Fy5e쩘9ʸ��6qM���c�?���%EV�'X>�eW�6س�]޼�H�Z��]H�}y���ie���D��e�łh1��8L��)����f3oR���]�Uf�x>9l\h������ǆw?��}����??-�½=���_�V�^�e���D�U�]��ij�b���T���Vj����SlF�E�f�2�R��^0�������Cm�]�k��XO���ó�E�؈wV�����,U���Ӌ��Ti��Z��%r��ܓ�`f�NKޕ�,���{0�5A���%�� Ncx@�!��S���A�^��a$n��SH*2_�`R����N
O�b�l۹g�����~;X�0W���K���{Vc����7���)��[��?�\�l๒� �X+-�rP�J�]��s�t[�z���t|?Ϊ3��6]��;����L�����\ϭQ��q:��c�y~"! M=8fKF@}Ő�#���������r���"���=H�{���'��`��;-��u�(��8G�C�o\���N��7X��rM%�	'n���IR�S���E|�nt�,�bA��wj���p�ڋ�S*�:��4.��S���,� ���z��,��a�*����^�`㿣�|�v�dId�"���3��Al�=^m\���7�fw�EBx��p|<{�Y�_p��ʑs\⥆�H�1��ژ��,�w*���#���:!n ���+֘�[����}^|laQ����RU2v>g���` ##ܺbj9�+9���_2�d�~��&Jͼ��m����ܫocs��o��:�o2�E�X���2�'����cj~�\3������`��a�ܞU��Uǲ-+��ތP�VC�8_���v��-P;و1=���c�b�*G�c̞��/�J�Ay�?.��/t �����&K�VP�laeOL@�رU���-�)n�Ԅ,8#���[&��Fy�	c�x7��9�ZW���,��X�{O�[s��8\6�;�a=��]y�&�d<^��9�m���
�JHRWp�����"&��h��}XnQ̥F�X��t�Z��&�m�5~�u�3��ٽ�`�-纹��T��n���߀���B~�}�:�\N���,R1˳������v��$ϝOE˼�JM���"ɑ%���v��Ϸt@��i8m�Z����eB7G�������=�Xv[���]���o�f{�4aIǸ���m��=��pj}[RP�3��r�(.��MdI�U�����_���`�RXR�A�/9���x�N�!֟Wq�~� &���e�E�%��saTӳ�>J~�u���ޮ@��x�g;~�G�C�k~�>~��Z Q��o�9���8����[Nĥ"�ٹ�R�UV������p�B6 �&�(����p ��F� 0~)�_#�]��Ӻ��(��Eu�ޞ�Hᤞ?�'�]��-���bqm��i�s��[�<�� �����7_�Ʀ�.�z��ԍ�`\�����K�8��v�����{��6b��'���8��M�m�/?��j����}3��Ӣ'~rV	� �@���i.�g���12�����!   �b�Ae��9�5��Y!���ֽ�K���\R���a���<����UšvLR`RE�*bU�-�r*\=:�߅%"-x��z�}���*��~�{�Ms�G(�Z�!B5	P��w0�01�9��>>ZF��l��`T�ȸZ��z�1W~���pŁ	�gWV��`�h�����ܖ�J�R,qFn�<�h�� ҀTr*.���UE����~�A]�%z����#��'#NS��{@��Ţz�(��M'iEB�1���zcF)�i����8�G:���;��Ȅ�|�"�;�IĤ��27��:ʡ@�^�J�БS�.T�,�6�K�9���wnDf�s��1�~e"p��6�jaX'<]��������bk�p:�X�PV-�����"���.O����l\,*uJ���� ���f�wa����Mݬ��*�k����..ԡ��e�{7+$��~R�_��6QS쉼hܱet�"�%z�5'���ڵ�6D�u��)�f�=�. !�Z�G��IB������(+��/@,�����	_�=sgƏ�yHHmժMj��qϽ����{}�}z����8*�+we�A?'E�s���^,��A���恚�E�K����:x�C
�R)�����ago_[nk��f��q�RB�<�_9ͣ�MB+ұ5j����L],�����݇�:��tW;<����a北g��*����K;�ݔ�,�l��&��>GmoXV7p��l�n[�'c���; x;��e?��A~W���A�Q��]$6�r ���ߙ���q���,�?Q�

�AcЅ��/�d�� ^��/�#�Y-�~�Ĺ9i�����3�~��@��}�G�(�v�iG�L��y�rntr>g��!��y�͋��!E�eۓ�ٴ��J�wi��M�g(��%���� �Zn�©L_�T��C�
���܂Ҙ"��ջ�u�e��YpB�yu�&+�~��}�~����Y�� ��M����ꟈ�-��$���^�彤������*����z����5
1�U�y��q�Juٚ9a�T�_}B���a-{r�ʲA��/hG�����N�f�&������	1����~B;�{��u�9��J�E�$��8�K�Z?"�$�p�c�4o�� ��.��lUU�q�G�!5� @j���M��6�F m�?m����f��3�(0�t8twW��,	������Nof]!K�m��H��;�]}�I�mR����d�G�$�T�2-�Y
{U��@�Te
!?�گ� ��z����QԌ�ԝբt6)���h�}~Q,�o��ѩ=vIkۻB~-�+(Eg��^�\:D�?��t�@s�3q�H~��p!�H�mt_er�g^ȦW�3)����#	�j��p��v����1~��@d�<�;�V���4�^(\���������dS�)�J�2}[��&b���=�<��|��=%d~���W�QQ��H�.Zz�� І��6�qU���h�O�(Ǝ�~F^���3e�0�*t9� ���eJ���7��ң�LH�J��]�ݺ�T�xS��K#����h)��+-LC[��ֺe�s�3�vI�S�Vkj��:��(���)UBV/oןi�	z����e���D��\�����C`ϤQ�찁��k��-}���Y�Ri�&�x'���ߗK�p���v"�r�&^��4]Vl$�+$�錸�bm��!�%zѠi�D����N������H�f5�����'OC����H�m�L�hKx���<E]�v������\M�W����o&���� )L��      �   w   x�3�.-H-*�,�/�44����2�,��,A��H
BR�KR��RA�� i��|��%H�Hp�8f�!X�9�_j���@Y#���Oirb�B@jQjfQ"P�l^� �2X      �      xڭ}KsGz���+j癸�b�ځ ȡDR0��8��"X3�.���q7����C�ń&B+�n���c�|��Y�n�M�i,	`w>��9�+�l��7�U�^57�z]�_.���j�/�g'w�����8ӳ7۪��]�~*N���O��-���E�nVՌ��L=���`��̽�!ڕ����bvZ]�����)eK&Ei��;S�Ϟ�Nn�UsU-����}_����7�ogO���ꪩ�[���M���V��>�K��0JhO�Jߦ�t\�9/..�_��N6� �sLq��1&�(�y����,�M��z�}W����x��48��?-�U���+n���8����iƅoع�v�������o��M{g�ͥ��g�i[��(���n���`���ѶO�5�<{������}]m��j�\W���œz������I�@��Jɹ�!Ua�q9y5������?�_c7��-^�ߛeS�����U�x_m6�@��f'�%V�_X��'���p�>�lt������3��πY*��H@�N�Z��N���O����Yoj�8IZ>�����P*+���t"�J)���N�Ҥ�f����<ΣY���v���/�o�!�j@bł ��V�^���e��b�U�~����s�[��M�ά)�1��j�$>A�^�㾭_��ԭ�����m�-�+E�O
/����� ��8-�c
�跰y�m�MsI��U��������R��������M�n�LZO�� }��G�}89>����0Q0sn��U�qwZ��p3/!	���]�ė� ���d�	)q�Z:�,��*�G��7����@�_���z�w�,ö����r�y��'��؝E�f�n�ų��Ǐ0�P�p���C�΀����#�d�g��\�:0WB�J���¡9�f��զZԟ��� ��mqD��%��j�lv?BbÒp��y����d-���[7��~����Gs�����<k����*�Ѧ�$����G�SZ����Τ�IS��N�b���du����O%����b�9D��4�h8g����~-q�.��I]mV��dPl���z;�)y!��Ѿ��s�:��,�$��R*Vz�gҘ�F� o�$�9ގ����	�n�x�Tk��m'�ݦ��{:���^���%ݾh���ȟ�-]!v�m��r[���h촜s�'�~N�Re�L�����������R}>��.:�s!%����vq��i��-�xq�@�st"�X��	� �Ӯ��x��ys��$qq2ڽv�>��Ӷ������혛Cs�zK�� =ځk+�2j�-ď<������{.z�s�_�[.ɔf����4V%��܍�����п�7������MU�>C;}�lZ,+��J�e.J�M�L
e�mZDhǃ-˛֖\\��kG��M8�a~���ڎ�*����~��xF�[v�|��!������fQA\>'�<vc���]G0{
���?�z������zTh]�#���DՏ^�e�f��si��[�|$��?%!��3����Jx��n׳���^��[�������Ȫŷ����ύ����^l�*���5�sg��J�c�����pv/����������Ym?g�r��pU�9��v?�o�pӜ�$ ~�nh�Qشw2�!�P!L���s� ��ު���p��&��&Ah��O/�7��p�<Șu���������L²��d���z�p�/Ξ��C���^ ͫhB_n?7Ğnw����^mH���7'���Zl/�߆+P&p ��V�9�F�b�����B5ܪ9\�8 Ic��ޘ3<�V��n[}���HB�2�%�:�u��G�� *�j��q��!!�����ņ$%�����i8ɹ��NB����y)t�.A�J��}����x�}o�M�}~��\5��%tpR�IXG��'�xR}����W�;Ǯ�'\)��=����F������ ��ϳ��kH����R���y}�X��}�Lvm:|`��p;��y��=<FKw	�A[<%bs
X��^D�H��{5dE���1�)PP��\��(7^����w�y��ņ\9V����[��.��˱�K�$���&�g���8Ynv����'���0��(�6��=�ޗ*�o�w����(����'P��m��(���ە��r�z���:T����!�����v�b:��v����w�����X�)P<)���G ��ɢ�bOEǩc��!�d��Wo㉍ݥ���t��q�=�2ط�=���8���yʴ�bWYU��ϋ�z��Y��?���5~�S�K]�c  Pa]����#(Cf��dE��G	V)�������a��s����@�"��搠���ƀL¹B�����';�4��q)	S�W�x�d[��h�<Ij8�|��%�&h� x�� 3�%�$Ş��%Pf�@Z,�;9Ȍ��JN�>o�3�G��n+��������莇QΑ!x��h�Rޮ��~zK��Gת8�Pt�A`#Ʋ&r��8I�ֳ�y5�S����Mu�����`�Q�������b�M�!U ��l�9j����T���1�`%�����7"g�9E��h�sZu�'\�
KZ���a�p��왈������W� �3��(B��;��d����.�d������;�@�r�7|�;tOo+h�t��)˦����n�j�[yY77�?T�M���u�����n���m�o����߁�O�k��z]��XIf�Vd�p�7[�� �'���Q!��`�}�ݮG3������p��=U��|���:��m��)m���N��髻��$~����#oo��6�a��l}��y�.�CT�C"�Ó��e�m�~��9XSmK��\ڙ��j���G2 �+�ŧ��1�UڱI; ����K���
�Y��`+�vI�v���� ���&eD�-�����c��?� y�����뒻�cl�hl����)j� ��)�^�����8��b��ҙ��G�A�������|��n]E�{��ZQ����/�:���@ O�5F��9�a�B�#�R�t� %��O��'��v0��'wiO��_6���(>���8�i���E��Ps���4� E�M��ff#�N���V���,���
��#��w�آu R��k�Tz���ں���ݏ���T���$B�n;���P��"����5����q���P�m��m59+�K�*�;s�fF��G���C�a(51��ۻ����䶗�δ�O'���5Q�N^|����n�re<�l��N�A�?��$��W)�����lK��e���	Go)�Ņ����e����cBC9pJ�a�g�h� �}J,�!�WAs*�x
��b�<t���,C�c�x�P�1]U����m�|�~���3��0^<��C?�!A �����>8P���@
�6A3Wg��͋l�{�Tl�_Tr�!0!»Qu"O~$����_��*&AFb�:y���<��@��yX�˶��		�!���g�D��^Z=W)�m T�n����qQZ4����+.��+�y��Y�h�7d��:�����c���FW�_~'�MYP7�����~0�]���7����W�p�4c�#� �`6�Y��cN�j�Y�l�,�[��GRtҤЫ�xʺ|���:<��~F�V.C�r}�'V� �w���dÊ��	�y�W���t���|74����$��}O:: Q|G�%S^�~!,�.�x�z H�T��vx,f���$�*�%�q���0W
J�[��yE��x�y*�Bʝ��V��ep�O+����D���m{�oA���?! �N�DA9� ����N�7�hCR�  ����Zb��J��̜B��$�,�eJ�3r%G���jAu\���:�S�*m�b��B�{�4�x��6��0[�qO<��yq���}��삊
r��w��>b$�;�|�	`�{l�i���a���ޥu� �&����'��K�z��~վo�hTg��j��K�m�7ȁ��i�(��    FR.�r��`��x�j�L�17G��/T?�����8?{���2��Խ���"cc�~��fם��< �gt�a�>��!ޢ3����0�� ��4��>�.�m�ZM.�b\`cؓ��;!���r���i:��0VS�3��e��t�bH�S�kL!(A.F�`�+�<˓I� N �X��=菝d|F��xt�p=� \����8c�O�2V��u��S��p���#H�@�����a�����ʚn���l�h�z����3�x1�<U���&}O��<�VX5i:�V<=y{R<=+������������-��QC.�/Nߞ_|[�:H�bA$/�_\<>?�8;�_e���.���1~͸�� ��2�8Ϯ���&	���^t��u���� ����a�G�K$$��m��2{�CQj�Jl������;��x:����1��B���H�۳�?U�E���1b��ռkV7-p"�ӳE�����Va�0NbTj9��~B��Ȓ&����0�q16( 4oL�� �����݂Sd;{x�"/|S��~'��Q��@�>��YxߧC�����acӸ<��_Y2�9�%�%��5��D'���Rn|�,V^���t$�IM�����D���B�t1��d7qr[}n�U�~2^x.�� rs��Ω�i���)�K��B�ؚT�>1H��0�kJ�Ob�y)�<�����["B�V��@e?��i��N�k�c���Q�)��b������Ib��VO��`�@�I,�q��b�B�:q_<2/��TFZ���T$u��ST	V�����KPjc� ��SHt�A'�pHs8�YM8"�c��hZ#T��O���\��{�IΓ�L�M��@�Ď��p���C�f��P�[G,�Va�I}q{	^�ԣ��uj�g�8�bY��.<$a�QH�`���$3r^��h�m��Z������+M��;��W���~.���� b�%l3^�Ɠ}�[b����<�?C9r&Xì�.�V���3�>��{�i)�A�熵�����D}\)-胄ߠ�Ky?�>Xj9LViR��~3��3l��Zn�XS�{�F�cZG]��{d,���G�O�e�`�[�� c�I*yd��8 0�:��{5-�v~.%ϻ泳e��nM��41h6M��U��̇
 �1 ���4u\Dt�%Rj.��C����z�a��%z��V�3��i�˛���o��1��-0Y
s�|��e/K*��K*�r�Ώ�p9����J���~���p�a�ITr����*�f�X�KÛ���[8#�r{-n`�y��i �w'/��P�<{���������i��zK���6��gX?*���e��H�5��Z�������0���G*v�~J���,k�E�仰�g��2�U�}��끊�OS�8Ld6��G��rr�ͅ�2���*]�~��S)&l�q�� �%p�5��{/�q��b�Z����({�N}��%9sHH,fz2������M�R��m�s�������/$�"wŗ�k��u��/�3����B�-5lLa��{�#z#&U8ӟ���f�'�� ��`��_]�7#"t�{Ťї�W��;��q�m%Y�i�-Uӆ��)ӊ�x4��W�b�=N��D_��1��Cp�P�F�Ŷoс za��H�Q3%��hpM�Í��s
c����L��X	e��ŋ�S���Qi��imJy�I�]8!�yp�U�Z��F����P2Y��A��5�g�][W����%��X#5���m��"�G���m��BӔ��{i{��\c�{."����B�k�33X�����.�0(�����UW��cQ!TG�6�p��Ըi!��(�r*�c=��?�D��UV_5���jơ1�a�(N`�rz�i1��
u�¥6K��X��N	�=�C�g�`dt�K�O8��&��  s���D��P"��X���i��ŗjB���5!qIk1C���2 �;ȩ�D��A@�@!-N�+)��\t�%��M�~�G���G:�T���s�P����褊�-C�q� ]͘1�{�U��Z��S#`ס�hYm׿�1Nh'�8c(KN!x��١�'f֍+��kC��+��K]5bdwD_�- yt�T�@��TTE��b蜞boo�WV#���!L�]����a/Z��
�gy��N�������|����]qx�{f���u��2h�$��
�k��)A�J��@�G��i��-��!���$��V9[�d�JLb�3D�nV�u����DƇ����0D����G@���?�jz �G�P�#s�Q��Y��N�(,�ڬ��F:\��Y����:TdJqlJ<!��[�����9�.�Cr}���ڣ�i꣤��Tu���}�b�)��>��?�c�6of/��E�dYNC�\��~S;i�~S����e@�ˁ�b���e�� ���^`�~F��}a�������0��$=�(�$��sI�mw2��ݍ�a9ėI'��?w���!!y^ov����w��{��\��k�`�>�q��ګJ����B�1�Շu����4?�ϒ�rF_�6[#�G�<�HSo�O0ݸ��t����ȫ�:R�sPV*���Y���ƈl��f*�l#W�V1W
��K��
�Rt|}lo�w��t*t
�0vy	LQ�>�����к��*]�P΁WTY��Q�g��6�3�{�����#䇁��P�> zk���xc=�nV,#��C�`BYT��A��}����Ϩ�cs�l�pׯ�S�C�Jb�(�ᅋ�Đ7�1_��4(�(E	b��W��94w�*�7_���zn�_`9Bs�ϭ�W��j�:l���U�0�IEΤ���}�8��s����z�u�AX֫����y��A33\�ʦq�9g��%z��v`�I,�2K�n R�D#�#}����S���|?�U*Fhr���+�NB�$>�L�>@�TĢ��'w׮i �se�',{>�X���B�.����Z��������^i��(���L	
�?���6��=T�r6��N�EJ8��R����!��;�>f�8��m�`����D�X�	���c��7>�:C_�l_�eW���͉��}���P��&�cC�X�/��������ʹ{[ �c��\k��\MZ⧤������?������'���9
!
����b��v<x���-J�Bҏ���0�=�a�����	g��j�kp%���c����U"f����Q�������hnw�A���v�ʹn�*0B�?ּ��	ųҊ���. -��/��?,�Mu����.�~aR�|_{?fL�Ǎ�9f�^������J�V�yhL8T9�k��z΅$����g����s4����Yl7�2L�QNjV!��|����q@�IhX�h�o�������=r��*�k���q�ǖ�Ia�6z*�B���^P�W���zrC�C���|fWz �} �R�_��?�){�D���"�#�n�\M9�[��{mWW��.'��t��>�d��7���|S��6��릿"��U��`m.�g�1Í�bofYZ]�w��=Q�\l�$w<X�7h��B1��$�ꮅ�K��F���PR�MU�9%�R^�²�)G�t�`PKU�Ǐs�'W�p0n<�AhN��Ә��p."�K2-���!]9�N�}p87��q��0�A��� ɥ���|�A�4����Q&��ڬO���j��-C�i�(� ��Y��F�\z_L��"@N��6X|:��ͪ^�����
��n�O�����2�,G�������eu����u캬)���4�D�����9���{%~���17p��LƓ*Z�#���aT�<���Md����DK�a^[�j*[� �l� )����'������ʹy c�y_������)L�W����`a�:��� H�E��"ST��A�	�!�N�mpd�WT�pw~���"`��:x�j]�`����k�c,o����G���v���r�BJ�`� ���.���|���    �<�S6����{3��M]ɓa�="U
�
��H����>`T��N�ض�~�8�?z�����U�R ]�"�9- <������$��42h�{��}C��f���_�m�҆�����
	}o�qd�{��b�cL<=�����y��U�'�^y8���@�����%¸�7�N�BSN����}_�ʚ�x��Ƶ#���}�@zVP�p��AnVM���'�&�gv���<�-�Cȩ	ro.O8��|�����.��%��O��!}� [� �8��1����d���M_�6Tn4�[.��i`����e(��G�R���g�%''�it���r��3���|�I���J�K��\yP�#i����hc�;���1��u���/���������d�;O�G̩���E���)�4n�*��I�� ���_B�X���u*��&x�}�,��%8�s��9����<�(iT������"�9�I\����R���q�Wi�� �ܟ-�9ĽF�ַ:�Ѣ�)4��T�a���v�Q\_�
��T	��^�~P�/%+��?�+s ��i6��kO_̌���A��+l~U�깻�� #��G&b�;��pP��~��|�8�9!��HhJ����I�dJ�P����4F���a�6G�u:����ip�úсP�:��G�濼�ֶ�l�?Q�;f��ﳤ�98��6�v�Ƚ�C��uE9���́A�4�~�$�p��GY��!�z�j���,�F�<�\Zﭖa��^����~Ex�e �v�r��ͷjp/��8�,������뾱GuiJ6�*�NՓ:^�� �2Y�@+�C�8��ז����ؗmZ����6oDl&�sN����d4l&���n����( �`�jX�Z<ln}E��U'ʞ����	���m�:>�K�����tn�;��(Vi}hf�"B�~��a.,��{�с� Қ&6.�{�1ȱ�=�A�`�4 ?�O��v���U�	���/h�Ў���a���
��"��~�3@x'+!�R�)����ͱ�8]�7��4��y|�G%\����,��)���\O���R.&�ʽ,�sE���U��oh�iqqq8y5����(2DS>�7�_.�Ť-��us
L�|Y�w�";
�G��:7d�dQ��j61��C%�S#�) N����i��4qJ	̢��O����/�W�"(>��V47�Z_$�P�b��Lv�v}k��2^�s�NU��rV�|�;L��̥�>d.E�˽�m.��J�rߣ��~0gZu�-W(�xǇ���}(���-A�X"�Ћu�l�F���z������z����$6"�B�C��P��Mx�5I����t\_5�ŵ�{:�`�<0(�%K�3�G=�nV����8�R_������N�CQ2��0e��Ō��N�a��t� �0�y�:�y���O�I�Fg��|VKn��9'���F�e?r�C=h\�Q�3:�
2V*_Qp�ؒ��6ic�ٛɘW�=��J���'�0q�5dDi$� `��!�nNjC'X�/�r*�j�Q
�>��5�{ٵ( z�i�B	������I�m?oo/a�MF�F�1!y��L��]�O��ii��L舾�Y�'�.�Pgo�X7I8#��@���t��rh3Xg�<�b4>��{mV�� �a���'U�ZE$عg�2L���ECX��`8�,la��{����(���k�0z���3���������Cs&�-Z�p�!���aܣ�3jL}(�p Z��偁��y�D5�]AԻf�I���T��bÔb�f8���>3�(3���=W��%��?��!�(]0�8�:.@>h��4J�f�*�� -���s�����q�_�eN3��0	A<���m��,P�o5Wd"���.GOy��H�R
|�b�~.�k4�����XI�D3m�Ljv܄�L� K���}�:2�`�h�D�Ҫң%��-H��+���"�LO����`����V��q�V�U�j��|����;�&�R�����	��~4��~ ����"��7�P	`���7-�g��
q�7 %~N>19{�\��O��R t�ΐwpġ%#-@_~H|�1đ̂������^N�0�b0�(�����������&�W����>#��Q����L��f?@q�,��̴\/�%f}|q*�*�g�B�����o�nL�;�1��Ք)-�M>@���|W_7}c��^D��!t@���
jDP��R���Ȕ�V��5�cW�`�hVZJ���\����J���z_Q�n\�#�}�B��sC}A������w|Zm���m�k��7Ͽ-R���F	ѣ�>��Ԅ7ɋ:6��z޻��~���sh�׫�9w\R�Ϊ���9�������*|6�wm�R#/�Դ�~�O'�g������-ڋ�Mu9}i��#�pFX�N�sr��E�f�In�.���	�F�u	넎�~>��]{��C�]>`��,��0���w�G�X��92dcyl�Z=�.���	~+���2�8��hA�pjրqN��W�?3M��X���z��&�w#�z�陙[��|O��{@f��07��ݿy��j��?9pk�l]d6�E��$� ������Z�p�!X9/N�(�EɌ��k2����S�>U��<�^�~#T�:�qd��ip��严o�&><��6O t'ھH�F���9��!ND��t<�Z-�'H�ET6��q��O_ ��t`'ӭ��5�&���i���B�p���BySe/�~�' ��:����nQ]�ο���fX>0�nԡ;x�چޠ�t���#\�n�^@<���^Y���yAL�e����7ŮŹ��à��6�r�e����y23'�1�m��0.%��G&`� ;!��J
���Q�t��1&4�Ng������(1�u��S��+�O�A'sѮs�u�9̎!Pt�
��t�7�=�V:5s*�Dw���'�_(X	HD3�#Z����D,� -0q"L���m{~o������	@����]iba���q���&k��Z��k5�kc4��EJ� ���(z|�I����ץ�;I�:��+rvմύ)3�9Go�H�y��8�%�q�����PB��o29XA=��2�'��7/R&Cv�ޙ�f%�h?�K���8~l��s���v�Yz�Y;�i�2�V]�j�Cel�I�d_Q�k�︪�lS��Y�.�j�����<�h8
�Db��p��O��?J�L�\�H`_Ja���t��]r�W����`A �.���i�NK��x0�&�t��!]Q0�t�����޶1B�Hv���J*a5)I�@���,iju@Z?S�������{�o�����XN�����\x<Q7b2*�����{W:�ru��]��Cyl��Q��d`���x]*�sɁq\�~|SVZz�^��j�'dY׮����v|]B����t��x~�C����&ǵ(�˄��f5�%ew��z������0$���*��Y`\�_��R�'��AOT;6$��M��F�K�f�k�,>#���^_���3?�V|�`.k��<s�-������']*��GNcK�`b+��<k���k�K��a��g9��?4�a��y�);�,��z�G
�� %I�oh	Ï[��`HN0�]sH�a���Y-E1��{�#�T����N�{�a𬇘[ֵ�B"��bI-J�u�?�e���b�����wN���Y�S���-��v
�D���A��dE�h�u����]0B�sh�_�n�~�`n2J����$s�{OG�kFE�aFA�r��|�C8 *�7�7-$i���WՇ��u~�%:�I��s�����K�)!?`5HD�P�M����h*�1Dt�O�!&�š�!l����c���RP�&wk(N$�M���z��-6��]V�Aҭ^}�>#=���nF�7���y5)�o�/�J7�{O���F�6����M*揃t}ks�����.�c��  ��c��v�f��=hߧ����Q�\?�%��h�}B��UW!B���|HD�#� $  �&�[6'���v�w�������!�B�n�qߵ ����w��O}in��]�T�4=��5(Z�,�	�!ME����.��(�7="8�_���W?p���M�y�P]��`� \7�Hc�N"VP*�ı�6ᘷ=�6�:̿�A�}��t)�Et� ���C|��h7����}7��~���d�U�1��R�.cXr5��<�/Y�A����YT?A��{��@��CZ$$��T�k��m�.��ii6C_I(��L�ꖣ�f��Vγ�)1{W�����=���.�vٵ`g�sAq<��(�H��b�c��^�1h(7e� 
������������琻)�{OǤj��_w2��{' �ǅ�1Z�_����0��;���>����1�la�������T���a5���7lF��9����I0i�Ѣ�;�����`룡3��̄��o���]����d�ޮ?4����O�T�����c�a�i����t%�Ɉ�����֝���Zw
�L˭h�'yH7k�c�f��U�i.�0��ki����3��pY~�>#�ӈ�8z#۪�V����ѧjX
�4/��e7`.HU7�hSu�V��\���
q�� ����Kpm������̻`l�z�C�_-��o���.3�V	f���~�B�p�a�?M��,��zԠԿCprN3s��1���(Y�mZ�,�C]}�!���5۷.�}��> �P�`iP�C��S�hl�^l�w?=>?�gL;��7b"K�f*������I/����~�}���b<�op��� �-�ކچc|%0+Ӗ��s��R~��7� �IC         �   x�e�AN�0еs
�ff��]�	�E�@�F�AiqK��p Nыa�j��W�5O�A��cLr������]���o�/��'��4����H��յ�-������O�x��T�)�c��[�^��N����5�
�����b��?��(D���SUv��PF�Bz�c:~��>�6n�B�1g�X�ϭg�o-�L7N��klLS�QUU���gX         �   x��;�0@kr
z�l�����6k�Hv��G�b�3o^�ͮ,��(����I�-���Ӗ�Vd�0,�Ԏ��܆�H���1��Z��"'n�GA�g'!E���M��כ�^�渒�S]����Ε�vƨ�VJ� ��3�     