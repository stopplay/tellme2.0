PGDMP  	    ,                    w            dbmaster    10.7 #   10.9 (Ubuntu 10.9-0ubuntu0.18.04.1) �   *           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            +           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            ,           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            -           1262    16395    dbmaster    DATABASE     z   CREATE DATABASE dbmaster WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE dbmaster;
             dbmasteruser    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             dbmasteruser    false            .           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  dbmasteruser    false    3            /           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO dbmasteruser;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  dbmasteruser    false    3                        3079    13920    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            0           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
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
       public       dbmasteruser    false    203    3            1           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
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
       public       dbmasteruser    false    3    205            2           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
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
       public       dbmasteruser    false    3    201            3           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
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
       public       dbmasteruser    false    3    209            4           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
            public       dbmasteruser    false    208            �            1259    16453    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       dbmasteruser    false    3    207            5           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
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
       public       dbmasteruser    false    3    211            6           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
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
       public       dbmasteruser    false    3    229            7           0    0    block_block_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.block_block_id_seq OWNED BY public.block_block.id;
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
       public       dbmasteruser    false    3    231            8           0    0    block_chain_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.block_chain_id_seq OWNED BY public.block_chain.id;
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
       public       dbmasteruser    false    233    3            9           0    0    block_peer_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.block_peer_id_seq OWNED BY public.block_peer.id;
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
       public       dbmasteruser    false    235    3            :           0    0    block_transactions_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.block_transactions_id_seq OWNED BY public.block_transactions.id;
            public       dbmasteruser    false    234            �            1259    16677    contract_contract    TABLE     Z  CREATE TABLE public.contract_contract (
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
    terms_of_contract_2 character varying(100),
    created_at timestamp with time zone NOT NULL,
    purchased_slm boolean NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    student_auth_hash character varying(255),
    student_auth_signe_id integer,
    student_auth_signed boolean NOT NULL,
    student_auth_signed_timestamp timestamp with time zone
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
       public       dbmasteruser    false    227    3            ;           0    0 !   contract_contract_contract_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.contract_contract_contract_id_seq OWNED BY public.contract_contract.contract_id;
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
       public       dbmasteruser    false    3    264            <           0    0 $   dashboard_userdashboardmodule_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.dashboard_userdashboardmodule_id_seq OWNED BY public.dashboard_userdashboardmodule.id;
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
       public       dbmasteruser    false    250    3            =           0    0    data_wizard_identifier_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.data_wizard_identifier_id_seq OWNED BY public.data_wizard_identifier.id;
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
       public       dbmasteruser    false    3    252            >           0    0    data_wizard_range_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.data_wizard_range_id_seq OWNED BY public.data_wizard_range.id;
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
       public       dbmasteruser    false    254    3            ?           0    0    data_wizard_record_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.data_wizard_record_id_seq OWNED BY public.data_wizard_record.id;
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
       public       dbmasteruser    false    256    3            @           0    0    data_wizard_run_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.data_wizard_run_id_seq OWNED BY public.data_wizard_run.id;
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
       public       dbmasteruser    false    3    258            A           0    0    data_wizard_runlog_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.data_wizard_runlog_id_seq OWNED BY public.data_wizard_runlog.id;
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
       public       dbmasteruser    false    3    213            B           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
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
       public       dbmasteruser    false    3    199            C           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
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
       public       dbmasteruser    false    3    197            D           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
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
       public       dbmasteruser    false    266    3            E           0    0    jet_bookmark_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.jet_bookmark_id_seq OWNED BY public.jet_bookmark.id;
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
       public       dbmasteruser    false    270    3            F           0    0    jet_django_token_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.jet_django_token_id_seq OWNED BY public.jet_django_token.id;
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
       public       dbmasteruser    false    3    268            G           0    0    jet_pinnedapplication_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.jet_pinnedapplication_id_seq OWNED BY public.jet_pinnedapplication.id;
            public       dbmasteruser    false    267            �            1259    16793    school_class    TABLE     �   CREATE TABLE public.school_class (
    class_id integer NOT NULL,
    class_name text NOT NULL,
    class_unit character varying(500),
    enrollment_class_year integer NOT NULL,
    slm text,
    sku text
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
       public       dbmasteruser    false    237    3            H           0    0    school_class_class_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.school_class_class_id_seq OWNED BY public.school_class.class_id;
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
       public       dbmasteruser    false    3    239            I           0    0    school_class_students_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.school_class_students_id_seq OWNED BY public.school_class_students.id;
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
       public       dbmasteruser    false    241    3            J           0    0    school_class_teachers_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.school_class_teachers_id_seq OWNED BY public.school_class_teachers.id;
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
       public       dbmasteruser    false    245    3            K           0    0    school_school_chains_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.school_school_chains_id_seq OWNED BY public.school_school_chains.id;
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
       public       dbmasteruser    false    247    3            L           0    0    school_school_classes_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.school_school_classes_id_seq OWNED BY public.school_school_classes.id;
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
       public       dbmasteruser    false    276    3            M           0    0    school_school_parents_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.school_school_parents_id_seq OWNED BY public.school_school_parents.id;
            public       dbmasteruser    false    275            �            1259    16818    school_school_school_id_seq    SEQUENCE     �   CREATE SEQUENCE public.school_school_school_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.school_school_school_id_seq;
       public       dbmasteruser    false    243    3            N           0    0    school_school_school_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.school_school_school_id_seq OWNED BY public.school_school.school_id;
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
       public       dbmasteruser    false    3    272            O           0    0    school_school_students_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.school_school_students_id_seq OWNED BY public.school_school_students.id;
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
       public       dbmasteruser    false    274    3            P           0    0    school_school_teachers_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.school_school_teachers_id_seq OWNED BY public.school_school_teachers.id;
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
       public       dbmasteruser    false    215    3            Q           0    0    school_users_admin_admin_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.school_users_admin_admin_id_seq OWNED BY public.school_users_admin.admin_id;
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
       public       dbmasteruser    false    3    217            R           0    0    school_users_head_head_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.school_users_head_head_id_seq OWNED BY public.school_users_head.head_id;
            public       dbmasteruser    false    216            �            1259    16585    school_users_parent    TABLE     �  CREATE TABLE public.school_users_parent (
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
    tell_me_user_id integer,
    maple_bear_email text,
    maple_bear_password text,
    maple_bear_user_id text,
    maple_bear_username text
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
       public       dbmasteruser    false    3    219            S           0    0 !   school_users_parent_parent_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.school_users_parent_parent_id_seq OWNED BY public.school_users_parent.parent_id;
            public       dbmasteruser    false    218            �            1259    16596    school_users_student    TABLE     {  CREATE TABLE public.school_users_student (
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
    tell_me_user_id integer,
    birthday date,
    needs_parent boolean NOT NULL,
    third_parent_id integer,
    maple_bear_email text,
    maple_bear_password text,
    maple_bear_user_id text,
    maple_bear_username text
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
       public       dbmasteruser    false    221    3            T           0    0 #   school_users_student_student_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.school_users_student_student_id_seq OWNED BY public.school_users_student.student_id;
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
       public       dbmasteruser    false    223    3            U           0    0 )   school_users_supervisor_supervisor_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.school_users_supervisor_supervisor_id_seq OWNED BY public.school_users_supervisor.supervisor_id;
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
       public       dbmasteruser    false    225    3            V           0    0 #   school_users_teacher_teacher_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.school_users_teacher_teacher_id_seq OWNED BY public.school_users_teacher.teacher_id;
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
       public       dbmasteruser    false    3    260            W           0    0    sources_filesource_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.sources_filesource_id_seq OWNED BY public.sources_filesource.id;
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
       public       dbmasteruser    false    3    262            X           0    0    sources_urlsource_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.sources_urlsource_id_seq OWNED BY public.sources_urlsource.id;
            public       dbmasteruser    false    261            U           2604    16440    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    202    203    203            V           2604    16450    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    204    205    205            T           2604    16432    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    201    200    201            W           2604    16458    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    206    207    207            X           2604    16468    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    209    208    209            Y           2604    16476    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
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
       public       dbmasteruser    false    227    226    227            x           2604    17277     dashboard_userdashboardmodule id    DEFAULT     �   ALTER TABLE ONLY public.dashboard_userdashboardmodule ALTER COLUMN id SET DEFAULT nextval('public.dashboard_userdashboardmodule_id_seq'::regclass);
 O   ALTER TABLE public.dashboard_userdashboardmodule ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    264    263    264            m           2604    16973    data_wizard_identifier id    DEFAULT     �   ALTER TABLE ONLY public.data_wizard_identifier ALTER COLUMN id SET DEFAULT nextval('public.data_wizard_identifier_id_seq'::regclass);
 H   ALTER TABLE public.data_wizard_identifier ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    249    250    250            o           2604    16985    data_wizard_range id    DEFAULT     |   ALTER TABLE ONLY public.data_wizard_range ALTER COLUMN id SET DEFAULT nextval('public.data_wizard_range_id_seq'::regclass);
 C   ALTER TABLE public.data_wizard_range ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    252    251    252            p           2604    16993    data_wizard_record id    DEFAULT     ~   ALTER TABLE ONLY public.data_wizard_record ALTER COLUMN id SET DEFAULT nextval('public.data_wizard_record_id_seq'::regclass);
 D   ALTER TABLE public.data_wizard_record ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    253    254    254            s           2604    17006    data_wizard_run id    DEFAULT     x   ALTER TABLE ONLY public.data_wizard_run ALTER COLUMN id SET DEFAULT nextval('public.data_wizard_run_id_seq'::regclass);
 A   ALTER TABLE public.data_wizard_run ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    256    255    256            u           2604    17018    data_wizard_runlog id    DEFAULT     ~   ALTER TABLE ONLY public.data_wizard_runlog ALTER COLUMN id SET DEFAULT nextval('public.data_wizard_runlog_id_seq'::regclass);
 D   ALTER TABLE public.data_wizard_runlog ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    257    258    258            Z           2604    16536    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    212    213    213            S           2604    16422    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    199    198    199            R           2604    16411    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    196    197    197            {           2604    17290    jet_bookmark id    DEFAULT     r   ALTER TABLE ONLY public.jet_bookmark ALTER COLUMN id SET DEFAULT nextval('public.jet_bookmark_id_seq'::regclass);
 >   ALTER TABLE public.jet_bookmark ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    265    266    266                       2604    17352    jet_django_token id    DEFAULT     z   ALTER TABLE ONLY public.jet_django_token ALTER COLUMN id SET DEFAULT nextval('public.jet_django_token_id_seq'::regclass);
 B   ALTER TABLE public.jet_django_token ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    270    269    270            }           2604    17299    jet_pinnedapplication id    DEFAULT     �   ALTER TABLE ONLY public.jet_pinnedapplication ALTER COLUMN id SET DEFAULT nextval('public.jet_pinnedapplication_id_seq'::regclass);
 G   ALTER TABLE public.jet_pinnedapplication ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    267    268    268            g           2604    16796    school_class class_id    DEFAULT     ~   ALTER TABLE ONLY public.school_class ALTER COLUMN class_id SET DEFAULT nextval('public.school_class_class_id_seq'::regclass);
 D   ALTER TABLE public.school_class ALTER COLUMN class_id DROP DEFAULT;
       public       dbmasteruser    false    236    237    237            h           2604    16807    school_class_students id    DEFAULT     �   ALTER TABLE ONLY public.school_class_students ALTER COLUMN id SET DEFAULT nextval('public.school_class_students_id_seq'::regclass);
 G   ALTER TABLE public.school_class_students ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    239    238    239            i           2604    16815    school_class_teachers id    DEFAULT     �   ALTER TABLE ONLY public.school_class_teachers ALTER COLUMN id SET DEFAULT nextval('public.school_class_teachers_id_seq'::regclass);
 G   ALTER TABLE public.school_class_teachers ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    240    241    241            j           2604    16823    school_school school_id    DEFAULT     �   ALTER TABLE ONLY public.school_school ALTER COLUMN school_id SET DEFAULT nextval('public.school_school_school_id_seq'::regclass);
 F   ALTER TABLE public.school_school ALTER COLUMN school_id DROP DEFAULT;
       public       dbmasteruser    false    243    242    243            k           2604    16834    school_school_chains id    DEFAULT     �   ALTER TABLE ONLY public.school_school_chains ALTER COLUMN id SET DEFAULT nextval('public.school_school_chains_id_seq'::regclass);
 F   ALTER TABLE public.school_school_chains ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    244    245    245            l           2604    16842    school_school_classes id    DEFAULT     �   ALTER TABLE ONLY public.school_school_classes ALTER COLUMN id SET DEFAULT nextval('public.school_school_classes_id_seq'::regclass);
 G   ALTER TABLE public.school_school_classes ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    247    246    247            �           2604    17503    school_school_parents id    DEFAULT     �   ALTER TABLE ONLY public.school_school_parents ALTER COLUMN id SET DEFAULT nextval('public.school_school_parents_id_seq'::regclass);
 G   ALTER TABLE public.school_school_parents ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    275    276    276            �           2604    17443    school_school_students id    DEFAULT     �   ALTER TABLE ONLY public.school_school_students ALTER COLUMN id SET DEFAULT nextval('public.school_school_students_id_seq'::regclass);
 H   ALTER TABLE public.school_school_students ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    271    272    272            �           2604    17451    school_school_teachers id    DEFAULT     �   ALTER TABLE ONLY public.school_school_teachers ALTER COLUMN id SET DEFAULT nextval('public.school_school_teachers_id_seq'::regclass);
 H   ALTER TABLE public.school_school_teachers ALTER COLUMN id DROP DEFAULT;
       public       dbmasteruser    false    273    274    274            \           2604    16566    school_users_admin admin_id    DEFAULT     �   ALTER TABLE ONLY public.school_users_admin ALTER COLUMN admin_id SET DEFAULT nextval('public.school_users_admin_admin_id_seq'::regclass);
 J   ALTER TABLE public.school_users_admin ALTER COLUMN admin_id DROP DEFAULT;
       public       dbmasteruser    false    214    215    215            ]           2604    16577    school_users_head head_id    DEFAULT     �   ALTER TABLE ONLY public.school_users_head ALTER COLUMN head_id SET DEFAULT nextval('public.school_users_head_head_id_seq'::regclass);
 H   ALTER TABLE public.school_users_head ALTER COLUMN head_id DROP DEFAULT;
       public       dbmasteruser    false    217    216    217            ^           2604    16588    school_users_parent parent_id    DEFAULT     �   ALTER TABLE ONLY public.school_users_parent ALTER COLUMN parent_id SET DEFAULT nextval('public.school_users_parent_parent_id_seq'::regclass);
 L   ALTER TABLE public.school_users_parent ALTER COLUMN parent_id DROP DEFAULT;
       public       dbmasteruser    false    218    219    219            _           2604    16599    school_users_student student_id    DEFAULT     �   ALTER TABLE ONLY public.school_users_student ALTER COLUMN student_id SET DEFAULT nextval('public.school_users_student_student_id_seq'::regclass);
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
    public       dbmasteruser    false    203   gH      �          0    16447    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       dbmasteruser    false    205   �H      �          0    16429    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       dbmasteruser    false    201   �H      �          0    16455 	   auth_user 
   TABLE DATA               �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       dbmasteruser    false    207   M      �          0    16465    auth_user_groups 
   TABLE DATA               A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public       dbmasteruser    false    209   ��      �          0    16473    auth_user_user_permissions 
   TABLE DATA               P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       dbmasteruser    false    211   ��      �          0    16706    block_block 
   TABLE DATA               u   COPY public.block_block (index, id, time_stamp, data, hash, previous_hash, nonce, chain_id, contract_id) FROM stdin;
    public       dbmasteruser    false    229   �      �          0    16717    block_chain 
   TABLE DATA               ;   COPY public.block_chain (id, time_stamp, name) FROM stdin;
    public       dbmasteruser    false    231   ��      �          0    16725 
   block_peer 
   TABLE DATA               7   COPY public.block_peer (id, name, address) FROM stdin;
    public       dbmasteruser    false    233   ��      �          0    16738    block_transactions 
   TABLE DATA               f   COPY public.block_transactions (id, sender, receiver, amount, time_stamp, added_to_block) FROM stdin;
    public       dbmasteruser    false    235   ��      �          0    16677    contract_contract 
   TABLE DATA               �  COPY public.contract_contract (contract_id, name, date, all_signed, pdf, counter_signe_id, first_auth_signe_id, second_auth_signe_id, counter_signed, first_auth_signed, second_auth_signed, counter_signed_timestamp, first_auth_signed_timestamp, second_auth_signed_timestamp, class_id_sponte, class_name_sponte, closing_date_sponte, contract_free_class_id_sponte, contract_id_sponte, contract_number_sponte, contract_type_id, contractor_sponte, course_id_sponte, course_name_sponte, date_of_registration_sponte, end_date_sponte, financial_launched_sponte, initial_date_sponte, name_of_curricular_matrix_sponte, situation_id_sponte, situation_sponte, student_id_sponte, student_name_sponte, type_of_registration_sponte, counter_auth_hash, first_auth_hash, second_auth_hash, chain_id, terms_of_contract, slm, email_sent, student_name, sent_date, terms_of_contract_2, created_at, purchased_slm, updated_at, student_auth_hash, student_auth_signe_id, student_auth_signed, student_auth_signed_timestamp) FROM stdin;
    public       dbmasteruser    false    227   �                0    17274    dashboard_userdashboardmodule 
   TABLE DATA               �   COPY public.dashboard_userdashboardmodule (id, title, module, app_label, "user", "column", "order", settings, children, collapsed) FROM stdin;
    public       dbmasteruser    false    264   �                 0    16970    data_wizard_identifier 
   TABLE DATA               s   COPY public.data_wizard_identifier (id, serializer, name, field, value, attr_id, resolved, attr_field) FROM stdin;
    public       dbmasteruser    false    250   1                0    16982    data_wizard_range 
   TABLE DATA               �   COPY public.data_wizard_range (id, type, header_col, start_col, end_col, header_row, start_row, end_row, count, identifier_id, run_id) FROM stdin;
    public       dbmasteruser    false    252   �                0    16990    data_wizard_record 
   TABLE DATA               q   COPY public.data_wizard_record (id, object_id, "row", success, fail_reason, content_type_id, run_id) FROM stdin;
    public       dbmasteruser    false    254                   0    17003    data_wizard_run 
   TABLE DATA               t   COPY public.data_wizard_run (id, record_count, loader, serializer, object_id, content_type_id, user_id) FROM stdin;
    public       dbmasteruser    false    256   �a                0    17015    data_wizard_runlog 
   TABLE DATA               E   COPY public.data_wizard_runlog (id, event, date, run_id) FROM stdin;
    public       dbmasteruser    false    258   Eb      �          0    16533    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       dbmasteruser    false    213   �f      �          0    16419    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       dbmasteruser    false    199   ��      �          0    16408    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       dbmasteruser    false    197   h�                0    16957    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       dbmasteruser    false    248   (�                0    17287    jet_bookmark 
   TABLE DATA               H   COPY public.jet_bookmark (id, url, title, "user", date_add) FROM stdin;
    public       dbmasteruser    false    266   /�      !          0    17349    jet_django_token 
   TABLE DATA               H   COPY public.jet_django_token (id, project, token, date_add) FROM stdin;
    public       dbmasteruser    false    270   ��                0    17296    jet_pinnedapplication 
   TABLE DATA               P   COPY public.jet_pinnedapplication (id, app_label, "user", date_add) FROM stdin;
    public       dbmasteruser    false    268   ��                 0    16793    school_class 
   TABLE DATA               i   COPY public.school_class (class_id, class_name, class_unit, enrollment_class_year, slm, sku) FROM stdin;
    public       dbmasteruser    false    237   B�                0    16804    school_class_students 
   TABLE DATA               I   COPY public.school_class_students (id, class_id, student_id) FROM stdin;
    public       dbmasteruser    false    239   G�                0    16812    school_class_teachers 
   TABLE DATA               I   COPY public.school_class_teachers (id, class_id, teacher_id) FROM stdin;
    public       dbmasteruser    false    241   ��                0    16820    school_school 
   TABLE DATA               �   COPY public.school_school (school_id, school_name, head_id, city, country, sponte_client_number, state, adminorsupervisor_id, sponte_token, tell_me_school_id, app_name) FROM stdin;
    public       dbmasteruser    false    243   ��                0    16831    school_school_chains 
   TABLE DATA               G   COPY public.school_school_chains (id, school_id, chain_id) FROM stdin;
    public       dbmasteruser    false    245   ��      
          0    16839    school_school_classes 
   TABLE DATA               H   COPY public.school_school_classes (id, school_id, class_id) FROM stdin;
    public       dbmasteruser    false    247   �      '          0    17500    school_school_parents 
   TABLE DATA               I   COPY public.school_school_parents (id, school_id, parent_id) FROM stdin;
    public       dbmasteruser    false    276   ]�      #          0    17440    school_school_students 
   TABLE DATA               K   COPY public.school_school_students (id, school_id, student_id) FROM stdin;
    public       dbmasteruser    false    272   z�      %          0    17448    school_school_teachers 
   TABLE DATA               K   COPY public.school_school_teachers (id, school_id, teacher_id) FROM stdin;
    public       dbmasteruser    false    274   ��      �          0    16563    school_users_admin 
   TABLE DATA               Y   COPY public.school_users_admin (admin_id, name, profile_id, tell_me_user_id) FROM stdin;
    public       dbmasteruser    false    215   ��      �          0    16574    school_users_head 
   TABLE DATA               W   COPY public.school_users_head (head_id, name, profile_id, tell_me_user_id) FROM stdin;
    public       dbmasteruser    false    217   ��      �          0    16585    school_users_parent 
   TABLE DATA               �  COPY public.school_users_parent (parent_id, name, authorised, profile_id, relationship, address_number_sponte, address_sponte, bithday_sponte, cell_phone_sponte, cep_sponte, city_sponte, cpf_or_cnpj_sponte, gender_sponte, kind_of_person, neighborhood_sponte, note_sponte, responsible_id_sponte, rg_sponte, telephone_sponte, tell_me_user_id, maple_bear_email, maple_bear_password, maple_bear_user_id, maple_bear_username) FROM stdin;
    public       dbmasteruser    false    219   *�      �          0    16596    school_users_student 
   TABLE DATA               �  COPY public.school_users_student (student_id, name, profile_id, first_parent_id, second_parent_id, "RA_sponte", address_number_sponte, address_sponte, bithday_sponte, cell_phone_sponte, cep_sponte, city_sponte, course_of_interest_sponte, cpf_sponte, current_class_id, didatic_responsible_id_sponte, financial_responsible_id_sponte, gender_sponte, hometown_sponte, midia_sponte, neighborhood_sponte, note_sponte, origin_sponte, original_name_sponte, overdue_sponte, register_date_sponte, registration_number_sponte, rg_sponte, situation_sponte, student_id_sponte, telephone_sponte, tell_me_user_id, birthday, needs_parent, third_parent_id, maple_bear_email, maple_bear_password, maple_bear_user_id, maple_bear_username) FROM stdin;
    public       dbmasteruser    false    221   ~      �          0    16607    school_users_supervisor 
   TABLE DATA               c   COPY public.school_users_supervisor (supervisor_id, name, profile_id, tell_me_user_id) FROM stdin;
    public       dbmasteruser    false    223   �W      �          0    16618    school_users_teacher 
   TABLE DATA                 COPY public.school_users_teacher (teacher_id, name, profile_id, add_on_address_sponte, address_number_sponte, address_sponte, admission_date_sponte, bithday_sponte, cell_phone_sponte, cep_sponte, city_sponte, cpf_sponte, employee_id_sponte, gender_sponte, hometown_sponte, job_role_sponte, maritial_status_sponte, neighborhood_sponte, note_sponte, pis_sponte, registration_number_spontet, resignation_date_sponte, rg_sponte, situation_sponte, telephone_sponte, work_register_booklet, tell_me_user_id) FROM stdin;
    public       dbmasteruser    false    225   X                0    17071    sources_filesource 
   TABLE DATA               B   COPY public.sources_filesource (id, name, file, date) FROM stdin;
    public       dbmasteruser    false    260   .X                0    17079    sources_urlsource 
   TABLE DATA               @   COPY public.sources_urlsource (id, name, url, date) FROM stdin;
    public       dbmasteruser    false    262   Y      Y           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       dbmasteruser    false    202            Z           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       dbmasteruser    false    204            [           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 120, true);
            public       dbmasteruser    false    200            \           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
            public       dbmasteruser    false    208            ]           0    0    auth_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.auth_user_id_seq', 1246, true);
            public       dbmasteruser    false    206            ^           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, true);
            public       dbmasteruser    false    210            _           0    0    block_block_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.block_block_id_seq', 317, true);
            public       dbmasteruser    false    228            `           0    0    block_chain_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.block_chain_id_seq', 42, true);
            public       dbmasteruser    false    230            a           0    0    block_peer_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.block_peer_id_seq', 1, false);
            public       dbmasteruser    false    232            b           0    0    block_transactions_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.block_transactions_id_seq', 1, false);
            public       dbmasteruser    false    234            c           0    0 !   contract_contract_contract_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.contract_contract_contract_id_seq', 127, true);
            public       dbmasteruser    false    226            d           0    0 $   dashboard_userdashboardmodule_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.dashboard_userdashboardmodule_id_seq', 20, true);
            public       dbmasteruser    false    263            e           0    0    data_wizard_identifier_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.data_wizard_identifier_id_seq', 144, true);
            public       dbmasteruser    false    249            f           0    0    data_wizard_range_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.data_wizard_range_id_seq', 212, true);
            public       dbmasteruser    false    251            g           0    0    data_wizard_record_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.data_wizard_record_id_seq', 3311, true);
            public       dbmasteruser    false    253            h           0    0    data_wizard_run_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.data_wizard_run_id_seq', 17, true);
            public       dbmasteruser    false    255            i           0    0    data_wizard_runlog_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.data_wizard_runlog_id_seq', 172, true);
            public       dbmasteruser    false    257            j           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 303, true);
            public       dbmasteruser    false    212            k           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 37, true);
            public       dbmasteruser    false    198            l           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 94, true);
            public       dbmasteruser    false    196            m           0    0    jet_bookmark_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.jet_bookmark_id_seq', 1, true);
            public       dbmasteruser    false    265            n           0    0    jet_django_token_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.jet_django_token_id_seq', 1, true);
            public       dbmasteruser    false    269            o           0    0    jet_pinnedapplication_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.jet_pinnedapplication_id_seq', 1, true);
            public       dbmasteruser    false    267            p           0    0    school_class_class_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.school_class_class_id_seq', 42, true);
            public       dbmasteruser    false    236            q           0    0    school_class_students_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.school_class_students_id_seq', 2443, true);
            public       dbmasteruser    false    238            r           0    0    school_class_teachers_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.school_class_teachers_id_seq', 14, true);
            public       dbmasteruser    false    240            s           0    0    school_school_chains_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.school_school_chains_id_seq', 42, true);
            public       dbmasteruser    false    244            t           0    0    school_school_classes_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.school_school_classes_id_seq', 42, true);
            public       dbmasteruser    false    246            u           0    0    school_school_parents_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.school_school_parents_id_seq', 1, false);
            public       dbmasteruser    false    275            v           0    0    school_school_school_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.school_school_school_id_seq', 38, true);
            public       dbmasteruser    false    242            w           0    0    school_school_students_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.school_school_students_id_seq', 3628, true);
            public       dbmasteruser    false    271            x           0    0    school_school_teachers_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.school_school_teachers_id_seq', 6, true);
            public       dbmasteruser    false    273            y           0    0    school_users_admin_admin_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.school_users_admin_admin_id_seq', 3, true);
            public       dbmasteruser    false    214            z           0    0    school_users_head_head_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.school_users_head_head_id_seq', 28, true);
            public       dbmasteruser    false    216            {           0    0 !   school_users_parent_parent_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.school_users_parent_parent_id_seq', 1116, true);
            public       dbmasteruser    false    218            |           0    0 #   school_users_student_student_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.school_users_student_student_id_seq', 1233, true);
            public       dbmasteruser    false    220            }           0    0 )   school_users_supervisor_supervisor_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.school_users_supervisor_supervisor_id_seq', 8, true);
            public       dbmasteruser    false    222            ~           0    0 #   school_users_teacher_teacher_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.school_users_teacher_teacher_id_seq', 147, true);
            public       dbmasteruser    false    224                       0    0    sources_filesource_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.sources_filesource_id_seq', 4, true);
            public       dbmasteruser    false    259            �           0    0    sources_urlsource_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sources_urlsource_id_seq', 1, true);
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
       public         dbmasteruser    false    227                       2606    17284 @   dashboard_userdashboardmodule dashboard_userdashboardmodule_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.dashboard_userdashboardmodule
    ADD CONSTRAINT dashboard_userdashboardmodule_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.dashboard_userdashboardmodule DROP CONSTRAINT dashboard_userdashboardmodule_pkey;
       public         dbmasteruser    false    264                        2606    16979 2   data_wizard_identifier data_wizard_identifier_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.data_wizard_identifier
    ADD CONSTRAINT data_wizard_identifier_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.data_wizard_identifier DROP CONSTRAINT data_wizard_identifier_pkey;
       public         dbmasteruser    false    250                       2606    16987 (   data_wizard_range data_wizard_range_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.data_wizard_range
    ADD CONSTRAINT data_wizard_range_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.data_wizard_range DROP CONSTRAINT data_wizard_range_pkey;
       public         dbmasteruser    false    252                       2606    17000 *   data_wizard_record data_wizard_record_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.data_wizard_record
    ADD CONSTRAINT data_wizard_record_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.data_wizard_record DROP CONSTRAINT data_wizard_record_pkey;
       public         dbmasteruser    false    254                       2606    17012 $   data_wizard_run data_wizard_run_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.data_wizard_run
    ADD CONSTRAINT data_wizard_run_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.data_wizard_run DROP CONSTRAINT data_wizard_run_pkey;
       public         dbmasteruser    false    256                       2606    17020 *   data_wizard_runlog data_wizard_runlog_pkey 
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
       public         dbmasteruser    false    248                       2606    17293    jet_bookmark jet_bookmark_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.jet_bookmark
    ADD CONSTRAINT jet_bookmark_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.jet_bookmark DROP CONSTRAINT jet_bookmark_pkey;
       public         dbmasteruser    false    266                       2606    17354 &   jet_django_token jet_django_token_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jet_django_token
    ADD CONSTRAINT jet_django_token_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jet_django_token DROP CONSTRAINT jet_django_token_pkey;
       public         dbmasteruser    false    270                       2606    17302 0   jet_pinnedapplication jet_pinnedapplication_pkey 
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
       public         dbmasteruser    false    247    247            *           2606    17505 0   school_school_parents school_school_parents_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.school_school_parents
    ADD CONSTRAINT school_school_parents_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.school_school_parents DROP CONSTRAINT school_school_parents_pkey;
       public         dbmasteruser    false    276            -           2606    17517 M   school_school_parents school_school_parents_school_id_parent_id_86902fda_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.school_school_parents
    ADD CONSTRAINT school_school_parents_school_id_parent_id_86902fda_uniq UNIQUE (school_id, parent_id);
 w   ALTER TABLE ONLY public.school_school_parents DROP CONSTRAINT school_school_parents_school_id_parent_id_86902fda_uniq;
       public         dbmasteruser    false    276    276            �           2606    16828     school_school school_school_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.school_school
    ADD CONSTRAINT school_school_pkey PRIMARY KEY (school_id);
 J   ALTER TABLE ONLY public.school_school DROP CONSTRAINT school_school_pkey;
       public         dbmasteruser    false    243                       2606    17445 2   school_school_students school_school_students_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.school_school_students
    ADD CONSTRAINT school_school_students_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.school_school_students DROP CONSTRAINT school_school_students_pkey;
       public         dbmasteruser    false    272                        2606    17465 P   school_school_students school_school_students_school_id_student_id_494d2d60_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.school_school_students
    ADD CONSTRAINT school_school_students_school_id_student_id_494d2d60_uniq UNIQUE (school_id, student_id);
 z   ALTER TABLE ONLY public.school_school_students DROP CONSTRAINT school_school_students_school_id_student_id_494d2d60_uniq;
       public         dbmasteruser    false    272    272            #           2606    17453 2   school_school_teachers school_school_teachers_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.school_school_teachers
    ADD CONSTRAINT school_school_teachers_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.school_school_teachers DROP CONSTRAINT school_school_teachers_pkey;
       public         dbmasteruser    false    274            &           2606    17479 P   school_school_teachers school_school_teachers_school_id_teacher_id_f232f5e5_uniq 
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
       public         dbmasteruser    false    225                       2606    17076 *   sources_filesource sources_filesource_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.sources_filesource
    ADD CONSTRAINT sources_filesource_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.sources_filesource DROP CONSTRAINT sources_filesource_pkey;
       public         dbmasteruser    false    260                       2606    17084 (   sources_urlsource sources_urlsource_pkey 
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
       public         dbmasteruser    false    227            �           1259    17664 0   contract_contract_student_auth_signe_id_11e3f081    INDEX        CREATE INDEX contract_contract_student_auth_signe_id_11e3f081 ON public.contract_contract USING btree (student_auth_signe_id);
 D   DROP INDEX public.contract_contract_student_auth_signe_id_11e3f081;
       public         dbmasteruser    false    227                       1259    17026 (   data_wizard_range_identifier_id_95d321ae    INDEX     o   CREATE INDEX data_wizard_range_identifier_id_95d321ae ON public.data_wizard_range USING btree (identifier_id);
 <   DROP INDEX public.data_wizard_range_identifier_id_95d321ae;
       public         dbmasteruser    false    252                       1259    17063 !   data_wizard_range_run_id_9710f2b9    INDEX     a   CREATE INDEX data_wizard_range_run_id_9710f2b9 ON public.data_wizard_range USING btree (run_id);
 5   DROP INDEX public.data_wizard_range_run_id_9710f2b9;
       public         dbmasteruser    false    252                       1259    17032 +   data_wizard_record_content_type_id_f2a3c06c    INDEX     u   CREATE INDEX data_wizard_record_content_type_id_f2a3c06c ON public.data_wizard_record USING btree (content_type_id);
 ?   DROP INDEX public.data_wizard_record_content_type_id_f2a3c06c;
       public         dbmasteruser    false    254                       1259    17057 "   data_wizard_record_run_id_fac342f0    INDEX     c   CREATE INDEX data_wizard_record_run_id_fac342f0 ON public.data_wizard_record USING btree (run_id);
 6   DROP INDEX public.data_wizard_record_run_id_fac342f0;
       public         dbmasteruser    false    254            	           1259    17048 (   data_wizard_run_content_type_id_70de43ee    INDEX     o   CREATE INDEX data_wizard_run_content_type_id_70de43ee ON public.data_wizard_run USING btree (content_type_id);
 <   DROP INDEX public.data_wizard_run_content_type_id_70de43ee;
       public         dbmasteruser    false    256                       1259    17050     data_wizard_run_user_id_c1617f52    INDEX     _   CREATE INDEX data_wizard_run_user_id_c1617f52 ON public.data_wizard_run USING btree (user_id);
 4   DROP INDEX public.data_wizard_run_user_id_c1617f52;
       public         dbmasteruser    false    256                       1259    17056 "   data_wizard_runlog_run_id_4614c618    INDEX     c   CREATE INDEX data_wizard_runlog_run_id_4614c618 ON public.data_wizard_runlog USING btree (run_id);
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
       public         dbmasteruser    false    243            (           1259    17519 (   school_school_parents_parent_id_f34599ba    INDEX     o   CREATE INDEX school_school_parents_parent_id_f34599ba ON public.school_school_parents USING btree (parent_id);
 <   DROP INDEX public.school_school_parents_parent_id_f34599ba;
       public         dbmasteruser    false    276            +           1259    17518 (   school_school_parents_school_id_113b4447    INDEX     o   CREATE INDEX school_school_parents_school_id_113b4447 ON public.school_school_parents USING btree (school_id);
 <   DROP INDEX public.school_school_parents_school_id_113b4447;
       public         dbmasteruser    false    276                       1259    17466 )   school_school_students_school_id_e95bbfe4    INDEX     q   CREATE INDEX school_school_students_school_id_e95bbfe4 ON public.school_school_students USING btree (school_id);
 =   DROP INDEX public.school_school_students_school_id_e95bbfe4;
       public         dbmasteruser    false    272            !           1259    17467 *   school_school_students_student_id_61838cd1    INDEX     s   CREATE INDEX school_school_students_student_id_61838cd1 ON public.school_school_students USING btree (student_id);
 >   DROP INDEX public.school_school_students_student_id_61838cd1;
       public         dbmasteruser    false    272            $           1259    17480 )   school_school_teachers_school_id_d04b5901    INDEX     q   CREATE INDEX school_school_teachers_school_id_d04b5901 ON public.school_school_teachers USING btree (school_id);
 =   DROP INDEX public.school_school_teachers_school_id_d04b5901;
       public         dbmasteruser    false    274            '           1259    17481 *   school_school_teachers_teacher_id_4ab46e3c    INDEX     s   CREATE INDEX school_school_teachers_teacher_id_4ab46e3c ON public.school_school_teachers USING btree (teacher_id);
 >   DROP INDEX public.school_school_teachers_teacher_id_4ab46e3c;
       public         dbmasteruser    false    274            �           1259    17125 -   school_users_student_first_parent_id_acb7705a    INDEX     y   CREATE INDEX school_users_student_first_parent_id_acb7705a ON public.school_users_student USING btree (first_parent_id);
 A   DROP INDEX public.school_users_student_first_parent_id_acb7705a;
       public         dbmasteruser    false    221            �           1259    17131 .   school_users_student_second_parent_id_e515b80e    INDEX     {   CREATE INDEX school_users_student_second_parent_id_e515b80e ON public.school_users_student USING btree (second_parent_id);
 B   DROP INDEX public.school_users_student_second_parent_id_e515b80e;
       public         dbmasteruser    false    221            �           1259    17646 -   school_users_student_third_parent_id_39dd180f    INDEX     y   CREATE INDEX school_users_student_third_parent_id_39dd180f ON public.school_users_student USING btree (third_parent_id);
 A   DROP INDEX public.school_users_student_third_parent_id_39dd180f;
       public         dbmasteruser    false    221            0           2606    16493 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       dbmasteruser    false    201    3981    205            /           2606    16488 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       dbmasteruser    false    205    3986    203            .           2606    16479 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       dbmasteruser    false    201    3976    199            2           2606    16508 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       dbmasteruser    false    3986    203    209            1           2606    16503 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       dbmasteruser    false    209    207    3994            4           2606    16522 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       dbmasteruser    false    211    201    3981            3           2606    16517 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       dbmasteruser    false    207    211    3994            E           2606    16746 ;   block_block block_block_chain_id_c6a27d9f_fk_block_chain_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.block_block
    ADD CONSTRAINT block_block_chain_id_c6a27d9f_fk_block_chain_id FOREIGN KEY (chain_id) REFERENCES public.block_chain(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.block_block DROP CONSTRAINT block_block_chain_id_c6a27d9f_fk_block_chain_id;
       public       dbmasteruser    false    231    229    4053            F           2606    16752 9   block_block block_block_contract_id_aee9622f_fk_contract_    FK CONSTRAINT     �   ALTER TABLE ONLY public.block_block
    ADD CONSTRAINT block_block_contract_id_aee9622f_fk_contract_ FOREIGN KEY (contract_id) REFERENCES public.contract_contract(contract_id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.block_block DROP CONSTRAINT block_block_contract_id_aee9622f_fk_contract_;
       public       dbmasteruser    false    4045    227    229            C           2606    17542 G   contract_contract contract_contract_chain_id_c4fbc2de_fk_block_chain_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract_contract
    ADD CONSTRAINT contract_contract_chain_id_c4fbc2de_fk_block_chain_id FOREIGN KEY (chain_id) REFERENCES public.block_chain(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.contract_contract DROP CONSTRAINT contract_contract_chain_id_c4fbc2de_fk_block_chain_id;
       public       dbmasteruser    false    4053    227    231            B           2606    17430 J   contract_contract contract_contract_counter_signe_id_7fd8d63d_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract_contract
    ADD CONSTRAINT contract_contract_counter_signe_id_7fd8d63d_fk_school_us FOREIGN KEY (counter_signe_id) REFERENCES public.school_users_head(head_id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.contract_contract DROP CONSTRAINT contract_contract_counter_signe_id_7fd8d63d_fk_school_us;
       public       dbmasteruser    false    4019    217    227            @           2606    17114 M   contract_contract contract_contract_first_auth_signe_id_54114955_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract_contract
    ADD CONSTRAINT contract_contract_first_auth_signe_id_54114955_fk_school_us FOREIGN KEY (first_auth_signe_id) REFERENCES public.school_users_parent(parent_id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.contract_contract DROP CONSTRAINT contract_contract_first_auth_signe_id_54114955_fk_school_us;
       public       dbmasteruser    false    4023    227    219            A           2606    17120 N   contract_contract contract_contract_second_auth_signe_id_6bdf03a9_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract_contract
    ADD CONSTRAINT contract_contract_second_auth_signe_id_6bdf03a9_fk_school_us FOREIGN KEY (second_auth_signe_id) REFERENCES public.school_users_parent(parent_id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.contract_contract DROP CONSTRAINT contract_contract_second_auth_signe_id_6bdf03a9_fk_school_us;
       public       dbmasteruser    false    219    227    4023            D           2606    17665 N   contract_contract contract_contract_student_auth_signe_i_11e3f081_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract_contract
    ADD CONSTRAINT contract_contract_student_auth_signe_i_11e3f081_fk_school_us FOREIGN KEY (student_auth_signe_id) REFERENCES public.school_users_student(student_id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.contract_contract DROP CONSTRAINT contract_contract_student_auth_signe_i_11e3f081_fk_school_us;
       public       dbmasteruser    false    227    4028    221            Q           2606    17021 G   data_wizard_range data_wizard_range_identifier_id_95d321ae_fk_data_wiza    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_wizard_range
    ADD CONSTRAINT data_wizard_range_identifier_id_95d321ae_fk_data_wiza FOREIGN KEY (identifier_id) REFERENCES public.data_wizard_identifier(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.data_wizard_range DROP CONSTRAINT data_wizard_range_identifier_id_95d321ae_fk_data_wiza;
       public       dbmasteruser    false    250    4096    252            R           2606    17064 I   data_wizard_range data_wizard_range_run_id_9710f2b9_fk_data_wizard_run_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_wizard_range
    ADD CONSTRAINT data_wizard_range_run_id_9710f2b9_fk_data_wizard_run_id FOREIGN KEY (run_id) REFERENCES public.data_wizard_run(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.data_wizard_range DROP CONSTRAINT data_wizard_range_run_id_9710f2b9_fk_data_wizard_run_id;
       public       dbmasteruser    false    252    4107    256            S           2606    17027 K   data_wizard_record data_wizard_record_content_type_id_f2a3c06c_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_wizard_record
    ADD CONSTRAINT data_wizard_record_content_type_id_f2a3c06c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.data_wizard_record DROP CONSTRAINT data_wizard_record_content_type_id_f2a3c06c_fk_django_co;
       public       dbmasteruser    false    254    3976    199            T           2606    17058 K   data_wizard_record data_wizard_record_run_id_fac342f0_fk_data_wizard_run_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_wizard_record
    ADD CONSTRAINT data_wizard_record_run_id_fac342f0_fk_data_wizard_run_id FOREIGN KEY (run_id) REFERENCES public.data_wizard_run(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.data_wizard_record DROP CONSTRAINT data_wizard_record_run_id_fac342f0_fk_data_wizard_run_id;
       public       dbmasteruser    false    254    256    4107            U           2606    17033 E   data_wizard_run data_wizard_run_content_type_id_70de43ee_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_wizard_run
    ADD CONSTRAINT data_wizard_run_content_type_id_70de43ee_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.data_wizard_run DROP CONSTRAINT data_wizard_run_content_type_id_70de43ee_fk_django_co;
       public       dbmasteruser    false    3976    256    199            V           2606    17043 @   data_wizard_run data_wizard_run_user_id_c1617f52_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_wizard_run
    ADD CONSTRAINT data_wizard_run_user_id_c1617f52_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.data_wizard_run DROP CONSTRAINT data_wizard_run_user_id_c1617f52_fk_auth_user_id;
       public       dbmasteruser    false    256    3994    207            W           2606    17051 K   data_wizard_runlog data_wizard_runlog_run_id_4614c618_fk_data_wizard_run_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_wizard_runlog
    ADD CONSTRAINT data_wizard_runlog_run_id_4614c618_fk_data_wizard_run_id FOREIGN KEY (run_id) REFERENCES public.data_wizard_run(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.data_wizard_runlog DROP CONSTRAINT data_wizard_runlog_run_id_4614c618_fk_data_wizard_run_id;
       public       dbmasteruser    false    258    256    4107            5           2606    16543 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       dbmasteruser    false    3976    213    199            6           2606    16548 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       dbmasteruser    false    207    213    3994            G           2606    16845 I   school_class_students school_class_student_class_id_8f6f64de_fk_school_cl    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_class_students
    ADD CONSTRAINT school_class_student_class_id_8f6f64de_fk_school_cl FOREIGN KEY (class_id) REFERENCES public.school_class(class_id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.school_class_students DROP CONSTRAINT school_class_student_class_id_8f6f64de_fk_school_cl;
       public       dbmasteruser    false    239    237    4062            H           2606    16850 K   school_class_students school_class_student_student_id_4d3556b2_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_class_students
    ADD CONSTRAINT school_class_student_student_id_4d3556b2_fk_school_us FOREIGN KEY (student_id) REFERENCES public.school_users_student(student_id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.school_class_students DROP CONSTRAINT school_class_student_student_id_4d3556b2_fk_school_us;
       public       dbmasteruser    false    4028    239    221            I           2606    16859 I   school_class_teachers school_class_teacher_class_id_348acaea_fk_school_cl    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_class_teachers
    ADD CONSTRAINT school_class_teacher_class_id_348acaea_fk_school_cl FOREIGN KEY (class_id) REFERENCES public.school_class(class_id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.school_class_teachers DROP CONSTRAINT school_class_teacher_class_id_348acaea_fk_school_cl;
       public       dbmasteruser    false    241    237    4062            J           2606    16864 K   school_class_teachers school_class_teacher_teacher_id_444b6861_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_class_teachers
    ADD CONSTRAINT school_class_teacher_teacher_id_444b6861_fk_school_us FOREIGN KEY (teacher_id) REFERENCES public.school_users_teacher(teacher_id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.school_class_teachers DROP CONSTRAINT school_class_teacher_teacher_id_444b6861_fk_school_us;
       public       dbmasteruser    false    4038    241    225            K           2606    17402 F   school_school school_school_adminorsupervisor_id_49840b13_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school
    ADD CONSTRAINT school_school_adminorsupervisor_id_49840b13_fk_school_us FOREIGN KEY (adminorsupervisor_id) REFERENCES public.school_users_supervisor(supervisor_id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.school_school DROP CONSTRAINT school_school_adminorsupervisor_id_49840b13_fk_school_us;
       public       dbmasteruser    false    243    4034    223            N           2606    16884 M   school_school_chains school_school_chains_chain_id_1d7d2a2d_fk_block_chain_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_chains
    ADD CONSTRAINT school_school_chains_chain_id_1d7d2a2d_fk_block_chain_id FOREIGN KEY (chain_id) REFERENCES public.block_chain(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.school_school_chains DROP CONSTRAINT school_school_chains_chain_id_1d7d2a2d_fk_block_chain_id;
       public       dbmasteruser    false    245    231    4053            M           2606    16879 I   school_school_chains school_school_chains_school_id_959d4273_fk_school_sc    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_chains
    ADD CONSTRAINT school_school_chains_school_id_959d4273_fk_school_sc FOREIGN KEY (school_id) REFERENCES public.school_school(school_id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.school_school_chains DROP CONSTRAINT school_school_chains_school_id_959d4273_fk_school_sc;
       public       dbmasteruser    false    243    245    4078            P           2606    16898 I   school_school_classes school_school_classe_class_id_9366e2a1_fk_school_cl    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_classes
    ADD CONSTRAINT school_school_classe_class_id_9366e2a1_fk_school_cl FOREIGN KEY (class_id) REFERENCES public.school_class(class_id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.school_school_classes DROP CONSTRAINT school_school_classe_class_id_9366e2a1_fk_school_cl;
       public       dbmasteruser    false    237    247    4062            O           2606    16893 J   school_school_classes school_school_classe_school_id_dbc35c01_fk_school_sc    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_classes
    ADD CONSTRAINT school_school_classe_school_id_dbc35c01_fk_school_sc FOREIGN KEY (school_id) REFERENCES public.school_school(school_id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.school_school_classes DROP CONSTRAINT school_school_classe_school_id_dbc35c01_fk_school_sc;
       public       dbmasteruser    false    243    4078    247            L           2606    17407 I   school_school school_school_head_id_fa8cc5b4_fk_school_users_head_head_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school
    ADD CONSTRAINT school_school_head_id_fa8cc5b4_fk_school_users_head_head_id FOREIGN KEY (head_id) REFERENCES public.school_users_head(head_id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.school_school DROP CONSTRAINT school_school_head_id_fa8cc5b4_fk_school_users_head_head_id;
       public       dbmasteruser    false    4019    243    217            ]           2606    17511 J   school_school_parents school_school_parent_parent_id_f34599ba_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_parents
    ADD CONSTRAINT school_school_parent_parent_id_f34599ba_fk_school_us FOREIGN KEY (parent_id) REFERENCES public.school_users_parent(parent_id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.school_school_parents DROP CONSTRAINT school_school_parent_parent_id_f34599ba_fk_school_us;
       public       dbmasteruser    false    276    4023    219            \           2606    17506 J   school_school_parents school_school_parent_school_id_113b4447_fk_school_sc    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_parents
    ADD CONSTRAINT school_school_parent_school_id_113b4447_fk_school_sc FOREIGN KEY (school_id) REFERENCES public.school_school(school_id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.school_school_parents DROP CONSTRAINT school_school_parent_school_id_113b4447_fk_school_sc;
       public       dbmasteruser    false    243    276    4078            X           2606    17454 K   school_school_students school_school_studen_school_id_e95bbfe4_fk_school_sc    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_students
    ADD CONSTRAINT school_school_studen_school_id_e95bbfe4_fk_school_sc FOREIGN KEY (school_id) REFERENCES public.school_school(school_id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.school_school_students DROP CONSTRAINT school_school_studen_school_id_e95bbfe4_fk_school_sc;
       public       dbmasteruser    false    243    272    4078            Y           2606    17459 L   school_school_students school_school_studen_student_id_61838cd1_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_students
    ADD CONSTRAINT school_school_studen_student_id_61838cd1_fk_school_us FOREIGN KEY (student_id) REFERENCES public.school_users_student(student_id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.school_school_students DROP CONSTRAINT school_school_studen_student_id_61838cd1_fk_school_us;
       public       dbmasteruser    false    4028    221    272            Z           2606    17468 K   school_school_teachers school_school_teache_school_id_d04b5901_fk_school_sc    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_teachers
    ADD CONSTRAINT school_school_teache_school_id_d04b5901_fk_school_sc FOREIGN KEY (school_id) REFERENCES public.school_school(school_id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.school_school_teachers DROP CONSTRAINT school_school_teache_school_id_d04b5901_fk_school_sc;
       public       dbmasteruser    false    274    243    4078            [           2606    17473 L   school_school_teachers school_school_teache_teacher_id_4ab46e3c_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_school_teachers
    ADD CONSTRAINT school_school_teache_teacher_id_4ab46e3c_fk_school_us FOREIGN KEY (teacher_id) REFERENCES public.school_users_teacher(teacher_id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.school_school_teachers DROP CONSTRAINT school_school_teache_teacher_id_4ab46e3c_fk_school_us;
       public       dbmasteruser    false    274    225    4038            7           2606    16917 I   school_users_admin school_users_admin_profile_id_63c45b75_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_users_admin
    ADD CONSTRAINT school_users_admin_profile_id_63c45b75_fk_auth_user_id FOREIGN KEY (profile_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.school_users_admin DROP CONSTRAINT school_users_admin_profile_id_63c45b75_fk_auth_user_id;
       public       dbmasteruser    false    3994    207    215            8           2606    16924 G   school_users_head school_users_head_profile_id_1d5b9e68_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_users_head
    ADD CONSTRAINT school_users_head_profile_id_1d5b9e68_fk_auth_user_id FOREIGN KEY (profile_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.school_users_head DROP CONSTRAINT school_users_head_profile_id_1d5b9e68_fk_auth_user_id;
       public       dbmasteruser    false    3994    207    217            9           2606    16931 K   school_users_parent school_users_parent_profile_id_2f551006_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_users_parent
    ADD CONSTRAINT school_users_parent_profile_id_2f551006_fk_auth_user_id FOREIGN KEY (profile_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.school_users_parent DROP CONSTRAINT school_users_parent_profile_id_2f551006_fk_auth_user_id;
       public       dbmasteruser    false    3994    219    207            ;           2606    17487 O   school_users_student school_users_student_first_parent_id_acb7705a_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_users_student
    ADD CONSTRAINT school_users_student_first_parent_id_acb7705a_fk_school_us FOREIGN KEY (first_parent_id) REFERENCES public.school_users_parent(parent_id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.school_users_student DROP CONSTRAINT school_users_student_first_parent_id_acb7705a_fk_school_us;
       public       dbmasteruser    false    221    219    4023            :           2606    16938 M   school_users_student school_users_student_profile_id_79899508_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_users_student
    ADD CONSTRAINT school_users_student_profile_id_79899508_fk_auth_user_id FOREIGN KEY (profile_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.school_users_student DROP CONSTRAINT school_users_student_profile_id_79899508_fk_auth_user_id;
       public       dbmasteruser    false    221    3994    207            <           2606    17547 P   school_users_student school_users_student_second_parent_id_e515b80e_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_users_student
    ADD CONSTRAINT school_users_student_second_parent_id_e515b80e_fk_school_us FOREIGN KEY (second_parent_id) REFERENCES public.school_users_parent(parent_id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.school_users_student DROP CONSTRAINT school_users_student_second_parent_id_e515b80e_fk_school_us;
       public       dbmasteruser    false    221    4023    219            =           2606    17647 O   school_users_student school_users_student_third_parent_id_39dd180f_fk_school_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_users_student
    ADD CONSTRAINT school_users_student_third_parent_id_39dd180f_fk_school_us FOREIGN KEY (third_parent_id) REFERENCES public.school_users_parent(parent_id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.school_users_student DROP CONSTRAINT school_users_student_third_parent_id_39dd180f_fk_school_us;
       public       dbmasteruser    false    221    4023    219            >           2606    16945 S   school_users_supervisor school_users_supervisor_profile_id_ff81a803_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_users_supervisor
    ADD CONSTRAINT school_users_supervisor_profile_id_ff81a803_fk_auth_user_id FOREIGN KEY (profile_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.school_users_supervisor DROP CONSTRAINT school_users_supervisor_profile_id_ff81a803_fk_auth_user_id;
       public       dbmasteruser    false    3994    223    207            ?           2606    16952 M   school_users_teacher school_users_teacher_profile_id_1c32fe9e_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_users_teacher
    ADD CONSTRAINT school_users_teacher_profile_id_1c32fe9e_fk_auth_user_id FOREIGN KEY (profile_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.school_users_teacher DROP CONSTRAINT school_users_teacher_profile_id_1c32fe9e_fk_auth_user_id;
       public       dbmasteruser    false    225    207    3994            �      xڋ���� � �      �      xڋ���� � �      �   e  x�m�ێ�0������ʱ����J+�)*�Y��o�Cl3������vq�~7ө��8��i[�]�B�7�����L��pI����͂�$`	����3X\�Jʞ��9��0O.i��k-΀�N��ϰ$P�W�hHШ�[R��̯�+@ <���q�t�iM��Br�� ��t���~q%��>+�����������r6��hL^���<m��N���w(���Ⳬ��I��oZ׎'}���"sG�\�fI���� �"��C:f�.�K��@�*!���qn�z������'-�_3B:Qvf 4PZ\�<L�W�}a\�y�5D���BD���L�ڃ�nT��fEiK���#Pٺ Utj]̐�2�Iq�4�ڴ[��Յ���/���8i�;���;H��Q*/�yPmiqs;6k��yC�Kc���!c|��<d�����yq����yt6j�|iL,�Q��BqE��,7ӗ��[��HM)ƾ:�;c�!��{��!��.�\jAH�ӛ�3�A�_�'�Dc���C��|"@������\�M;>�ʸ��$	�j&H �r1��x̊k��:�˰c�k�[A��2��K�(�]a���P��^؂)����@l`欃�c3�=,��q��
_�:/.��,+�b�lQ��h�fK�HE+G[�*R\��M{M6�N��g+��&s�݊�fɜr���E2#.�:��ʱ�ˊ��[��iڸ��$R�WU	�����X�.�^����H �#�TDbH1�R(/հ���t.�^����Z��e*A(�B��aPR�+|c��f|OI�����c^y��xp���8����C�o��pfD `�Nc���Ha�� "N~�P��ki��aێK��o��;��i�xy��J�gg��r+~~-c"�Ӈ��g[��E�[�GE+�[�EVf�:u�z���;}��k{.i�J9L���~�:ܯf�����g��W����+�vZ;|A��~n�Z{���g�<\��7�yՔ��x&�T�Fy6T�qFLM	�4�������`8��2*���p+[����n��8ح��ý�-r�SM&�\A#IB�#L��)Av�`��K��sB���?����ME      �      xڜ�Y��Ƒ5���W�Ao2a{�f�YQE-��Ҍ욕�2QU��LT�Rd�������3Rw��.�_���ҍu�*�-�����y�7B����x������|�Ӯ��{�s�Fv��eg)�τ���_�Z������L#�P��l�s�8��q?�����n|�#��ǟb��D�1�	�m�	c�����Ձ�fڎ���i?m���kkK�z�;Փ�l^>l���y���\����������ߞ��?�"�__�?��Wz����}��߾��_|g��q��o6���__�/<}�ӯO�}���u�g��B�/�j���:��a|�&��/wo㩙��?�:�3�!�´}�m/ö����
��[)Aj��x�o�is�_�>"������>0�Mg:�|om�6�$p���4?�͸�O�t/ǹ��¶����������?>�������������O��Y�}��?��<���_�w��o^���_~�m_����_��*���a?������۟�>���g��B�/�o{��i~z��o�~�����|�˿���/������?_�!�_���ߧ��O�����_�����~?N����7Oi���x���Ƿ�4��xx���7e%\_�⒅���?����׿=w��a��~�w�������O�ث�������}����~�����o������o��~�״�|x%>�O,Bu_���V;��?��KSY�{OΏ��|k�Eʶ3FyEn�k����Z�qT��O��=Ƈv8~��u�Z!��:pM�3��t��J/�ϐ�#D�}x���J�V@:"O�t�7�
�]����4���8m��i7��N(�J�_L-��O\�>����~%�ߩ�����]����_?~�+�կ���O������;��{���4��z���_��>�����ߪ)u��~&��vAsh�@1�;)�i)	��ߟO�ֿ�S�3����V�������_����?>����W���>>������/����_��4}�Q~������~7��;~�{�:#���I|��<���pvTg�r�V8~�4<�n�����]<L�8�^i�L֯ �-2�v���<���iZ%4�*N[�������P��=B���n�~h=-��R렑�k��U0�.�����������tN���p)���o���頽}�<%!�g�$�lm���>.������j��%�X~;�ϗ�w)Z�Y'w��l+���Fe;������NԿ����RhK��t?)3���o�_�G�����G��ǿtӇ�����ۯ>���o�o��|��?���/��������_v�τ�!�¸V)a���w��f:��cI��.�y9A�H��J�Q�t<�&�|A����e<�?��4m*��u��� ^��e�n�i�;k�'�mrY/��G�<�v�|������&ڮ���5���������[[�6�PpGH� >�Sf9�%�+��q�n�+����s&l����\��Re���z�0���n��w���
k`�֪�:�4�I�8�����i�U�-��Z��>
��X%�a�6�wAX�}���c=��L�8��6���}���s����������^�A���-U�/(	y��~�3�n�K!������i����Q��~��o�:K�9�]\�o�㔥5�g��^���\_,�b��:�!��}tK�Q���e�R:�֪`�hc�5F�R@	�.Y��@�� ��m�7��4�]����l� %*ȵ����ロǭ ���q?a�C}K4��30%���Qd�az�AI������|�Η�.Y�~!�������ő�̂]���6���4��`y�����Aw�ьa_`h
���%+!��a?���n��U���:6��:Ьj�$&���ai�x~X/��]�#�@`�Ό�ؠ���i?�U���C�}\�����[<���4/�����~��G�=�W�o�H����0����l��b��S��/�-�z4���r�jY�	8:��Mo�t�N|�ml�÷������
B��.��0��=���z�/:�Z�YD��U�pX��K���r����x<З�j��![�xZ�����/�&�л̶�[rSZ�)��X��b�a��2�<�+!��0n��=ܰnɍQ��ϊF/l�s�y�(g3�NSUPz��.)0��]��Ŕ/�������-���#��a��j��_��u:~%!1?]��sŇ�7�Pq6n44Cu��8>����-��[-۾�.��5t�zC��v�Bx��i><�#}��p ���=ˌ�`�������r�0�o��?�7�(��`��c{� ӭV� 0�������v<���p?�������t���2̈o�`:(X��nq�VBӤ(o�a�*?Bt_t�������A�|�1�Q��m��a�A@|�[%_�:�}��8����O
}��a8���X��*��.r'�^=�aI��8�ӻ��;��7�b׹zX��i�-����C`�DL��OO��w��s�iD�-�����@}���\/�5����a�V�b�o;jꠐ��l�*��.l�Ф�:G�o',�gY+s($��y3q��O��V �Q��q�1����^d?�$�t7��3D����W�d��cF!�*�$���:��lݷ�޺t�|cDC9�.� �-�kX�{s�a[�nc�/��:������������O??�V����������_�5~_���t�4�y���wR��O�n�\��?
�A?b�>s	_�\\��w�����80�O��zRRj�=.������w����?������7���V�q|��w��K��O�����J���~��x��?̟���S���gB �e���$gY�xҒ�?7������n8>L۟:7q�NN<�p>��rf.=7��q�tS�ȯ���`:lIG�����b�B8-��5ނs� ,F���:B�g�"�#���vn��uM$3�Ⱥ(���!yL�`�����q�o����N�>�WM� '��sb
��|�l6SmŲkeH��v��h�sƶ$,+��}�����۴
f98_�0COt�V�9|-���������eD����脆�"u��s+!�~�D�WN�=���&Q,��'Ghq�V�a3\����k��¡G�0}ԣ��Aځҷ(qS���ʵoy+�@����N-1xI�\w������y>�i�"����1c���BxC;�ÄP�8<N8��q(��pe�%�b��J��ErD�^<����t��sUn$�\Ha����@�����J��=�d�?D���>|"����?�$ܘ@%[�Z��b ���p�Uq�WB<��ih���6��C���|���szT�ձ.	���O!�z�DZ>�����4u�������t9��ʠ����vJZ� �"�lA`n���je���>��=/$cD�܈�������SH�Tv\�D��Ag&����'���A�0w_�m[�kD�L��38����Bp3��;�1p��&�iDǫ m��z!��O���r�/�X��*&(�����y��X��a{e��w�^�.F��S�`�����[Q�����������]������׊�����qܿ�ףh�f-�����M��5.�=�����p�-��v�n�ސ�c�no��BT���,/+!��<0�Z��B����R�k��¾��O�]����2��p
����wD:���ȴپ�-�4-����4���;CQ�m[�ly���R=����/��q�4�.��t9���x�Ɉo�,7����0�u�$�s�j�J�X�"dR#R�i��SZ��؆��xS���I��J:�*��e/
B`?���#4}�썄#obQث�E[�'�sAh���'fV��j�ᧉ�O!t�+0:�zq�V���_��͜-��GƦ��<�m���m�G�����k]ߛ����� ]�s��^p���'p�;o.�����������a��	��e�%=3J�:a	�Ƈ    �J�4zg�OG��J�^�b&8M"���Wl�OS};�j;��}�N���{b֠+��^��yޏ!^Y1�;�ŢNV��.*����yş�?����M�Cx�
�߰�%��+!�ڬ8�/������)���3���f��:�a�ݷ��걶~��Mre�Eϓ�k��J��G^��� Ҏ�m��I�w+y�l_�̈́p`��lNC{�/����}� �N';i� 	)甞��.���U����x����r�r�cbNx��{��U�sސ�yw��j��0�,G� ^lKh�Vu�V��q>VS��yX#xU���N�|�=N�r�C9��m�ߝ��C4?���g�@T���wvIפ�i��ј��o��d�T�:�ӹ��$4M|��x���
*�ѥ��,G�i	�cߒ �:���Sŝ1�$���'C�'�p���b�?�� �0De��X�V�.&�ﵵqN���lzIH������ߦ�p{�JxYɶ*�>� ���^ܻ���#�����Dv3����`eN�`y�R���P�x`��a���S�?d޲�*[���%jI�q����O�5[��1��y-�\��a����:gB��6��p!:l��a:�q�g��+�7ƭuλt^|�0_.���7�p.{�p=�k	#K�T��>����p@`
�_�V�?�^�/�C}c�Qkş8��A��pq�����r��E��\�	����:_�+�Z8|��L���� V�Z߾KY!�6��ŝA�������?�|7֗K�k!�QyhZE^ �����(،��qܽUJ:�~�Q��C�o���g��kx���c}����ɺ>-�4�i��=��[soᶁ	�ix����x�\�kf8Q'�w�[8�~M/���=mNmŎ�2�)��td�C�i��4�[RߎBq��������<��*h|��g5�Q�]3����b�D԰��+���M����	��5����Sb���A�����,�R�?|ݽ�q�i����F\��&�s�5N�z�7�#F�o�*C�ԷP�.�0
#�.���J	�R��x���{�j\��N�ď���O�
�$p����oie+�h��t2	 ��{�p�璠�����on�v0��Ms�A�3�X��,	���'�z��ь���)+����@���w�c-�h���J���i(�|����D�P��з^�.Y<1�Je�|ĂY���<�U������s_@)��5Y(�$wW#D��F�u�?��C1��PY��X �]��J���y�q7�����FP�ӹ�tHa�Ԓ䑡����67��!�Z��O������s�w�a?�n���6jz���Bΰ����[�x�<Crx��e�"	l��iG�w��H�AC�.dw��g����J<˔�=l�ukL\ޛ�ֹ�b��3�e�R�����Yz&��p�8��iX*Q��$�ui�]�3d;�pL`�{��f��+�}K�!q��-I��gp|�Y�j�jt�g��c�R�b�B�e��i?��_^��{����p�^�3�9�u&6�;ٰ5�����O=N4�T�6M�������8<U���U�Z��$��]S׹�2� d���X՗,T�2-Y5��� ��V���N� :Ǟ��r�(��1K�!�[�:	� v�1��ֹ�lI�?QG������v�����dn���]4?�61��uK��J�M�f�p��&#`nZ�;��:�y�p�r-�g�ha��j�?����yzC��:������1�L���y��G����J�ƌ��i�����ek��\�_�PF�
9=3�u<������x،ǻ���y��bE�Ve��7$��� 0L���ñz�ѳ#�B�4��:��w�[ V'&������.uJɦwJ�U�Лj�k��Z��\M�k)�Q@X���B%��[R +!�����ц�^�,���I���%�a��[r>smW��H�O��g(vEŴ�����x<��q�j��d�X<�������KU2��p�v!�Uco����r������j�	���tG��Mٟ�>I%|���q�J5����UV��q3��Pڛ���ce:������s��^	��ag~`5�q7�׏�-la���h��e;��K�&�>�O�#(���N�v��)����>������fB�P_"o��&��<�ŉ�i���t�j�JpV8�^EE�
��>*��م���~�1�6UX��w������0��Er��[	Pt`|�?V����G)�MP����wZuh&�UO��aq*{-(�R�"e�Yc�y��r�W��l�S���cHgT�#)7��{ �"x꽶K�k%�����O���� ��=I|�o��e���7�����5C��&]H D���H�ٕ
+�ݲׯ���MjJ��}�Q���	�Cgϣ $�[���n����j[j"{�_M,���o%���=�Sw��! cI/�sv���K���G����~���Ulj�y���Mω�nz��<�y��7�b	�d)L��<FfK�}%$��7��N�~~:�]�3v%K)C��N�&b�qPz���"􂀗<AE� ��k_e(���1�,��l�7�FI��w�q"�ָ�.�����X%�q���$�͙O��A���ܥ�Z	ϟ���g�s���gj�8"���ޥ��!�@��ŕ.�1B;Sg����O-�k!rV.>CD.O�ff�Ʊ���"9L,x����N�s�+!�0��At]���煳�u�]�M���|{�!3g�x�M���܆��OkE���*b�,�Xe�.ovI��Cz��r@������(�
?>�����Yi��Y���\�P�yE���ڴ��Ơ[@&BӜ6�jڏl!2�aL{n�2"����w��V��,6Cҹ	-@�P�I8�����x�N�� 2Fd���=2���Z�Xv-�̄���m3����^�_���!͂C���^^���ww��vE�*�^i])��[�gy}Z��?m��j7�z��1�D!Xz������>Gv��5�l�MK3VyNr59�/8��E|_��{KK9mJe��`[��w� ���Cg�m8V��,�L���l(�Z/�3�f�����:��r��YG�9���?�Ee^ͯ��ۢ�%5e1z�j�r/��RzY��qw��o`n�w��w#]�C�e�=� 8��i8������bn5E�z����$
i{f3Ͻ ��3��x�a۟���)*}JC�o�	U>��L��iw��VuX��s՝
%�,��v������|�SgOIѩ.A�лisǃ���(n&zK#�k������NwZ%m�$���k�axf`??�x��Ė���P��B*�Nkc���%!��=�J�����}e�����`l%�e�dQ�9UY^W��8Ʒ:ly&
M:���ȥ���Pg��ņ�G8��i??P��^aMx�VY:��5Kӄ�I���X�/�k{l3���.$5�Ax����!;w�����z�T/D��^��FKIW8��+!���q�s�7�� �IPzv�,���i�aC��@dl|�aN˅mF��C(V����4܏�i�KO�A�_2�c��Џ`����zɫ,������|�lB(
���%���x��͕�d��m��;ތ@�5�@4`�=)	l�ߏ�#�+��T�泻�������n�����.w�!�ƜP/�X�WY�vm�XL�ai�R��tR
����$�i�����V]#jAmY�%:�� �$�5��= �mG·�<Z}�k�O�������;#�x�do���qK�q4E^�e��B�.��K�\���Y02�"XR��kU�Tr��c���;�~�� �����ƕ�&8{�FM�ͅA
K���r%�+��<��as��&��!>�"�0I!p��Z�B(��w��X[=�MXsO���U�S7���r��~E�`m	a.�|�=����� �x��쥸lk����)�54�̸�^�~iY]�>>]N��zL�k=�E��1t~{XhCt��/���x�k��ߔh'G�V԰��E��/�+�    x?���!�T�C��3S��6=CC�\��y��6��t*�;��J����h��C�VUR�"O�2�#ӇB�\	����0��cH���c]F�e�"��tćb�%� �Wޟ�ѧ��@� <��+��r����Ҳ�>�K6�$�b���X[=��r}�쒕Q=0��s�$�(A��V��6k��$�,���x��f�����?�A8Zlp�)��%bH���/� E�����ݶp�S
��8��(�Z���p!,�[���=�����	b�62D:���nV�S�׫1��O�������tF�qY`JB^��a��:T�[��&XI� ���÷$�V��|_�Ȗޖ���ò#n�K�`|�,ww���'��|�H]T۾g�p�[��p!��K=Ku���K�w<a�;�������(�s�s���k�)��N�А�R�#q�����P�R<M1~l*g�+������e�c��q'޵�IK�R��V��r�p� 6۷�`�|�$1�^�Mת JX	�P�R�E��@�EݱY_��U�����[��s�!;T�&-������`�'����aϧ��&
��u���"n���Ɂ����է�U�ЉT&��v-ϼ������CW��5d�Џ%Ƈ�(�����N/�t�g·�_�hA���h��K�Ui�r�<ߪ��z��MP��Wpi�BӼ Th� [2�	�>�LB(�!�DH�܄���mڶ��O�{�O�����7��F ��}d�_��.!�a3 Z�ԗiW��9k,<B�ga,���n:�YC�-��>��β��JvwJ#q��M�J2�r�A��V��o�v��@���7�	�;ڥ��˒��h���~�/O!USmu'S@���c���KɎ�厥 p�����Z!齱],}D@��)$v),�cE��+Vy{���B���U�'�ڬ�V��%���mS�HUHP��0��=ш�����dIXx�67����,����J<�n��+���5!� $(�����<c"=�`�>�C}��3O���pP�O���~��Å��u�R���J�to��
�c���4��aw7�]��!��lN���1���|*E`�T�h�$Op�^0Q@�𞉔�{5��7�~�[kT�tjD�#~P+�yA�.O�>��i7?̟�9Rz6;�F2rI ��!by+s�^��o���E��7\m�z�	�0=m��P�i���i�2t�$��-	d�t⌀s%�J��x��j:f����n�L s�w��r��W���,����
�[(���.��=�˸kcY��U�}��)m�i�v����8���#:�w��,�>�C�Gգ:�X��2J�軌�=����tϾ�R&�r@u�<wm�]	�;�q?�B���tu��U��0�;z���k햬�JX��q'�3�'7O��@�L#U�c/�#�����<n0TW�	�P門\���Q���T��a*\���T)T>ϚBKLV=t��ED&��#��}H(�o��7&޲A����gp|�xapz��c���Y^B5����r_A c(��� w������K.����{]��
B�=�V�P��K�+
�|4�kv�ց� 35�çKu钲͡	i�?-�(	�2U%�+g����;��h{D�i�dJ
�ט�$Dާ�[ 1ɼo{�����^- ��K=�/��8>U���W[�Υ]��3����s`y�<�+T�tR�������� DƼם_n���V`J�p��F�hxg�9(+!1gz���?r��~~����7@���G$eC�
��>{E%�|Cn�nh��[��0�_�B�9̟_+�_��[V�h��:����*�[k�t�_*�jx1K&� ���]�r�u���AHf�@� �r�x���q؏��`*�tAI:E+�x�Z�+_��i�χ�x�*m�NQ0H�B��R��������2x��#�� ��JW��9�-HPR��,�+��vo7���P��I6��w�l��� �6ĝ�K,m�ښo`kZ��6�Oa�/��}AX�>�狶�;��'�3ZL�`�E��xc�[�xT�󃋓��)%9b�4�39�G8l��;������a�%���P/�az��K_0��y7lF�p5
�ؘ���;p�qx�`� ,3l>�7N�vq�����;e�=��;e|x�Il�Ap����,��g0=Bb����x3�uj|+�(Ų�}ǆ�e�[AH�[��m�7��N�6$�~vD�(�KWB~�ld��ѵl~J#�T�@�/ M�[��~����� ���j�U��İ�ۢJ����ǯ�%���̙n�_����!��y7&l��ɰ�7g%�e�:�wBږ{)Ҫ���E�)b����C ���0M�D�q�C�i�4'L��Oq�Nh;>>�����<�+<m+���%��
/�:��}�B!���pD$��s[K|n��1?��[sȕO������"����X�i�c�u��-*�kax�j���rZ�p�y�lC��P�نS���o�a���� �k�����!A��]�B�ڪKǵ'X�`���tY"��a�0ߐ
2L�O=���?vbI�g�|cu�m���W���q�p�����!A�����	�y�ٌW_ 6�D�E�G��Y눕��9���T���pJ|�4�'����^�}B��ʮھ�B�I�e�F8
m��dJ���a�!�@%�k��k�I�"¶�>=۹��o8�_��o�*CO)��$�ي���븅�n`�yf�I6���lmV,�ޙ� �=������ᘯe�aA�/�Z�d[k!;����A�s���M�>Ȭ��s�>X��1��q�yJ2��́������aa}G���땵�Z=��1k��95�nW0����LOx�1D�l��a��V������w�]m/�"��Ѷ[��mʳ�W^B��mЍ�?����gpmO�}}��	��t�Z�q�\�+!.vގLЇ}`����Y")Ǘ���g�)���!0�y	�A�9~���P��ٲ��4��e
�JH��̮BIbe�´�h��,�91��y��	��zZ3 �y�lrmDf��z�
Bz��0'���� ���V�u��l�|�[����6�l��j;ʁ�?kP�:��B���r;m-Xs�6�,��bq���{�Naa��<�ս	�|
^q��q���E)�F���tc~8mj�!�na�N#��l�������q ��q�	G�0"�vHgQ%�EE,͎s�O]��V����p��ߵX�N�7��+�,I�׋+�G�X��W�pm��0f�a���9LN/'�-��� �Pd,�����Dp�2Y8����͒�3:�8p��C���ؔ�������E+	y#�������p�wφF����ϙ����k�X������!�3|�T�!\l����Z6�+����{�6����h���qH�����bM����u޿:����B�tK��A��=�Y��p���=�9����0ioq�4Ԅ) V�"ǻ3K�>zC-Wfl	mk������.��E��q*�iZ��A��� Y���a�t���q�&:A�k5U(Ń3'�!f'U/��̑ej�JX~�Lm����jN7��� w���m�!���t&B�x�G$�-��ǽ&��6`66I�����m9޲"���Ƥ�Q��L��*u�(8�F�?��Lxy�����< s��-�� ���\	oCBCkU �1tK�Z=Q֕��=]�k�nN���aPN�����\����-V%1oB-+�ڞRh��~�=�K%�-gv�}��'�@�����b����E�.Y*�||�p  r�x�>_[�b�}�o��9��g4)�ڈ��`��*	����h{�kݫ���<�9S8��;�ac�K�i%�ۋ���}�k_�%=��z��x�TBΕXn�V^����P��f��G�J�?%J�u6O��{l�y�kM�    8췳)ޥ�'�e���7�	U�P_ �j��XBA\6������VT����Þ�׍��G������(X~�K-��R	vp��:J�r��
:�aF.{�� �y̖��^�c��^��<��&����#���[�[�]��X ѡ@�W�Ė.S0˭���ץ�	�0�7����UZ2��\�y�s�?�n��[E���/�/��0�!��VB^�q?<o��p���x��{�T��������������v2%�C�L��%)z����x�g^�W�R�{k��l{Ӗ��աT3��7�t�����E��ݱ�X!��ƯǙ�Y?��w__��-�b/!�T���4�Ifم��q�|Ǿ��L���PF/�2�e�mA�,�ᰙN�y��Be>��0j��o��tVc��ܵ��9|���TEJԡ>���.-�VQ,	��\,v�� ��J�>z��׳��~�e�XA(w�G�un�ŋ�e2�O��q�M��<�!�����[H{Ll�._�V[C��!�F�i��qF|y?�N7�U�-a_c!$G�Au���� ��t!�ʽ轪/T�Y��Ei���L6����4�ˆ��awݒ���0b��xl8��e�`Ke�S��0^��A��16�����ӆ�b^ �ϵ{!����&�'�D���^�iJ��v&4��x>��uz�6V��-�c6�Eμ�0�_��}�mڌ�~�<��EKf��'�R�@~ ���=M��iP���'�`�2���q=�
L��_z_;S[� .)ⶨ�d�X�
��"TBq�Ĵ�o*#S�bKM,Q�%yh��[|���� �]�)��G�)�U0s������p�+=�dH���%!�>��j�s\#T�4^~�1T�� �h/�l'8L��YB�|d���/u���̼(sf��0�@v;l��k���%�Ϝa4�������ljW�O?��'��Ek�J�9nG���n�$���R�3��^c}ѻX���T��ں�a�5�v�ژ*j�U���Цq�5Ύ]��ǰ|�3���`�����p�kvD1]�[X�����9�K�eKJB2R�:x����E�����2@�"��ZK^p�v���J78�:��%�"xp�aY+e
B�>e�vK��g���	�i�XC�-�-���T��<?oT�JՊc�lޏ�L��
��xA�6/������Pb�X��2=g$������Q1�ā#�O�a�eYfF�\	���T������X��t~Q��lOS(�xO���[sb!4~�	�xͰ�1��$��XN���>ny��^�<%��d�)>������5�0�>}|���uߥ-g�T�'c\�����p%�{�9Է� nF�6tVֲ<pIr���v�=�.�p�����LGxi��W������:�eR���p��k�LGpu�l�k�j��$4��1\�V��X��î���¹˺UB'����Zu�Z�^^�F8A���1�Q�#�ܪ��"�8�u�g���K;I���S�\���<���tӾE��Sak��]���D��*o�ᛚJ���w�cy�0u�!�}7�X3T�D־����g!>g���>V�ݰ���h:��խR�Ko�J�6���eW[��[F#��¼ş�,�(�����u3����K�ȗ�)ˡ�YR
º!�,���rC��$p����j�T��J�&��qW\�T6�<p�1|��A�TG�n�#]	�w���<ݲf���|�|�VǙ&p��.����ul��4��/�'v|��F*�A�VZ�J��orS���_�_ְ����.�g������H0@FGu�}k�h�KC+��ߦXD_�I	��=b���㈘4���bp�B ���)��lg��n���8�?�7��Y�5+V(�OP�0���B49A=�]����~5��i����B�����	��A{F�!d�c�R.{)	 O�7���ӷ*��0_��)��8+�9�L��Oz��05+�s��f��7kj�pk���-	L[�wC���|{��&�ӎCJe���ž<<��,!��Qڝ�3�D�jI��c��Xg�!XL:0�nM��*�l2���ʉ�u��r'}����i�������+�/8�w�����W�4! Z�e�O�.�A��%� 4��0m��}�P;��^�Ԧ�
5��+FA ����0���r���+�����ɪ��p�tW�@�P���&�Lm� ��ɒac=��c�
%�a���0 v2D�[Je>�%�yU6�c�_��+�a/������gl�+�|ST�v���(EU��0��)��tM��� ��.�h�1��s6c�U�k�~�eLH=�'�h���X������%A�����%�Y��a%�ö%P������;Ϝu��!X�-�[�Mw�a�:D]���%;�q�����/#�P�t��������g32B���XZ��2��	o<�����y��.:+�|N�PK`������j?����|�1����pu5dx������ �l�|�a81u� E����h+e҅*GIѩ��ZB�� ��}(��Dt�����8�1�����e�����x��$��X���Br�Y������(+�>���O5Μ%�A���޻���&<j����-��f�������X���L�n����T�T$pMfH�3�F���OĒ�@�Y��UB���[$R��pI��R�Z"�6U�@�����6V�Ak�
�E&״{A�o��C�\}��sm�K4���`�߮C2�C���!�_�5G�Z�&���N3k�[��ݚ�ْ0��IEw�t���.;L�<�C�9G��ke_�K.���
��ئg0;���	P��i�:̢�zyw9IQ�Ah?� �ǁ`�����O��R���7���t�;:\�2>��tb�ɱ>�X�a�B�͵t�b̮�����B
&q�?;���{&�U���A5�E�2<>��ih��a�a���3n���2�qcW0ʂX?���͡�o+��a<m�;�ҖpT��d��u���k�P�3=�^G�GH2>m���*	�����wG���|�Ӂ�/�g�e��X�8l�F�j������Ύmz��wG��q��Cq
-���R��)�/ƌ��P�	y�;��c_�N�5�&���Xւf�����a��>E~���% ��/ �7�m�o�n�I���4��1����K�w&}CJ�bɝ)
�VM��V~��z����=4��������;fc�����а[7M�6�e�,�䗏Y�z?RүaD�-�����ȶP)X�_1Eپ�Nuո�ĉ����Ț�5�p~�/`�b��A�T.�M�G�Y�QoHN�!\��%!�~���&֗�y��/���b� ��4=���phO����-�$��d����s�8����� �0|6܋�S�QK�n|�<��X¤Փˁ��W���H� n5��!=���U�P'�zp��,x{��2� ���~���ʜ�g-X"s � E�AAh��a��2���}��eò��f@� *��R�Y����
܈���tZ{���آ�f�������&L��}��fTDh3LQ.���!�;�_kke�=l\�h3������M��C����ކ1C��]}��E�t�g{��X���2�N�m�/�B}�0������}bi�/M;2l>���v��B,uN���ι��h1��l����Qvӥ�0�1���ֲ�XO�`��T��I��A+�@<	���ϒ�4��/r��l6u8i�C%�.�X+iBX�封K~�6��Z�b&����E2-�B�9�v$�f����u���y�m����X�[�O��-Z�JG@�b�+\������-�[=�
��B쐹RFCޮ��1o�@���|M��(+�b,�,������$'�
�	��K��3��H]�w���i�W�;�M��>n�`��s��9�~GX�����&���K E�����İ�|%���}?����x�TՄJ?�|��fA[hc2E��J��!B�9S_y��V"�++gx5�?.    V/�~V�Ő��Y�v�5��s�G(�����~?l���,��e��e�|d�b6�<��2+��B����uu(�	�}��JN(�/b�x�=(	���Uj'�����l8��cW��]㇅W��	e�W9��;�lf��'���ܪ�!���k_�j��	�v�X/��JtJ�O���4�߆3�A� ��|��%�S!���S�X��4Ԅ�,/�<��-0]&ű-8�o�0t���%D��^^O�sȵW��g�D������K'=ǅ�����g#^�nB-�ÿ�Dab8�	V�-NLA�zo(�$_׺�������>c��g��9�6$_�	�|��vW�M\|'R�.��e��%�뜡���ٌ�� 0�*NF|m�'aٗ��X	�;���ݦޢB�8��ג��$#�:�e%�����&�t}�u@׋T�aXע$��U�E�2�i���4£ױ��X8�Zs�l�;�������<!p�A5,�O��`]�����ҧ��^½TU�k�5숊�AƆ��}���(	�}���#��$�e�����4]��hp%�u���unu�%�+M��4��QG�8�K����a7?�vDE��d��oxrOWz��rh��UԬxU�K	x���P�bm�/��_��]�i��s,��V��?�x~��
��}�,j�T
{
����[�R�Gl�+��l[����a�.wtʝd�����_%���߆]}$9����j´%E0��$������y�w[�ǰ�>}��2�#q���V� ��#S�:�9� v+�l@��;�����_u�3����a������Lqx���̵�R�[b��0�aK��=˱���b!����x���au�%���7��P,J�J$<��=_������؎���_�8��r������e���Tjj���~��-���t,=�~nؼ�����'�[}��aL#C+]���yS�n�x�p3ڕ"Oɉ�.�N�<��ǊfEs,�W��H/��]��:�x�Yb���4�j��$Ħ��Ya��Zm���
ߚ-���Qm�6�4�Y+����
��K���Mf	�+cl�ԕ_J��KP��<u���gX��9!|]/�7�&γ�"�@�p�_1���8�v_�;aZű�����c9�⥃� ��a��~��9�s@#�At�el���4?�r�üc tm����	���̐8Kvx'�؆�w/Wo�'���թ��E/BI�9��� p��t_9����mk��*9�0�8�C6�Q)l����(���0cÈ{3mI(/!��i�$+d��pǇ	q�k�6�Jٓ^7�W܆~�)�8.�!�Eo�U�F��sM��J�>G���%rð��$�j�al�mLY�M{6��b+pfp2��㴃Z�aJ��78��G�EY�Y����t��aW�/h�a���z�1���)ƀ������scW²?w��e8Oo�U�B��#0N'1�	i���@����yf�{	d6�k#8�>h0��2��K6���ݺ`��M��0�V� �D��1,Xȳ
�s�{9l����O�V�fg�NH�σ��H��S���Cmu���V��]k��e��?� �h\�C�##&Q��"�:�� �K�����m��+xiƺ��+j��C�Gⲛ󡫬�>qӲ)����Ē�l�isw�\���>{����J'�5��T�~X����>�s�����4wķ�<}c�E�
����bhy�e5i�}���ׂ!#�ۜxf_�j>@�N��AˁHa3�֒�(���4O��&�d�H�'V����ʯM��7�n<�:V�8��]2���u�o�F�Ъ$�u���8�6`��㕥3s���'D�dϒx]	����8��Y�[*�����Y����{�����4�3����V�s�{N�+�7���R�l0Y�&
B`<�ԔQ_�����(r�TEp��o�eB�J�߉X�Z[6yNa�n�%,g&�r� 4�����~���~�͗��S��?��L�i����pf5�����ە����<\����;��NykMZx&���o����8�Ĝi<��+C?�}�K�LA�: <a����CRO8�
G'楝ZG����0��_�4a�-�.��ы&��~���\_����V��f�'rv��&��2�H���+!,x�}b�V�T]�$��N%qM�`p�����?�~�ЦA�}m���ǒd�V��Q��� ��q�	�ʝ��޹�	mcXL��|8�1l���nn�4a�-ÿdiY��� BW-�3!��<�6��3�}�i�4E�#*�!��U�9���[R�7O2��v�oXK��ӽ+�ӖG���,OW,M �c�]hKD�Z��X	��'yu�lza��}9C)oY��3Ӎ�����/�����S��<gl��i�$�<Tf����rh%4���CsǕ�X�!h�q	�~���g2�V�I�n��T�rS�x9���KYz�>2�`�"�d�ߟ�=�l]�ÿ��E�r eW�NGA�������ʊ�j9�"�0�N�v�o9�����cO�3XW���;|��m��0�L!&�W�����#���Ҫ^�y��}��A`ȶ:6�-�aA`�p�t���L�ȉG�]�'��CFe7\�ɏ�}7������q���J�U9�x��q�T���y��E��DrA�"�n��[�����{��)漰�����K�sx&�O,F�6����ӷ`إ�S3HDԩ:�o-M�㴴�'h釱zE޲*~EN>
Ù�5�2Ğ�-"�K�k�fӺ2id�e9
���>Z��A\���6��W��ͭЃIckK� ��:
ay��#�.��z	�w��ti��rm]+�a���F�������;���)y�,T�	S4���!M	����i7�>A�#�6v�rF�T�˗:p$��˞����C��j��?�֨H�m�:�c%��K�S��8U�C�װ5��ሯM���9ms��9N�q;�Mp�R�k��f9i�1�i]g8@+Ν�a}������jǝ��jbz�{������fO/�J_���ߊ��T�>'�����Zg�$Oѵ���A.w(��9|T��N*��y|�K|��0-'F�ܐġ�W����.�:d�T;&��Fk�|WV�0��[+�
Bx���N����o�o0m T���� �����W�ã�h@U�: 1���a=�!�؂{�ȝW����ὺ�ʴ�C���j������;
��y��<^�;�cv)1ceùa�2آ��%#���/jK7��a|��A�� ��CH���0���=T?�����铲�ŀ��+QI��#�ۆ��7�а�,��pl%<E߯I��@���p�2x����C&�MH�Z��S�F&��n�l�"z��ةN%����W���f�ۈ]UW�q���2�m�����+B^��s�J~ ���@�u)o鎈�D^�u�!��L�
:m�n� w�0-"L�vK-QI�������q��H�q��d$S0�֫۲�&Y��}w��^`8�E�����S��9��L����nC��V;�""�������|]zo�üۇ(�RE_a[H^��ގ��$Q�`��<�?Tq��^��fBF`"�/�-���t?n�����M�$������z�(	+{"9<s\M�4/����k''��[�[��
|էa��a[f5�VZVA��J {�С�84�A�%Ƽ4��t�v�e�]��a��B�ةf�X5m}��a��\IX^�2Xu,��� 6�XV� X���9��������˳%��4B3�l9&�Q���������7_����/������˻����Ϧ��{:�4�زl�3�����<���Mߎ�a�ᆽ7l�7�����1��tox^+�N��PL;����4&����s�J�˗����f{#C���n��  ��µ� u�{O�L_�?�2)8�"<�Bz��x)��*[�����������D�J<Wŋ�%1Q��������='��&���}��e���;�a��,-Q#�>4+�fW^�.�    ��S��`�Au�)��#c��Iy��q|��86;aK���9*vM�s�l���,�@
־9��V|�0.�sj��B��bco6%!���Y��8h���ER�������Uv͈-��w�^�HɇS}?�]��&}K�_��d�E��p����v����p�2ɯ�q��Z��	q����HWAG�ZJ��މ�׻j�ϡ�2�����'���R��*��YQ��e�/�-N,�]>'Q�踛"]���j͇d�^F`���O�@Ǻ
��KII�"%N%�pL;b�,���@H�'��D/���w	;�u��b�*�	d�ބ�k}�J�@�h�\��{���$�3�y6����p�~(��
/
���"44�D�~]A���j�k�=2&H�4�2$<��^�wc;x����ޙ�>&�]�zD\VS��Z	�U�|ۍ�vbmm���8��#�����92�K}�k��yy��b]�y���C��*A'���wާ�Y%dr�Sz��B����c���/h_��D��'�Xz�K����1��:{!��9�#��3���a+n]A ���t��h���e�C4���3�%�j�%q���wC;<���_��Ce'd���'=�\���5�>[���!��^bo�M��2���t�����U�Кn�.�Ʋ�'����]q��q�����xݦ�$�����V�쯖��������6�8[�+g�Uɕ��f������h�rbIt�� b���:��$�Lþ��9މuD�1��U�JHE��82��|�߆k�8)��a�V�HǤ����1f]Q��9�����H��+�����i��B�W�Ԋ�\�fK���n�<����=܍����	>�g�(����\�$��ù�W՝���:>J&q[�P�(Z@�JBӼ�'&�^Ou�z&�EZ�j�%�i�|
�X�f�͈Xy�We	�Ej��0��Ͳgɹ�ņv؍?�Vl�H�QF�Zw���q�28<�kj�.�~?H��Ώ�-o��]�\�[��J�b	��C?�gI,~9�%�������B�;���g�f�𣓛GƏ��5�v���Id���,C~����rJx(Ƿ�LT�D����)/$�rC���m>��\N?r�+3�\�t(3�������"��c���s\��ҕj�[0���받����;TI�;,����E��������ٞ{`%F�F���Z��tA�bU�XJ�,�a?�q��,��w�F�����6�������4�7������^�3Q�aB�E�à۵#�Pv�e;��y��jq~��ك�a���5³�x"�ل><^�C�n��M��&�8o�@�"Xc� ��۲�4�A�Y��J v�VH��� 4M a���|9�7��B�.� ��\K:3��������t۾e�����Kxc]���#ӂ�\7�. ���R�s�<yh%�?���]�C�s��L����t$,��+�Xvd%�N��0��Y��` �]8��*	�}�CYA{mZt��+�Y��N��f����H���n��2>UY���Q���Ɔ����K%�JHU#����z>�'���#�S%�ӈ�v�Q�v�����SG���#se�Ӯ��8�>C��p�.�p�m��Z��קZ.�|˲�+x��2P(���2ח�5}�%����Z��B�Wv,�K�����p�F/?���y��f-,	x-��4\��D���i"_��9�wu*I��Vm>����d�O����0��:�90}��D ��!���T�Bkfg\���,�i�����'�3G\0�,�8�Kt��ͬ)�N�re}������Tu��ضZ�*e6.#x[�;������u�R�x�>;�1&�����+cNdj-�a�?���ga�Sn���ЩO��m��r���h�9�c���n!V�P�{�|��c}?��`K�g8�j����χ1dA�,�$
�L^�x������;�x}W�n�8�%�@��0Cw���˪W��v;7㥾n#�9Ž�2����z)$Z	��w�chbiNmݜ�������$���ڗ&��w�����ޜ�F&[`��@~��"������|{��p�Udϖx)� X �
Bfc ���+�la��M�A��֗�����B���z�G�9|��~&܌��ի�]��uVP�� �I4�oTo:��2�ZA ���p��ZI�4l<H��C!����L�Pa��w�w��X-X�%#b�s�"܆+�"�FQ'�:��3O�t>eY��z���6<�7��8� �<�=�#�8�Vi��T�1.��� ޡ�h7ޟ��&O��T?t���LĪw.�zC�Q��fB8g�����k��#�⁜�O�dw/��#�k;����L�<���^	�$L|l����P�pU	�F{�΄��@���PN������5	��ڞ�U�t��\(3u=q�*���yĈ��pշEJzN}JHsv�cǶ^z�W~	����|۾�w�K����H�y�{IQ�p����XۘP���a���dVO陃�/6n&�*K�&E���p:��D�X
�V����:H��,-�yOy/#f1�I�-@�!�I�E��~!��̤w(�r��-��ay�~��#���PǦ��E�x/*fu�bc"�7�^�9���C4g(�*�Ӱ� �E���,Sݵ��}���+p��@��K����;��0,]�ΠX%�ͺ�V:n�7�˧Nֹ��f0�I8�"k��L�2���D$��0�>k�t^��J���Sj����C���cQ�K�üR��s������8�0y$��	ƾ@H,\<w���/*��dD�s}�KAH�u�!��S��o!Ω�K+�Ϙ��n�դ	^��B��{��Vݜ0aT�'� ^\v.���q�'��P�U�r s�Q�Y��	"�(��-��CS��M�)��9f�N/�RP�����>W;�Sb6)�'A7=S9n�	,d��MDpi�7�7p��T��8j�m�pk{`A��C���u���`y@4=��]1�� D�>P�E}�r��������D�:��n�4�.��B1�{�`踦7�Ko�{��B�7ı�X�w������8?���C(��,�1�P0�Yb��L�����O70d�1t���m�j�b��Z�ja���d���ixA����\�f8��n�<˪ۙ�AU�aHF�m�h�d)�]S���qs�6A�7�u�3�]t_E@�(��Lh�o�����������ۯkU�"`�y/�X��qp����Dҋ������T[o l2���1�K~x|!�+��X�`xĝtQ�2�,��;�9�4	cA  ���c}ň}ac����pv:m���Aj
B����x�z��W�#�`�7�D0�cYJj�n��@8��4oxYv�k.���X��Dn���A$w�[{7�}7���jC�5Mb��/>��(`>m B�7U8h����>,�!�c:�,�������P��P��fr�3 \I �q�2�T������^�$��r��R�fx&G�g�OU'$Ԩ!5}���,���Z�K�o�BE
�o�R����]�������X�[�ZM �(.p��Ջ?��%�i��f���=�|"���yxPD\�/�N/�ф6��ɝ���j������Os��S��6�4<�j��<�0�md����Lz��j�3!0ƚ��:Λ��,I(QsB�VV/uLpr�:D� ��i?�h���}ɲ�ʒ���3`��@�P�١��{fiB �����{�P�'�-��ܛ�n���P4��k�,�Q�HE��ʕ�?�I'x�z5���"�I>C���RdM���AOE࿁�%l�Ai]�"+L����g=��N�k��;L���Ѐ�$���z�#@��ֈ��;c��P����W[=�Qeei@|�q�E�t�`9��L2���\�\�Qןח̒��i�`�I �jut���[    )����B�q��.D�a�)�������5���Y��a K uҽP���"�|tl�t����#�L��\�V�p��<�ʮ����6��ݚU���̵$�(�\s"��L��(�����HN��`cedL�	�s*�M�5G)�,K4P����8Ԡ;]Lt6��|��	]u�[�<~GM 
GQI-
i'��vu�r����Я�6T�@g7���4NQ�4�.��j��`'K�Ŭ,�>��*&��
P�57&l8�9��LP��"0�b1�'G �pG�	��%��T���K=�`�I�D "A�b��'��������͙k���f�i��� 1� ��aF�=�=��~L9bX)�L#{~��v#���9����C�_��N'	?�K����LP�#*4 �!u�}��x�O]j���2��^P�Q��
0*ՐF�UE��ꌷ:��J�w��	�]� ���ED�n/ǁ@(_��^꼓 �N�`N3��;%"�� *��+��B�N��U�r`ɦ3\����+@͒MK���2������)�'>ߴ���9���x�C�# �J11"S @�Yo��MT���1!� �����b�����+Č("겊1PvR e?.4L[����!���co��	=���[��/~�V�XU��2P�!���/$\���F��M8� H�%`=V��Y�" aj�k^�(g�V,иk|��rFT� ��g�����Y��!��f#B�&�@���%�;����]S�Q��)�G�� �����xh��>1�X� 1p�\������ޙ'T��XU}��]��������T$�k�u���!�ș;IP���И�.!�!^���l�iA
buj���@aǞ�%ŗf	W�ٚ�5kP�(>l��=��Tz �I�
�>MF��(8�k�T	7�����Q�s�_�ַŝ��ѕġO	�� �wbQ�IW�y�:�%�d̃(9y &* �hJ����J{Beqtߙ��� �~����X��;�"�cA@Ky�����s�u�~ˇ�Phh������t_����0'�tmￏN�Z z��VV�*�{\��p�����Jmd~�O�n� �ZBᶑ�
�<�b1�� ��S�1雀m��[��p�~D��:!�_��J�?%}�ˬ#_A�!EO$b�c<Ǌ���1�	h��	ؗ"��� RN�gm����ɔ�$��74�h�h��L�㇈Ӎf �P�(��=S	�����X�����ǖ�V��`~�W�-[��`��zXQ3x���ܜW���ɼQ�@�u��,��OB@}��~3_��5mh�UҺ@�
}�
�UD�b���{�N�5e�G��u��O6��	A8o]��^3��j�_)��3E�<��ib8�']�C�*�p����+�08��Q�A��fҍ�z�`Q�v5���C	*ðŒ��� ��.�k�t�Ъ&�^���W��h���Y2lrήn� �oGz���I;@���U:y�S !����}�����a�
j"��2@���ܘ��~�e0�Oi�:���&@7�bʉ�9R4Q�Hl̲����%�=6��N,��6�LP퐞��.W�2�CV���<� �~KM7=�/ 9h��q7��Pw#DWSD�6�j��ji(MT%]�4�C�D���NBL's��JB��A�<Tv�:.t����+��&dd��Fw!*��'43p5g��i�C.�Z�4@���a�A=D/ k!�҃ ��B�vACL��]%�
��]ׄ{�c���D�߱@y�1U�MO�n�e>V��>A)��	��=F�#!�]���Bx���D�V��i��/�5n��W��	A&�W@!���w������e9�]`8�"�	�� �9 y�eT����R������^*A$�� �4���~KU��Ђ(#�p��A˟a���gzh(����q�6h<��z����G|�`Ԩt�OK�����n�?C���4t�3"�ZI�0`�*\)�6A�M��2Wz`�C�9S͒�eb���+y9��Ԡ'��)��A���L I�"5X���>	�;B�I2���H��tKeX���2*�<�tUE<�	ؼ���R-	V-�vǁf����"0@DӜ��~��OO�/����0CA.[�
ބ P��h`�����B��T�{�po��4��;V��h�z�� i?�q@�H ]C�ĂP=�3�ç F\
XV�n-0�aRA�)��A+�g��t��F�z��o4H<�Xei>@/hP���oH�� ��T��V��vn�f��c1���Ҡ>F �#�}�	��vҝZ�d
x�Ao�E1H��x�.���k9Y�x˴&2X7��*֢C"!����.=2ӕ���(�2 ��m E��	A���F�(��	
J� �Hy:��B����K|�{)�&���j8��� ��2\v㈩"!યp��k�|3A��*��$C]qQ����/!�xZ���}Ц��Fй�;Q� @C�Q�+!��fl��.j@�
�R5��^�����Z�}��6=�P�iP��A�}t�	� %1�R�҃��p�J�� 3̰��$E�$�p&��`(\�D=�p�$�4��Q�N�j��qU�7d �Y�P��@$�|�f�}e���>"ϋ4�&�s4U��� U�Ѹ���ե��ze:�NgW��/E]928)��p�~X7�~���TVD/�RpG�!�8�$,���' �
p��4BK=���bN�FaCB@U��%��3e~3�R��/�kj����q�YR ��S��߯x�W*�� ����ǥZIh�6�$|�o�'$C�<AZP��aX���9إe�z��+R�2�P��!��/����� ���?��D���NØ���3E��-�Hns�o�o:�l`G�^V0?�h0th�4��X?է{�yM;o=���H���Pp�S�9�{֍���Q�)��6+�@&*@��哂H�w�>��Y*h����
�!ax��C�P��q����C���ͬ���W5 7
4���y/�L5o��zQD �N �<ХA5+�r��z8)`�r���"@� a��
xJjd$F8���Τ�-u{ A����b�B�b�5.IN��忭�㞿Q7�4j��X����T*RВd2���r6��TDA	2T���F�?!&$Ib�?n`�w u@�|� ��Yc}�ʰH餏��P7���N�����o��sdtn��5��*,Y�ׅD����Pih�3��nB���.�`�
V�D����ÝD�Yy� �1�B��+.p �C&D�s��y��1��a�b��x�4�Bc@0�qP�ĳb<{ޑFBߥ�5��eV5��<���<�m�F"e�6%4F,N�%�v���
�8� �sլ�0���d���v��d���="`ϑZE87�p�%�d��'rzMf!!�dB�~K$�)�6��Y9�o��P�.m�,1\OH��\}	�Ɏ�.YS�#z��o���ѵK�zB�Ҫ�	:�X�#O�Ꮼd %��ZL/�@Z Qc�iˆѓ����3O��">��Fq� ��T���"[����Sy1?T�3< Ոk!c������T�24cȜy]�2MEa�-���9�9�Ω_PVs�5
idM�&Ue�N�����'�����O {0#) E1X6����k�6����]���C�jA���T�0�`�^xC��`��@5]3DP$>2�����	�
��y�������q�B�)O�@��X�,.��f��!�8�������~�F���.��*#)� �`���񢚁oX�5��F�H'�>2^/׷x̷��k��x�Ƽ}WS�� �Ĝm� ��6!�Y�^��.Tn-,4�b%�
��c�9w&w򯮕�ՃO�� �
�1E�e��K6����O��Ì�T̈�p(!Hb���ƙ��T���HeB�"l�=#�����8��ACN�ٌ�T�������RRG>.�    K���4�������ǌ�T��iO�]:/����5ckС��:�3.R��P3�p��	Qv<) �t�7?�����~9�+���B@�lA	W~�6]7��)L@CI�� ����	A������+:�So1c#�^���O�f���H�āUB���'��LW�%�i�4�J2�ל�g�Ҽ*��۫����G1�9Pt�g�� ��(���f�K��Ӎ� �7L�!$V*�M���;)�/���n�Y�6�!?/#�@P�+C*���܇�� ���9�P�鐠5Ν��2CZ!B�AJ����<鯗�j����?�J�Ň�bL� �v�N��н0b�b��c������%�sBӼ�h�������76#��L7��%rF�1d���&)5�+υ:��'"b��D�<<�Z�ZIMhw,��P4��TAL=�c�y�'=�bo��C������T� z��V�2��kBB#F��������Ʉ���x�Vc�Z���^��TQ��^�g���	qR��F�sX�
�*�QD'�:��A�;]'�S߁G�4@�N9�\��ܤ $��ї�,�y��` z��^L��[	5�3t��\�ԃ�a��34��JTtɞa�7�Di*q�1L'j��j�P��")��ȳEO�t��L�J��Ӡ�F�RxYß����?n���o���9�u
�4@���}���xx��n��t�fԥ����4�������(@��*�y�ӭGr�Sx^I�l��I�Ǜ0���9Y�{�~�1SU�8�+t���Y�Η�p,H�����Q<ǈL	�՘�E� eKt(Xc�Gjx��#�|��@��r���tbJ���3�7�T�J�V�u��q�����	uM�ؑJ@7�'��U��?S	�)��$�����9 �8��W �̻��+������f�Kp,�`��j�7�a��,�A�!U�ИF 
J%�����Tߒ��"�4~PX�X���#����~�a#��?)#0e�zᐓ�%�)t+��̫��p|���R�N�A�j@ߦ�A�����y�QĻn�������Ҟ���,@�C�IU�[[���T�U7��)�d@\VyX�d�ILX��j�/��2�N�� �GHS���Q�0���+! �n����W��#�"�eW��#�1ˋ��'`��ԩ\;�s�`~ u"��׋(eX�����I
�-W����+r���yO+��& ����� *>͇nlŴ����
�}.� ,Q��?���CW:}W�j��T�V!�&�u�_�/x�ԥ.3�e�z{|��!�=�+��=>��3�a�3< H�*�n	A�i�ǚ��;�Gb��t̀�����_dD= ��h�:�P�0�׎h���(�cY��
��� ������w��ʁN�C�R8#�P���h@=Ď�jA�_P����Rl�>A�
_�(�4a������u��zJ�!Cf�re>E�Y% 7m�7x���Li�m0]9 ���2
�J�3h��Я:]��]2���
�	�z�}6�m;�e/8���p�ќS3�숀�(�L
2���)V���ߵo�Ҩf�0&���j�	C��f�P��� ��E�+M�G"51��d���Z����
�e`���f��2����	A�	!ˇ��a�A;4#��n�Z
�G�`,��F�5OS��������8�V%Q��� T�w��X�ms�f-+�9$Ԧ���8��ֳ��P��w������&#� #+|�у�8�Р�W�tB%:N��*4�2�I��S1�Y<�@� �Ve~Jc��U�H�(>P��`)�����^�D��O���[\�1�P,��>,v��Q<�@�\H8�J��D h�	��q�M;u�W O�eQ�S�q�F�58O�;�W�dO�S�rkÑ�:�d%��G��d�)܈c ���@ �NI� �#�X��>AuB�T���	h�9Q�8� \	e w�UXG��	A&㞯��h}��n��c�|'�J`�$�,:�#A&�p�+Gc��
jq@�J�Y��%	�5h0"�qCR�4�0M�6'vT����~&̸[H�~�į�}J��;�g	�����=4����3(:(��>,����D�d,`����/�v�K��0�/$���L����� k,��mzk�6P��"�;��G���Dd�qO�3��H��	���0A
H�P<����Ӧ$t�µT����) ҔH���:�쪄q3��N"�@m�9�g�wx�0I�}Oj�K��.�J4m1R�0H�r�i�T5�P0����~� �������A����d� ��(LwYh�¥� S�P��q�[nm����h�= xZ��	ix"hr\���Йg8&�Y8�f����TA�a���T�E	�@T����ܴ��
w�;T����=>������;�����p-@B!��e�}4 �bτ �����$���
=35`���()��j�;(��_Ua� �J��hy����R��]����dӢ�Ba�K
uTD'^�� ^pՏ?V����������WpFbhϼ�9xp=��m��W���|P�G���ׄ2Y��gEB	�P�Cp�u3�ǀ��N����
����8�H�h�����c!­�"�p,�nT��b�3��T�u�Y�k�H!�D�(�ʕ���X ����M+�v�A��a��L!	��6�F�#���HS��Z�2R����?�9H�B_�Q4Q� �b^�X�v��H�Wi��5#&� �%�I���H">+ga�t��ja.OE	6��R@TY��	�$~��+��!8	���ڕ��?����t�> ����LWV8 ��KO�]��㬾���'F蓮�m�y�UHF�D�k��*����J=a+�gS'K��*,�R�]WIn��LF�6��L��E����� d5��gj)T%��W��M W��R���`5�;�WWVq��~	��FuG�FR-:r���~�R!V�B�ML���uԿ%�(�]���'*����L���kj�"	�Eϡ� I���j,!�ڭ��SF����"�zq؉�
rU
ʋ��#,*��R�e5h"���"�`a�"k���a���J���oh���I�󱀪v�t����f��+?�k����U�P�A��]���P��km����^5 �@_b8�<�1JN�?ǂ@�g�g�z��C��*K��!�1���s&�b�����0�!�j�`���80]��@����*��KRU�wY��W����v:����  :[-յ�4���(;�+F�Y��K�c5��`U_�ޜ?�a�^-�f��.{��v�-�~f����Z��ux��<�?�@p�
�&�uE��ߚWn���~X��!;�N���W���wm�5<�Ѿ��}��bK��%w���y����9��M�?4؀X9X�{��~oe��Ӄ�5싥fv�n�)����^�+�6�/�;(Ok���լYƥ'�����W�F�/��`�� Q� 
�
���eq@�F}�p���[?�,:���#/���>v;$^$�J�΢�����Ri�N�8�{�r��Үk/9~��f�h#i�ވ�9�/M��1���Yc!���>x.����o^EogU���<:���C��w[-��ipcN��G�A����PM���D�q��ASs�{uH���lS���d~_�^��ևŅ>��uT7*��_Q�]}^Z�A���`�)����=���h��=M��}������>�Bv�o���_��a�_j���m��i�R"���m/B�;����܃�v}K�"V'~X>����`�����4"F��Q�$�%5�����w����}d_����x�������啾�������s�����6�)��7�'Pa���7����Q��~� ?�߳3�S�Z�QêM���)���rs����%o���t4�̅J�>�=�,�����˳_���c#�{�� *�    "�$�oA�3�;�ǰ��o�����h�c���"w��X鶇^��-��f~~k��Ae�w��a2Lg]=��ht��6�湩Իg#�;��������s�����P�  �P�"@�h0��c��d������f�G��4�*�Ln�;,�el�����Y���d��ZOi���p�	q��X#���d���k��@cϯS�X�0E�閡Q�ˉ|X��|�s�yAU{��g�u���F��lv[�Zoy,V��~����ˇ{Z�:�a���#z��l�d\�*vmn�í�>	7�Vح�Rv�B���iSޢ�|S��d�u���x7�n���K�9�Z�����n�?� �,?�Td$�����-}��,��eU:����Jh۩���Cy'���f,?{�{x�6��h��3��*�!�,$�d+�s;e�f�L���`���|��M��l��t��EEV�F�^����c_"�e�<���4.��5�l�{7����d��O]���lv2�á|s^�c�7��n����_����[ݶ��m:�^��˃�OI^-:�ΰb��΄���v���>���VP�xwzs�i#������i�l�ӍT�:���J�yu?�l'��y��7]ǒ���_A�u���>��!KXP����9�̾~����T<5���v�i��3�G}�������<TT4��"Y�_��c�X�'N:�ߍNg���?��FV�ĳ��Wy�̛���`U
d�g�c��*i��s4�;f�v�ƶ�ض����n˺���	�*�2�艝��g+3Sb`�DGn盳u��n��~Snv����Z���F��yU�i��T}�.������祂;�4v�f�����{���)��3��e�o�_z�w�5n+����ky���io=��]�q�T/�gw;��_�K���e��n�Q����ަ���T��h�+�L����h�7�kj�7Ϊ�G���+�B���Y~�{���7\?+����5���ν�����:aP���4���'k�?Ҭ� 0�Y��`޳HG���a�ێe6�B���]��ѶǸ3�nE_�a��[$o�;�֫,�?	דss�9ۥ%&��X�ʩH�U�(�9AW6�lC�]%k�u��b�Z^z�FaE����V۾�����mb8�B<e�����?ei��&�uj*��o6U�ty��nw���_���L�_Vo����٫8uu�����m�M�jM�N���_9����'�;�R�2�9�drG[�L]�zXW��v�k9+�5}Y��6nU;����5k�ĭ�݊�r�#�8����nZ
�,k�C�6�z�j�Hc94��9��ճ�m׽����{w}�:�}�UA����e�v��k/����h�\�Qok���ٖ��F�k.UVD-4��!*��Y;�yQ_f�\�W\�E5���g�B��6���;_'x6S��Rۯ����͏���;�#���c��3�d'1��o��M��{D���QVx]�3:��ClN��9�l;��@$� u\�v���|�u~�I����n�]��Om� �4�pxs�n��G�T�o{�y�gB�67�K��%�)F̓R}�=a����%ӗ���p����:�!��}| >cvI��p8�oUT8j�^lN^����{�^�q��N6���,��S�����/%�aͯ���$ds��L���b� =cU�Y*jЛAi�\�I�4��h{�_w��d?/���m*��r�(ȍn�˻Y���j���&�����٪�+��������h�/s���u�0t�K�K;n���gμ*����oq����U�=�����i���T���Q`�KJc��ZJ/xNYDoΧ���J���ֲ^�..&�!��밖����Cm�xN����}��U,�ᒲ���ߟ����yٙ��GŪ���`j})����2]���VkʋV�ؾ][��k�kc���[>
�����c�{��??<��}�U:hZ�G�{�����J���-6��:����xֹ�˅Z�:2�U���ζJ�x����;.�âŞ�@bfF�?%�����<x"��f(�i�L#�8�8���q�n�d�!���A)��ΧC�n����4���5�o����5�g�ڊW�-�rݜK?%s����a0pn�����h>�9e[+AW/��}�w+��^�y���z���56;��d�SnD���΃��Ý�AX]������aDV-�W���K��������O�����[=mH��6�˂���¬3��^�\Ixv��%q��失|��>��_�һ���3m�}gau����"�
�_���kE�޻��9>���B�L�O�)w/qW�X���rHQR��;���?��dJ�j��R'1�XVŏ �f��^�<�_�-qC�rYZ4+��ޏo��|ooV�җm+�����}:^���Ȫ��0v�q���W�X�,���渷�x�ϽW��f����-�Kƴ�ߏ���u5|E����pu�����[�_�Dr�íd�j��a�Xo�T϶R�\���ȾqQ��Nu�9,��������|q�P��⛲Ц۫P��ؔ����"䃫Z!'H ��-~���ny��o�A!K7Ժ_u:�k���"��*������2v�ңg\���D��qe���T) �E������UZ�Ȳh�:´��a_�8ߐm��W�����k��խB1O"�(��^k�[����*Ij���=X�w�����ʢ�n��/��E3���F��z�~�-<���}�ْ9��C�=gc�Ff��V�:q�����`M���"~3�O�Zz��eOf�~�8�g7E��Ƕ}m7�p���Q�V�2�hlDq9�uyៗ���,/�5��1?i�7��\h���U�<�Y�n���1���(/{�j>v��AoW�F��;��n1���/FJ��H��JH	#?I|��٣�wݴ��{���ҵ��t��e��,��G�Ek{h��v���4"b�;+�NJ�F�}xʔ�c$�{�w�����t�l�,��XR�O ��\L�����Xٙٓ.]�Ϣ9_�.��m�߶��ȗ���B���ڰ6�`�7���v�N ��bm�zپy_�����_�_"`��)oN�AG�z�xy9�le��*Vay�na�m��5裳u,��������n:S��^�va�����A$R�n�Q���Ɗ}��7�Kt�?Q=]�#Ķ4Vr/`�����)S�ֻfk���m�Z_cq���ޚ�W�W��ϭ�����c� ��c5�6�p��=���G1bu5j9�iZ��o����ם��;>���JvZ��Vj,��)���[�v�΢�,���C��,+�F�[�e�'��dj�L1�+m%*̩��\
`�q����ӭ/5�[<͚[ꄕd�$;���W
��r��Û�py�<l�<~�N��f8�<Q�f�ʒD,t �V���)�]��ܹ/V��.{�-Ȟ��ƞ�1��۞���ҋ��z��x6��n���oh���G&���YÏ��?|\]��F�꣔�����L���J�o�>x��!)�Z��}���^��Y7kI� L�2#?<^��@�)��~���C����.Vμ��j�l箮���0o4&�_ݺ�>�N۫mt�6+�v;奿ľ��Ov����V�1�7mI���mQ:��-ξږ}nߐV��ǉr�]f�ΐ�#{[���ˠ��؅�c�7A�K=���̑e�5�R!}	�y|?}s�nla;]��jS�f���=?�O-9_}9�7,�-�C�W��;��Jڼ��b�ݕ?�IH������$o����knL��&��j����8�����t{��������R*>�gM뜣L�a���2尪��=��Xd�D��L�1
��w�Df׫��qm�վ�9���Xj��l�k���&[�vŻ�%ݝ�f��[y�B
�F�m�('�( �A,m�Q�����Ii 0>#ޜQ��q>�-�b+�Z�Z��ԛ.��:T�h���w+��5�_6�ڲ���Y��n>Ȼ��gQ�tK		�/�f�G��(]�H�uk���^��7�꺲v��.�]�ve߲�j�8-�5��ݖ�0n���_�F+LAaf�����S��}y�f]��wo~���*�t�T�ٰ�BC���>��k�g��ѿ�Xf� �  q�]�7����v�cz޿���ʢ�r�l�|a`�rC�#�8>���`!��#�(�[�D��B��
�wKԷb�2�p��b����D�S]5��
��A;}UG��:ZUq��~Iw4ӟ!���qkv�KZ���_��éIa��]��N��׵�q�,zVek[7g��Ib֐��#��}JN;�ߎX���e%�<��4�d:�H�px� u���ǒa7��l���&��دe'�$��$�V���i;Fm�G���qW
�vٛ�횕(ޡ��_[�꒟���j��r_��D�M ����7��Y����H��m�b��zN
��.�����v��%�����c�Nڒ�P�����_ 瀙���揄�M�+<����:d�F��M��box���R�7F��K���ީ6�An�ɽ����`j�ʸ��o6^�5:�	���&+���tr��}s�<�Ϋ�;����q�-j��c�?��A�{�qa�|6�z�A-r0iѻJ��1C�������eᮻ�v�}~�_��v�+�[�Z�4cn�V�t��R�����o�]��*ӡ�2��(�,Z8%�������{-.ױ�x��{��G�5"����w�u��lG/����X����x��E��P��B7���"/����Y���g��6y������q���������>���3tW�3�m6w�Ǒ{yݫ���Rkv&wm�~vsX֊�Q�Ɗ@���'����.r�ǫJb}B
�6�X]⻊�S|�����U\e_�qOoh���R8�h� �X���mj�5��N���N���0M$�#���9�V�[����&9�ב�������k-4�n�P),����/�fsk6ۭ}o����,E�z:i}u֭�|Һ��w�y+�dQ!�R!��~�?�p��' 4_�h��]	��X�s�L
�G�0��բr��:q�vyR�Vk�{*�~ul-VwJ��H��\4��@�U�8:����,"���oF�9�'��F>K�,�*�6�����Uo2Η�Şnf����ߜGQ�NgS�W�_
�a)̜�)�N��2���|Z�.1f��%�+�)M�������ѻ�F�U�^��Qh5���0�y+��̐�����E���`�`c�����U5�hC�JJ����z4Z���ʺ���s����]�ǡ�]
�޶���;r���TX�ƛJ�(��O-E�
D*PͨE}��]��`_Ԟ����l����V�����_��I��?�J��ć��T�}���e�\���y�܃�T��!�\^�k6���峹`2���|�+X��y�5����)�)�n�&��-R���)n{��R:-�U����'�7��||U޻� ��-}3�3�����x�������lq�X��/�=[������{�:��4u��]6~c���,� ������`ڶ�=՞�I�ثW7�
^K{t4�q�jZGk=G�WT���m���IZ
�W`$l_�� �$)J��ştkg{����d�mw��G���J��l{���ی�-�tT�fخ�+ɋ� g�'�ā�l�����л{Al���Y�>N�lQ����ޘ;-4T��bor�����jNԛ����Ƌ�\e���^�S31�刊��5��8x�ve�Ql/��-;u�e{=+�f낻���8n��]y*�t��nh��]���O#��?�^�ld{��H�7t#�f��\'#��Z_e���+��0���W�(,�ډz�Ɨ�q��D���^W��Z��!���6��(3>�n���ww��)��J��R5���SD��G�b��5��e�Đ���5��c�R��OM�p��O؈Yh&CX�Y�- Hz󭽋d
�K���<M]I=��W�6V����#2'��h����~��]�=�Ƿ��c3#eF+I��/zwxI��ht�-�u'��Pw���˻^7�ִ�6��n���?_�vl�z����ӭcI�T�lwd[S0|�s�Հ�8���X�0�ީ�#�c��-��R�1���[�7���z|��͙֖D��{v:��(%�+�
�0�H�����V�Y����ҭ(R��%)�*���kT�=���pHc���u;�'ů�aKͅzq��U��t���e��_<C���!Yx���to�����Ǜ�e��w��~��bv�� 3�����?���       �      xڋ���� � �      �      xڋ���� � �      �   �  xڭZ�R�K]SOᾣ���t'�N��h�&GA�A���^����ܸ]�U�
�*��<'�<C"�I.k�q�����p��ܮ2u� ��jg~�NӝF��q��}�����UL���?~�'�?���9�,f~1��T߭��n��Q딥��Q.Rz��E/��Z��㆕�|tIr:Hj�ק���~�!==NEoܤ�K��\��ƅ�&DM�5������J�K%���p<^����0�X�ӌ%�#�7E)��V{�D(Q��u4\X�X��T,Y�BE�O �I�/��ʊ�/�+3	��!����$@��EP�s�jgWO/��鵫N�<��o5�%�uX�7!kRn"��غdZ)��i�m�(J%����H^ZˋL�g�׶��H��b�6�৉�����s�m����̓���S���1RkD�&�_�l5m���%��U���l�'ӝ�<��_�8��L'����,�Ȏ��l"�.Q\`�t�R	e��Ed��v䘧�	*��~~��^�>�R;��d]Y�
��&tM�M|�1^�B&�O�$���0r\���U���R���+>�wƥ(��.1f/VlOP~*����C��1bΞ�a���&i�d���qnԯ��LI
��蔂Ɓ�1I9m��Z
�799l�ADTRlO�}Z�3�+���Ӣ����N�yw���gj�l�É�N�IG�����	��-]��_i[b��
�gy��$EC,�"2@@�'hո�8n������v�Ս������5>�S��O�j�p����繯��ȊTJ!b����,Y��+�3wF�8�%�yq����e�f��������c�nK��c����O��.ӻZa��j�1�Ѹ�S.�nC��M �#Ќ :`�!)l,�Q2l{�.��i�y�Y����wC������t.?�����G�J�X�_��)_��V;嬍RT~IB�T��U�唯�>��B(oOЪ=z_�9��=���љ�e������� 1�n�\��O���f1DR):�"9`ӅG�x6%��e�����`�h}2j{����G<o����<�%���c����)����]��8ٌ���X����G	A���)Z*�1I(��h�tҚ��y̮lO�l:�{=�\ǮM��?�����? �(��O�*����,	���a�"�
'We'}����9�YTF�,ܪ�
��	j �t;t׿�]���c����ݛ���)��O�2Qg8�B���V�DB�S��l�V]�,�P�c�I�03�ڞ�esr�~p?�αyM˻��t���_���қ�4,�Υ���e�+�U���^m��N$��	�%��d	O��8(ʻ�	����a�����=�\f]�o�{�5>�)��GU�ĳJ��b���:�}�����bH�Bg����	*(,�!k�/f۞��/;�}YNz��`i���Sg���!�(���IB��Зl��C�8��R"	��T�L d���Lz�/tAʌل�=A�ۣ����}�������fr2���8ڪ�h��!�յ�����V�G�T�`Վ�6�������0�����b��Q�hAn_wokV�{���Ww'�Y�\�(�gӅE�M��]W}�G� 7�s=������*�KB�NC*2`%��)���v1쭥�,�E�OQ��U�n)�b��j��1�`\��Y%/s�kXo|�����p��~�Ժ�u�Ύ���2=Z�Tm��Gԛ�(�����!���`��1�M�'�� &��0�h5��o*̭>XTxD�~{>Zgw���t��|�<�=�WW{��5Y��+�������10\O9#
��UZ[46$Cڃ�c�Tg��W5_t����︋���}>;9�~��\��K�9���ᨚ޴���ՙ�ݝ���-4��Z�Z�.,��G"dX������20�.���|��^K%�����.��������bG���8��Ἲ��8;_�X�J��� �m@���&LQ�*�s� ��L���;�=��joJ��˧Kvz�<���v�/�h��i�B�3���9"H@�\�=;W���SZ'L&+�1���uD��%y� �c��A�5}=,MoW�����7,G/z�Դـ#�.7u�|^x�l�p�,`'�#�%�N������cQ�xU-��^���0���M���������ọ��vr��ck�n�Q��KH)��XA�Lr�s�h@�ӟqZ%b:Z>��ļ�9ɜ�$&��|Ps�j|�:�w���ó�Pwi�ܟ:�j�m�!8O�9�y��h�9�)�R���������42�3�=�[Mω�:���S�(v&훳���;�?\���h4V�6ј�rU1�>���&�)&��UJ'C���0~؉A��g@CA�Y�u0����|<\ƫ�ˣ��׫�ؾ����:ɏ漿��k�7�(��u�(���:kZrL�]���ɾ�?Kޣ��u�T��:��(��Nl�GW�:�j�����t0�y��[q��[�5�pd�	�����yذ�Qc]D/Gr+��(������*!��*����="Y{�埽+>�N:���鼻�w�����ۧ�5Y#���0Qb�Ng)eu~a�2T7����"� >WwP�����:�P'�V��o�ʗɓ�k���h���9yy���]-�p*)߄C�¡����?��Ącr��z��$��LTU�wU�����Eh��eAl�G��bٳ�|{��k�?��uZWwk8�F��@�]��
�_u:�{�+,���;�������c?����R�'�k���o����9�4������u'g�E��_ám�$6i�	ξ�h0�y�EKh^_'�lh��^)��%s�
BQ���D�%�M��q�w9X]�)��h�?n��q��l2���v�F(�P6�}�ҹ(Q�0��UtG[��IӜ<.IJ ��cN(l�q1El���8<]Q�Z�zoz�'����3������ϡ@TW�6��3���K/M5��#/2��
��i�+����.�D�dV��JQm�������~��j.���N����ؼ_��5W#�	�v��+����T��#k��Ԁ���	P��R�c��%�J&F����(������C���i6:z��+����I�h��DcP�+��L1V��N"gK��aaٱRй�S���ĸۢ�D;�;
�n��ct�4~�^==�����s��[\���u �1|Gb3��Ͳ�2�����P�ჩ���$011\�dHUXN�H� �W�H���x|o����r�k?.$�g���v]v }Fl�����"c��ġԅi#DH!X%���0!�c�2���7�9�lf-|��8�޼�_��i��݊o�ۋ^h_��B�@`�4Q�im��_w%D��a�&xV�?�L�Q1,x�M1����$�2ңU%��Lo�Ǖ�^,�������H�gr��r-Fm����D|�ä3&��]%:ʄL/%�R�����������օ��%i����'�]uߞ��a�`�h�v����	�8�u�(v���j��}����M�B�UI�"Ҁ�h��	��k��t�qR�Jʗ�f������_Ɠ��?>\tGWq�8�c����M���������}9��q�Y�O���w��?��G�y��R>9��Y��?��>�đ��?oeR,�x�p\���24[[c8j����To� �G�����6��q{��:n��74�[t���e�^>D��?�߾}�/���*      �   �  xڝ��n�F���S쭇B����˛,��(*��Ff,��]?�ߢ��źK�^���4 /�=���f���VB��d`R��-�_����m����.c�����9�������W]���yy�|%2�T�TGc�Ձ��8�V������QJ�Jr�R�L�z����T�$wऄE��C>F�S�Y	b�R��
����ű�r�����(^��Բ����ئ��6�SR�N� �1�����Eq��}���!z�R�����y���e��D����c"2L�!<��J�{��Ȫ���)��& c��t��BH��6�1n��D8F�#St^Va��˚;|us�]\}�x�;�\���hI�)���9E��	����S)}�98��J���l�u��D���䉙�µ�q�@{�<fsݫ�Y���:�X`�n�w3e��A��O ff�st
^`���3�ɚ��<�쏪xț��f�|γ����[!fh���!�th�<�ؽ��<~
���D��gP��/6�Ir��aY��"�h~t0E�Q�Z��7ٷ2g��%�Oķ� ~�	Ǝ�۟��O��wCC�ӫDY��?��<�7$�5(G�,dPG9b�"��*͵$�Gj�����U���P?��8j�I3�U��n�YW����CU����9<�[�<��|Oq��k���3�U䷦8�M6�bf���n�%KK�7�{4g��I̞<�_��[�y����v%<@�$R�Ct���./��ֺ���ɺ�e�+Ǆp�2���!����x�ԧ�"�^�����q���©�IOa�O�n�h�D'~϶�7c:fA�L�78�4}���"$;�x��d8��y���6�cV�cJ.�(8��&.y�\��6��jY��.�o��_O|)|o*t	I?�?-�3<���\[�������t��8CP�:d��`�SJ�����^�ϟ<I�� 2�-      �      xڋ���� � �      �      xڋ���� � �      �   [  xڽ��r���ϥ�����ި�ۚ�6��p8&�Q@$x@B����0��98|��/���E��f�(J�n�dV}���'(F?d��$�6ϳ"8�&Φ�bb:Xu0A1B?]�W\�.>R��;���_��̹����͝��1b\PD��0��!�\�'V�=x�2���ϛ�s�I����G�K����P�6�!����k��z広y�q��>]���/Í+�����\M��J���ν_e����/a=���o�ᜬR��4d�;\�*{p�a��?w�7��'�}G�z�7<�;�1O����x2t6�=Mlp�=>T��tX�[�V(Xy�h��%Y����O?N�qi"��yQ PyV��A��_�Qk٘�ˑ���j�+��W��ėy�$��g�ȏm�<�7�U%�e�4���í�A��o�+}��ިj4W^g�6��`[��b2�Ŷd_�[�����r^�	�-�=,jɀU���&|7�a%x���+��73t�(��eH�����٠c;M\p�����J���l��c�~Az�[t��yKbZ�5=^�}�-C�)�a�6p��W�f_p!��me��GM���>M|5�;[D�8�)7v\f�Na�6����Ǜ��Z��vC!�8#ʰ�!�!�`Ben����j��䨬�/n46}���v��
����\UU��(�#�lb�-g���Y�B�V3J��e8Ԟ2M��%��+�`��<J����>�m�,���Αj�C2}	y��,�W�?~<�����.�_���06Ę� ~~��QF9��EU�?�IQ&�:ڏl>��C������]k.���v!z��\�1�U&��� P���7��<L��r��S;ΦI��Za��- m?�D���6cKm&m��%Gs�EŢ�V
D.I����� w6��W�i��*8��,	}n�uPh�0��v�2mN�7���G�����XSjl[���N5��Ѿ�1R��WP2H3Ȳf�l����Vwi�c�p}!�A�6uE���iaC�Vy��!�o��D�@s�����������ٚ@���i�{�����ȻG���)"�V��F(��y}�{c��I���L��'��}pmˇ��[�W/nV�?(ED�����j���Wyc�E��7�r�/���1U/RrЎ�P�<�3m1_L���_ڳr�ҍ�9�y��3����� �b:�y����~���04pp:��p�ǳ�+=�!>�+ŪH.����'?�E�@J�dӇ��.�T��u ^ca��pIeǑ��	��rFc'4	���YD,iy�}�k=i#AM�4�DM㛦#��C����Z�؝��+t�A�m�.]��y�:?�����/���&�ϲz�'�ޫ����V�h���	���t:��У��G����>�N(E5��p�	f��1c�(*zYF�,���p챍�c�4"d$l"�:G}H��v�:��s�p!�a�4�ZĆ:̤��H�#����0�@����uI�L���x��~b�z7�m[��j�1N�6V�]]�Ux43;�
�./n�����������`���_�Ǜ���ٯ�7Ó��N//�7�����z�īK�a}J��w�V\q*%w<��!�B��J(a��XkGHl!�D$f^q��e.bL)n[3��i�ɳI���l�N:���ʛ�f����|}��Qj�b��[��0O=���a��c�ۓ���w�b�z(�Ǣ��}���;����͋2�}7�F�0�l�6�S��bq4���*������k(_��Z0ǱW�ư�P�<��&UD��pX)ED�� 2&�QP�0�D�5��aY>�'��sѕTQm��O݃���8���         �  xڥ��n�0E��WD^VU�C[����J�2�+ܘŶ���IB� �W�y&��Ǔ�	��vR0j��­J��蝛(�z�V4O"ش���΄6H��Rre5�5"h�W���p����
/�C�?��	�pf��#�ܣW�xf�)+��d��:�D���Rl�����DV*�$8�qS��`��h|�a����.(e����Նpp�p�ci�nbX�~�Ì��4يr��1Z��s�op�p� ԚM�bKC)����3�5HqG��lakCY��G�%7�Gq|R2Ǆ��P9&>�Y�*�:�O)���|OI����j��C|C���`��[+A�j��̭WOW6g��ΫP�;�V��8���L����O������#��av�9�T͖�:�N"��f�!,�6zh,� ~)���         �  xڵ[ms�8�L~Lj��}�H��M�2I�]oaPk[YN�����y	���L'!�hW�G��l���h���Jh�3�[��v�}��6�wmL�Ǉ���U	���	O�*xv[s���{F�B}-|�������%��"�=�\� F������e�Z 2��J���1�ᏼJd.
�^�{M�g-��H�I��ao�:Zu�1l�r.�6�O��<��'a��Ӥ�����J3�?q6<�b��P،�uü:�a���Rm�f� �:���/�����'K�{��}��"�(^$Bj�p׆et�w2�F&P���p�e�؆�گ�����y
�Kۻ�ǎ�?��',�$�<�Sb����������a��W-W"og�A��F��i�+� ojQUm�}2��Uk8���Rټ�,�!޳�SX\d]�(;���$�K��f�s��7ނ�ƫ6��7­��1P�d�[R.]fE�h��۟.����ҬS�� y���҅����*����8�O�U�%����Ю9��F��Z-e&����0	B����eA�����vt�ǆ�����k^���tzN�J�PF��M�{Uf�E��W�1cleZ"�l�	L@�-����]��"Ñw=�L$%U�y9כw�"��w<��w���JV���X7����Zl%,��	��Y�.��V���`��J�D��<��7�m�Q?]��~$�ԫ�i�
�� ԷjK�/�4ק�g�py6�����bZ�/Q𷘫�\n��<"�ʝ�4�����^
Ы+������n�"�	��g�����Z����vef�eV����	폈���hQ(�\튰���r��+��C���lA��S��U�����O��8y��.`l�z��r��y+E+5G���B�Ӂ,��/�!%t�=&�~:�L�{u���Yg�
��Q��EH��f�{�G4�8���+�c� k��Bm����Y7$�G��~�+c������g��S5X6Ol(d�.��p�^�H�O;xg�N%Q4���Z�M!/�T%�UWd	��ӧ�^�
#������&��Ǝ}RQ~�^}߀��9A9h��+�\�J��GgPtf)^�x�ȝ�x��輆� M�-,���G�ǙVKP_�}!�c}n�O��{V��Vo�c�F>��}��@��("��b|�ލ��#pkg�&f�~�q�����ML@
���1=�*���Ы��Tkݧ�m��B@"�+�1��/,3��@y��QY{���<J�r�R��j1�*NT�p�Ujc^@sHM�\V�j_X�<�y!���v
@�rUl\�9��d�ns��`��T��|�]J�Ȏمy�>�ՠ��3�1�@����|��=�|�)S�3S��@�����4��0���N(;�3���16BGt��l�Ё��zubѐ��{����fl�>����_��Pz��w'r�o|��`,D��/��]ܩ/���z��{��y��`>~�^��||�}Y�������������c>>_�Rs�ǧ�^j��!�"��P�' ����'��
j��[��5��J>�!��v ��Tq|Uѽ�-�%�������K����4`O����ꪻl�Z��m�8������������F$���!#�!�������~v��.�- �\�nS��d k����4"w6����������C?           xڅ�ɍ1E�U��о$������aR�$��x���zE��1����?��η��'��珧�'�7ƈ<���yB����<#/�ly*�������"o��G��u��O��Xg�{@>��u�<"��'H�����Ԏd "1&���$�jG�*��$e���Hb������$B�jG�<�T���xM���6d@m���#���.)D���t�gi���Ah �ݡt �nQ�v�� @��� �ݦD ��S���H� ��ϰ[мr�n	�7���@����h>8���i��n�SDy��_��y��T��yv�T��Hq�T�X�;������9U�]��Ω"��wNa�e�s�K���SA*{�ѝSEXmM�*�vkv�T�[�.]u�a�U{4I�ۭb��:ԉ��*v�C�ۭb��:ԉ�ݪ7O�:���.]u�il���:���.]u�a�M�� u"l7�||�o�"ʺCtF�4�0�-mN�������δI9{\\�6*g����f��r01���i9�\!ܠ6/g�+�nѨ���K�#���O�$���S�%���W�&���[�'���_��d}v�B�4���[g!��+!��gH�}�T ��gH�,�t ��g� �쀆L ��H
@�MА�_�J���>hO%4
�����_�����F����C��|��Q�>�%Q��S��u2�������ǫ�%��ӧ� �H�+��)o��5
�w��S>�߫��������y��q�����O�m&9��/�;_�~~��Y|�"            x���_�$I�����)���Ш���+H�*	��|�;�]5�z�FU�K�~w�snFe��&��t�}詚{*2򸛛����ܙ�ұ������#�c�f�r�zJ�('���,�~�\�6���&�b��um(�׵|(���)�|X9��\��G���#�e����ϣ�{�|X��{�r�,��끲�Go���@Y�U�r��<P�c�ׁ��q(˱�@Y|�|X���Q��Ǩ��c�e�1�����@Y|�y�,>�:P�<P3(���+�1ˁ����@Y|�v�,>f?Ps(��9���\��c���cٵv⟾����S|�r�,>V=P�(�����ǲ�����k�@Y|�u����:��!5��P�RĬ���_mڠpJ�&*I�6uP�R�ɃJ��MT�Tm�ҤjS�e3\�"�l�KT�������)1�߿��*��"񆉑�x��HE�ar�"�0=Ro� ��7L�Tě�|	�̞+c����������9�"޲9�"޲9�"޲9�"޲9�"ފ9�"ފ9�"ފ9���[1T�[�W��_W��U���Us@E�s@E�s@E�s@E�Us@E�Us@E�Us ���j���j������߿�b�n����怊x�怊x�怊xk怊xk怊xk� Jo�Po�Po�Po|���_W�"���u�Po��'*�� Qo� ��x3
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
;n�l�p�=�N6w�ή['ۻ`G�3[���g<I�7vao��{��ö��$�_�-�N���`h����dZ��w�v��\�=`w��-���Af��o-��4���š��ߚDߊh��K�����PD���>ѷ"��5��q��Q�����o��oE�_k}+"���Q�����Fѷ*�{_Eߪȥ}i�\E*m}i}�"��Q4����7����x(L�         �   xڵ�Q�0��ۇn���'��z����6	��i��,�����8�TGP������E����sQ<Z��e�^;����>��3<Fv��6�hL�#�ecm[�~��pz��7w3�,����E�l���itǒ�>�{�7�.�tQ���<���~���1&��V�r~��_         �  xڍ��j9��g������(U?�B0�,�،���������j��C}�*��:������z�������?^O�)��ݑM,դa^���Dv&��ϗǇ�]D'���Qtc������������۟�O�)y��խ��/O��oO�<]��7PO*Nj�����R�����g�m��������-hI��6��x6�3),�n���������?�LJ�j��^6���x�.�d�_S�Zd���Q<圜���x���5�f.��,P�rN�Ԫ�Az�z� �W�r��y�2	%��H�0�������÷�/׏��T�����ʁ� ��A�e�)�I�0\\}6.g��:>M�v��$C���`���I$��&�y�o�Q*��� hD�y�(�>��p���# .U2<��Вb�H�*.v��ҏW�� M��y�ԁr�$�b�u�c y�SD&_������F� �� i;�TU^u1�&�=���<IA�WD��h��p?`,�h{>�?��Ve,���Tĵt��0���vd,���Fo�.����S����B����.VV�t,�Z���?]]ұ�ZZ1�̚�	c�5&F�a�+0V�rk,DTt�A��-1ۚ:Vڨ�R ���ԏ E�U	�1�C�S�J^��a?A��1�����1�' L��W��"�m�7D[��%v 6R<05=�����������dh�(�!&Er�0äV�7�B㠭�ǚ�cdC�A���t-0s�辜�-�1��\^�Ic�}T������4��0 �s���ѡr��AcDquT�u`�s�GU�< &},���X���)�{���3�b�(�� j�҇����q#�_����zcbܬq����_�;0�b��%g����v���1��`H�H�C�*�2߀��g�ٜQF0�p����h���Ę�V���q�̥�*�J�[ӮS�M���}�F��O���5�+u���5[c���Kmֺ?��;D�p�Ha���fI�x�vҚ�a�����l$S�ذ���I������ϩ�MyA�r䥣�H�VeiU�ѣ����1C�
Y��� ��y,��� b�]P���*;;�l�ʯ�:��:�a1kK{�{\Wl@7巖��(B��m��@�C�F�F�_����|�KfX      �      x��\K��Ƒ>C���ֱV�ޏ�g�4��;C��:5ݘiHh���:t�O����#tZ�|�?�YtW�Q|H��#HzD:�*T}��eV8#�/���)ES�'X	��"���Mq[���&�~��{f>/����������gd� r,�Og�����n���zUt��͟��Qm���uUؿA%`�VL�D���.�u~ݴ���i�
pl�L�D(?ˏ��<���Q��H<1�G&�h��ţ�'xM1�0A����H<5��'HQ�,�H8����L��PN0g~;���(�&Qt���e5FP��"1AHs��"k�0��G�w]ռ�?VŽ���q��&�Rα��d�.HԄ+B�T?7�v��l]�.��˳�J�C$XU��R����Z׍y�k�ܛ"�)S��=>ŏY�=_"x���[tΰ�ڒ+�~�$,��''T(��� ?z��I΋�X�I����Z;�{���5W_�����2�qS��u�����u���j�z��_���{� ǋ�zffeS�jR��U��o/�U��ͳ�Ekf��<7���y����٣�{�~���g��I����UY�.1��rK�c<%୰Č�!+��A[̚v�j֬�U��MFctJ��(ʹ|�p[R�!�p��������O�A{+L�HM��@��EE��&�x �}��H�!»�Iۭ^�U�ŀ}��G�4e��F$��ZlQL�P˲�i�`Ļw����lܲ�:X�.�G ��&�A��D#��8�@6�!�����B�\O8���I��?�?���)��'Z�!�]���nˮi�Ʌ!�w�� ���h̑p�X����m�R�36�֙ۢ�����2�9��@�N�F�I/Ɵ��u����TdD�(g
�#�s�N�!�v��Ɔ�Z§��y��zn��\��8�-=R�!h�`��xǦ��J ��
�S���S�f��u��E��1�-��·
��}��D$b�Al��3qt�w��6�)�	dy鋢\�>�S:��S*&Z�c��޽O�{;��I���`��^f�O^}\�D�`0Nl�W���cx(X�U�"��a������f�o�F T G �m�0�5���pۆ���Cw��<�ֱ5("(� ځT��Q��,V�Җ���-���P��	#�w�t �8P< �ض7�X��E�����)�h�>��/u�+d%�Ҕ�6����.?j�ʹ[M��3���v3a/	��Ѕ	�.c([�����J�HmXO?���YSXP��oC��ׅ���u���݃�d:�b����p�P��v�,��B������5.��P*-�)	}�h�4���ڃSSbM�"�եyVo^}���L�jX!�)Ϟo�R�wf���UL��B%حD���Pٛ�j�+oj�?�wN��`@�\�ښ�C�#��S�|��1v���ވ��.�C���SU#3�{3�C�Dq(?fF�����`4��x�������h�>��J��G�9�-�!{`�V�J�|���Џml�l�m�H���ˊ���.��]�"G`��CR{��|� _�����C<���+jD?(��(��M=1�P���y^���(��x�A��p�$��y�q���Ra�s���k�ƣ{x�Jk�&F5qۡ�M�=<�Z%b"8"�Ϗ��4�1�Δ}�� l�X��e����!�C�b3�e*Q�Uc�������}fԄ)��y-�e� �i��_Lu�O��1���:3o\߬�fz`~I�%�\��Aɐ������b���AJ���rg�G�p�	�^gL��jQ��T%9�d�"*��`�uo�l�,il	�!�6
a֯��V��ۚ�xI����i��?^�b���â�K��-�@)�ހN�b$`ʇe5�X����`@���}�w�C�!�
�D�wB��]�C [
I!)}�*o� �"�8��+#�G�/��_7��Cw&!�~��F�D�'��CR��ڂ-<6��	C��!�v1)\��OI�C�)!)��4$)���x�Kӧg����p�߽7[����w?���D�r�w�mW�n��^�Ȟ6�&?�fMe��v*a�p?���wy7[4M�3�CSa]�c��tM�A���&_������X��1w~+0!��5T6���8a)d���vd܎�%X���0u~���_;S�0�Z�`���%�pT�0�B��"�<�Y�>�-����0,P+�ݙ��)��S�M��e�PI�yH�Jy�N��1�;A"{h�f��������-h԰F���)F	1�B`�N�&x+Q�0A$.Q��ax�q��b$�عKW'�{�Y7���9�)�χA%x&����J�N��
J���<�)AD�4i�W��]d��T��˃w�&�u��y�#���*6�	B*N��`��μ'�����q��JI��6�fw�0�N�S����ٙl@�ਆ� ��vdk?NK	�a�!a�m3v� �F�<a-E�D��ǋ���ǩr��e�U��/ @"k��f��*�oMmO�N���G��m�>,ZS͛�ش��Z4�>4�:������� h�!�[-���-M~YV�&��	;�|k۷Dǆ%	s�����Gl�-�<��w��:$W�c�\��b���	O�v@�e�l�"?��ĸ!ԟ@J��@&8�'jh�Jz,���/���9N#FIhs�=�g�4A�%O��w�	���[���H���� c�;���!!���ЇC%l�"����7eU�f���Yт�=��v(<��q"LX�25m[��������G���@eƳ��j�֋�������u�]m�f"L���Z��1@�7?��u���u�(�/���E%P�i���e�n�V�31��.2���� ��^���6�}�MglݰU��ȯ ����@��nU��
N�hȱ�滮+c32nFi_B�S�X��~�,������<o��M��p��.�媸6u}�?��.g�Y��\�Jp"w(L`�/�]S�������Ӣ��0�eT�s6��%�/�G��w�'��G:بU	����e��xʥY����:��L�y^��{�B%��韏eM��n�����ZX���m��s�z�!&X�_D����)*�,�� t��1L��\�P�B0SGF<�]�h�B/���ڸ(n�=�c�N���ۚ���1�6
.<�_!Q�jH�ls�6Kx��Ҷ"�-}C�z���1��rO)�`I�64�� �Ǻ�tnrT��R�� uU@tzY�7e�+!Gh�����LV�[���م��:sUT��XC�;�9���x	.+*EP:����'���:FI���-��?��*V�����7���J%ثG �.̵��E�6�l�o#
��5�}G�G8^��QX$8�%Q}�n�6�f�}ힹ���}r�k�WM[�u��qOB��uc���p��<��	;���Ae�ͺ�٩����A���}�(�]���w�G'��E���O���T������@DD��؄�@@C�{)V�l��L�ظN��g��7ߗ�'׷A���q����i9k��n�K��:�&XdF����y��HR�I=-nZ�� if&���C�5�+��������	+�T�A>o�\2�����sx�$X·�Kg砘+Kp�"A`�(�6��͝M�j�p��E9�AfT�p*(-�[V���,�E3o˛5��W��#���D�$\iZ�݂qfɸp6�KPtA�4�}��0]��1�,Ap�A�!�;Y�l@-��ބ��B�HC���K��C����#�LP[�pB��|ml1r���	������|��0'l�@0l�~eC@=o ͛��
�*�J�\��-5��r����s���j�o�w����ҟ�hm� ��,j�a���c�����7\���+ZegM+��T�P�
g�K�ߞ�x,��m~���:)�QMg#�;U��f�¡�Y9�����jKȒ0����5��Q�: 
  *AuE����������9���R%H��=�,��Q;�Q	��WEX��qf6?t�nܹ��6Wm̄�5%^�k��ه��b}]��H'خ<� �tyQ�{}�$h���2\�yR�,�s!�C)������@�Sb@�aO��\^��uOlz26��3z�Ԓ�	PP�<܃zR�Y����4�2���@7����P�$i�fPjj� bA�Q�����l�o��쒮l���`�E6ܳ_zbl�LƩ�3#p���*lu�����G�Ҷ�ĉ��}� ��*��G'���l9 ���[�	�a��l��3��p�	�r��˭�˕��ޛ"A8�E���v��U �(��b	A	zS8�1��'�6!{%m�^{8嬈{\g��1J�������fQ�}ϋ��>Al�}L���;�v��}9�ȏΝ����x�\5�}�˾T5��.�%Ċs�I��t��#A	.s���)��涴B��C[��Y$x+���xk�U��@�j�	�
A|� bp�>/�;�[��b��M�f>5�X$cc���\r?v� ,ԙ�� :{tk��#��[s$�
� ����B�l�9ج��Cp���꩟��`��󝎭{oж���$V����A��K�a/����D����G�M[Ν��,*-��_��@��N�����z��)�&AjM��QP�?�MQ�
�HB��݇/As-�wVA��esk�����8�!L�B��Ʊ�-T�PT�JS�,�B�ӯ�6�-�I�H��q�A����J������nr/��������Z�\�U� ��6.̠3JK�����Y�	6PG���M����$~��ȶ��]a��=��q��*~9���V�-A������Id�!m9����>ϓfQ�+��Z%�%�56���ˣ��g������i~����E�L&��s0N�Ӷ�};��F��=4�A��)�޹8�NA� w^���,V ).M3�&xL��}`�2H\�^����-��5��9Jh���� wv��h�Rvb�mqkCOփj���w��N��-���*	��\��c��TO���W�Lz�]p��鑱�A��a���H�����E{cnn�vu7 ��٠R�8�0���ᇾ0v$h�4Q�-J�,�-s΋�k(&}�� TB0Ō��_��2ۢm���N��C2 �]���7�ʱhXw���A ҈b��g'E�����uݟ=E�d�|�!�pdC�l��j�4ܛ��oFG;,t:f�-Sv�SO2v`h�0�I�{�/�P`�g�5�'����b��^��M���?�$�'д��uDh��p請�x���f������Ʃ�}
��CU�Y$�k	E݆G&p����q������nd�۽T	���5Dw+i�)p)%l�8�A�+�b�Hx\Td��ͺ�ƅ�!O����6���f��]Շk��v�g�9)��m���:���d�cw�l��Öo���=���/2������$Ax�ۃ(x��m���2r����9վ=�< =�w� 5W��w =�[Q�s��Nx�ɠ���`ΚׅW���B� ���ߊ�u�-�!kQ�,�ߘ�*b/O�W(�S(��v�n�:��P��u%V�	@�ي�y����M���C���/D������QmO���wh۸>�=n"I#L�ʗӠ����E�H������jw�}(4����{(�Rn"�U+h����mG��t�g�#A[��.#���ܶ�a�"��5��+���n�|,���5�ۏk�����������=IpZ��*�@�y��]a��	BX��р����ak��q�����9�������`������$������y{X��!Z4A9
g�-���`�p�a=��!�j��3F+���h���~�;6y^.�:n���8ZL��
�A�/��[߿?3�6�ı#G�A�!��1";����.8Z�#� C4ug�l��c��E��t���.���6�,�y���=;M�@����@g'CC����������]�\���PG��L0[#�����c�sx	���ܞ?�E?<fuy �2�uMy��a@�:{i�`���7P�A)�Wê����͟n�{��@�*�)b��#�:Ͽh��p�r�$a/�M\��X�h��F�p�u߀�@���l�ųq�)O��p�F����۸@�P��OgY����L�1"k�)������(�`��)�]������}��z�P.xho\O!�a���	�sZ�Q$�<���r:�ϳ��~�L@2
�{!�+�T�k��u��X9Q��73��9n�X�5d!A��<�������Q���^Aν�����o�G�f<8$���	V��C�:��}8�����p��J }�O��%���k��	�]��-��}�r?98g$v� {�^L�������w@��+&�k���k����7���qk�I�ڞz#���C+��(���s��+f{�{���F�עP�EE�:�L��P%Ax��uh�U���|��g�U�9�      �   _  x�]�뎃 �3�)h�}�MZ���t�~��G9�q&g(��-1�l
w`��4��MǨ��n%�ಇ~9� {"�MX��^�w��V��Fr2N,��3����
��ݦR�6r�J��D1;g�0<�f���v����fO��qt��Yq	th��� [S��>x�_���� ��J�����<��W�� �.}�Y�6�(`��J� �u-�X��p��0��A�d�ڨ�lx���� �'W�˝���d6���\U"'��c�^[�$��h�Sݕ]1&y��$�(d�m���bE��k��j��ͭ���v�S���O^�D�14k3m�Ccl�mH�� �3��      �   �  xڅX�n#9|v��]`^<�-��[3���������DV��@�h$3##3Eχ���v>�|�O�9�o��v�=������N���?)���˹o�0}�_�B�!y�e�<L������@!�@�7���.z�9���y���q�l�r����a7�q 7N����m�c7��ϯ��3"���!�`�2�_��?os�Ř3�M���j.R�
���8���q|����锯���~�︛�^�Wk*�9���J.T'|���v�{�00��X�+��,�K����|/<qpl�B� w尖c7��9�[��cw/�iP���Е�#�l��𖸏9hK�����d,Elt�g�\�i��L���T�?��㸟O��e�x����ȗ�\�����:�`�1���ʔV1��J�p��l��t{���W/�i01J�=U�G��0�b��?v�翾�����+FA�;�k�f�C�FRJw��*�"��1Ȋ�������c�%C��'JC��|y9�������H.�
���3r|�|� �t�u�S������qq�<N(�d�uŲ
��;�W#����R��7}%3��z��x
�2��`�,�v
�|b�� �.u��5;����o:n~q��,Ԝs��K~\"��	��]��O�6,H!I��������"�����j�ݫ�H�IK���έ2 &�х:��1��En����'�!P*o^%]WB�?��5��"�-�Ay���L5J	���gԿt,��B� �²��.��FbWr�d�LY�)��-~��ŕht���BY���Ojs��b�"�E����,���=1u(H��C�\Yё
Ag���wd&;Wpzd���+�1|���(�|E��O���O�LL��s<8�C*殄";��8��8�w���"-4�(I��A9����IE�'��ͼ��s�����a����$�����������Dm�y	������9ђt�M7h=8�܂��#k��lW����<�/8<�Q�L��*6x��ي�n�b�T�o0C�1Hޯ�x^��\�U�"K9�\�㥌N�y�χ�淖��Mb��PNQK �sE��
�&��= u'��jG5�dI���-A�9D�GOQ�2!�b����kr�s��~���L|Z��:|zr��1Q������??����tD bQz9�Q <c������L�Êo�c���A�;��2�Θ�q�O댏l��1O"�:�5*�s-��=>�Ty�p�"��F�����
(xqO��$�������AÂC����� �uoNK��he1�*Y]H|#ą�#:�5ψ�3�9���R�%�����}:b�:uؘ{�!�ٱ�Я��BL	v��QiB���O��ِ­	�����\)j�#�˄'ZQ���o���&o��"^IR�0�j�kM�^��!��!;�D%�R0�UI�V�����}q<�^,yG0�̩�1�z�Ԅ�Py7G �;0�˳b9<tzd�d@��b�4N!�"��l)Vxu<\Ax����TC7&rW�T|�yC�����%MUPA;��*�UT���(��*kBR��E	a-IZ�����
K돝��:����Ja��,�K����)����f�y��tr��C\Q��"�5�hڡ�aJU/ըCZ��&�ys����'~w���R�a,(T[q��꺟�w��~���"�nn\v�\�H�`,��Kk��,��?�a .��H;�g<��;|@�����	�j��J�r\=���K(�K㙝�>��xL�&�PB�P�_��^�N�7���.W;Ώ�K���1YL-����!0M�lbg��k�ˀ���b��gRG�t���o�"����~�@��]&_�"�߄�A`I����(A��Ǘ�}A�Ŗ ͷ~
�V6�Y]���q���2��o`�qh���o��%�;��WZ�_	�:Ϧ�zݹVa�2ޱ�<��� *W�߾}�?(�l         �  x��[o�Ȓǟ=�"��ʋ��l��!ye+$��d�y���[M%���9�G�,$�"�������eie�M��M�Wn�4����Ϫ�{��/��#�p�{9Q������g���"���M8�!V�Y���^j� �4��R}�o���9�.���C6f_��i~�e �̹�W���2w_�~����/�w9���7����.����?>��_���{���=�8 o�W��I�g"���q�/����x��Y�ŋ���d��ޝ�-�r{�
��J����+�~��'L��l	�`�q��B����s��!���N�X�D_&eD;���gvlC�	V�*�D01���X�ܗ�ש��t�����;�����-��`�늝)��MU��I���Q���	����[ٙ���elK�%t�:t��/�(�NW��HY&B��y�Gwr��as���A�F�j��D+o	<�y-R�]!��1���Ǝ�5�ӸFL�N��l�_,�(h�ř���k?B1߿�S�Z�BWՎ1N�5�IcfǢr�_�H^�~�7��x������_���-��q��ְ+��Z�piEY�H��Mٔ�u5tG���D��a�A�w�ؑ���3��0備�ISz݀r_���ne�T�R�etcp�n)�$����t������"�HŚI+��;�����-77e\_͝�q«^��.���Ü�y�ZRP��͝�ʎ�Ral)�rg�(vq.x�8�5��q�a>�=�Eg�쾳3�S�t�(Z�լ�S;�PD�R]o���y��UZ,#��[�i���;c�L��5g�q���'5�%MOZ�&=ix��;�o� go:k���Vv#_����b��fLQ�̭�4�6������l��a�1��mE�kc3��Y����g�>�u�	zog��[�o	٘5���D�|X��Ғ��M����Q��Z���6y�%�����9�2��&��a���"o���$l�U$�u�����c�ȹ��k90G��v��gX�����P�d��^�_����"��o�t5
�l���Vh�O�4l6�� �&01�3��ڌ����;��Ƅ�ڭ'����ש�J�K*�a@I�BR,���`Ǳ <���9�Yc��j6Y^�!/���4�V�wv��[��L�&�o}E��}߉�3c~-;2���bd�
@S��|��zDN�T@�e�xeǽ+������^����w�x�χ��w�M�o������y���ڡxi�/���p2��P���������3w/�o?��}M*�]����aq�W�6�~�{������z��K~T��w�}��u9�ϳ�����ֱ������YXѮG>)���9׬rR��w���El��F�q�w�>�`�� �ƹ>RҖ}b^��7\�k|�(�����ƀ'_��k�FƐN�TBvW&�8�sc�z�=X�5��b�uv�i�b�,d-oҽ<I�u���6<��#����| ��=�ؾX�:����r���/�|�=���-�s�lx�=?��������ނ�ނ#
}�:KId+�z�x���0/��E�5����{ޮ���X�e�l�x��UN�lҵ�b���]-�4�Cc �A޾��Y��wϐ��n*��[���7Б��xVဆ��{���?�߳p�7i/��SX�pD�����+�ĳ<^V�öx�'������m���qs�{�6hs����K�a���5(�׽?b��[�oN���m��)���g&�q���S�
����;;�ed�����F�i�1�i�Ȳ"��<I��.�1����BW�� ��lR��S����I\3����#���a�14��N�;l(�B������;>!p�]���(<L�4�sm���DQ�٭q�ה���
��~kk{o,��i\a^K���b�h��`힥Ľؙ�<�`��+�-;�=�b�-����ݝ��J������| ?�`����+AF���-,��mx����l���nB]���H~�=z;! R�6�4n�zd�:�
�Oy��m��9kS_`�dkޝʏԽ�1U��bsM]����l���M��O�����	Y���.���GՎ-��>��n��zQ��a�D�f�����^â�{���d�v0��6X'�֡����^�eZJ4E�-+C">�>���#���i7٘c�t}#�A�3�$�dyι��l���n=�;��@`���v��iH�.�ӥ-s3�C�:Q��3Eu?)pc��ɀ�a�Uo���S�N��j1�+��!�.�<j������6�[�oc�6IƜ5�_��>��J��ʰ���k*)Ի˳}��"3�-������D\��n�Q�.���9�v_��ZK?��d�]2[�RVstD�9��]@��
����sBYY���+��~���[�A���m�a}�����F�������JV�U��!.��kwZ�ˣ�y�H.|�]�j7CX#�#x�����X��Z����7��0[{[;)��O���bAy<ț]��'Xh������J1�jmøah��jMBF}`K@���K]k^XT������]o��-����"�a�]�6�4	�vB�ј�A���y}���b�٭��[�m9�W�oy�Ѽ�M%��t���b��q�P�k���gqG�/^p�|�/� E�-���:�q<<)I�r�	z�|�w/����i��3{Րg���^C��B�h��wk��5���D�� �@O=������ĭ�-����9�Z���E��DM��6�Ư-Ǫ�k>J}�}��X+f�d�cy�&��5��φ���#���/&6��D���:� {�X��T��N�D�:��1�AW�0�!֪��2�Y��i3�k�)�2�ʇ���֒��1&�*j&@�9:��"�ǽCm�*6qfG���ϙ�;K|F1ֳ��h���9-�)��g��tQ��®��%���˓���g~�'u�J�Ќۡ�:tr�(��CSΨ�[�_+�^6�p�qp�D�����6��rX,�w���",��K�������zp��>�{��{y�]kv��q�ΏY|��OSg5�_�	�c~f[]Ǡ3��Ĝ}VFIH�6Ip�W�P|�}Q�Rx�E��	k��C�,c�ڰ�'z�)�v�a��R�߲�&���B���+�Ug^�C�׍_�ŭ�j]���Z1�l=�f����-�o����'�@+;��df[�>�
͐!��U��g2]b%Jaqbj��\N�ګQm��1�bf���x>��^��'�?��our��f{q�d`���* �=�� )�����@��YZ���p'��o��l
-
!�F���!Si��Η�̽���<��"�����_�r�p�T?X�^���q<^��l��|��HNN�.!k����G���‎�7`�"]�i	)�勰���7a��`z>p�p ���o�Ƕ�P��֚7UشD���g��h0��)Q2�������n�FR�gl(C�Xmvا��4)�YvmT�u����Lx�b��Oj�䰭g"ky] �a�Rᜡu�`�%�������m`}��Fp�����%Smeo���,'5;���;��^?�5ء�6Xq���w*��DM��R��	������e�=C��̎�GpXPR��!�$:�˄0|),�v��!��"6��|�.�C6��ɤ��ڀ�"'(�'p�`� ����v�.J \�)��4*�����LDV7�+CI[kc��B6��4M�ºWq���p�
��?�����͎˾��5I��8_h�b�0��2	�{���Ht�ۤ��j�,�s��/��/s��         ^   x�5�;
�0�:9����v?I�=l�-"��?b5���<Wfn�T���4�< �����{)���f�F����Ԡo*�5P���Ԁ��{��&�      !   I   x���� ��T�D���|�����`�e��/�w������ 1J��إsY[�:�������+         <   x�3�,N���ω/-N-*�4�420��50�50V02�26�22�326117�60������ q~�          �  xڵT���0=_���,Io	Z�%QUrYi/Nj$�#�]�߳�c��j�D�q�n7EH�y3o��3�A3y`�|{����$�3xښ�a�s٣�~����'���L��$�FIA�r��*/��ȏ�p�iu|U�0�2Xf�����u��[؊\�B`��l�b��p�%�y���C����C&D����3m%0���������߲ʞ�%��J������E3ɘ#x��/Dy/�ݩ�6�0�bą�FY$�o_PIOS�8�Q6~��'�A"X��|@�i}R_�㪪��lo(-$�����tpN�H�j�&��Fs.>�t_e^2I�l��a�a�~jG_*Ӈ�fJ���{v>���}1���#Z����tY4�@"��T�j�'��:=.�a}�FZԍa��7W��ۭ�t��rn�����ב��3�]Ң��S��8�[r͎�v���Mj��n5ڵ��`0â3&���G�xyQ�w���n+���<��o#�            x�E�Q�����G@E���?�3��k�^��vE��U���{~�����?�/���~9���e����������x9����P�l�������3�"�����I����|~k�=K�3~K������g���?�_��s������s�����s��������f���}�`��z���W/��׌���E��w�j�߮�����z��^8�o�+���z����o�+�_h�+���z�|�^9���+��;�ʹ�^9���+�/��+?�;��O����+?�wꕟ��^���Y�^[�1�ş��^�9�����T�?CS��T	S0����ʘʈʘʈʘʈʘʈʘʈ�x���*#*�UFTƫ���W������x����*�6��UFVƫ���������������������������Q�SKOe,e<����TƧ��2>e<��)㩌OOe|ʨ��O�2>eL�S�2>e����1+c+cV�VƬ���Y[�2�2fele�����V�V��!���2�2��8�x+�(���V�Q�[Goee��8�X�q��*�(cq�)c����>z�R8���9��r8���9膒8���9���8���9�����֑��VZ�:���0�H�}���>�u�G�:Σt�ч����`�jj$M�{�F��8䵝IKÓ4�����H�����׊j$M�  -�F�Ā ZS��.�-�F�Ă�ZU�����@˪�4� ��U#i"BB-�F�Ą�ʩ�4Q!���V#i�B���F�D��Z\���	��I:hy56����I!Bh�5���7i�D	��F҄��b��		(����ֿ
�*��I,Xh�5�&\$��k$M�H��5�H��� Ck�_��	9�W�Ҡ��X#i�F���F�D��Zc���	;��I��M���Ck���)�h�5�&�$�k$MI �5�H�0�`Dk�K8�5�H�H��Dk���*m�/W����F~��%	K���%+�$,���h�5�V,IX�5�ȯ[�$a��Xc�2W,�k$M,IX�5�H��v`��X#ibI���$,�k$M,�>uK�<(�OĒ��$�B,�>�K�O#Ē�	�$�TB,IX�S��%Zc���%y�dEi�Dk��4��%Zc���%,�k$M,y`��X#ib�K��IK��'GS#ib�K��IKX�5�H�X����F�Ē�h�5�&�<�Dk��OƔK��IKX�5�H�X����F�Ē�h�5�&�<�Dk��4��y��Oi�Dk��4��%Zc���%,�k$M,y`��X#ib�K�ƿ�h�5�ɦ�`��X#ib�K��IKX�5�H�X����F�Ē�h�5�&�<o��*�h�5�&�<�Dk��4��%Zc���%,��X�5�H�X�����>�V���i����FN�Œ�?[�%,�k��Z,y`��X#��b�K��9�KX�5�ا�J�%Zc���%,�k$M,y`��X#ib�K��IKX�5�H�X�����4X�5�H�X�����%Zc���%,�k$M,y���X��G���'b�s?�(�?��%ODKfFKfH�'���"����"�LX�5�H�X2a��X#ib��qhj$M,��Dk��4�d���F�Ē	K��IK&,�k$M,��Dk��?~)�h�5�&�LX�5�H�X2a��X#ibɄ%Zc���%�h�5�&�̧?�)�h�5�&�LX�5�H�X2a��X#ibɄ%Zc���%�h��h�5��K����F�Ē	K��IK&,�k$M,��Dk��4�d���F�Ē��gY����F�Ē	K��IK&,�k$M,��Dk���Dk��4�d�����謴՟��K����,�LX�5���g�d���o���F>B�%�h�5�!Z,��Dk��?�+�h�5�&�LX�5�H�X2a��X#ibɄ%Zc���%�h�5�&���W�K��IK&,��&,�k$M,��Dk��4�d���F�Ē	K���B��`��X#ib�K��IK^X�5�H�X��5���b��W=Ē�/{�%��15�&��}�C,y�҇X������b�K��IK^X�5�H�X����ƾ̢4X�5�H�X����F�Ē�h�5�&���Dk��4��%Zc���%��Wu�K��IK^X�5�H�X����F�Ē�h�5�&���Dk�{a��Xc_DR,�k$M,ya��X#ib�K��IK^X�5�H�X����F�Ē��kVJ�%Zc���%/,�k$�.`�&���Dk��4��%Zc��_�$M,yW_"S��kdJ�%Zc�\%K^X�5��u2���+�b�K���T&���Dk���eb�K������`��X#ib�K��IK^X�5�H�/��ra��X#ib�K���
��`��X#ib�K�ƿ�h�5�&���Dk��4��%Zc���%/,�k��J�%Zc���%�h�5�&�,X�5�H�X�`��X#ibɂ%Zc���%k��ͩ�4�d���F�ĒK��IKV_IKV_JKV_KKV_LKV_MKֽ�����*����*����*����*�,X�5�H�X�`��X#ibɂ%Zc���%�髷J�%Zc���%�h�5�&�,X�5�H�X�`��X#ibɂ%Z�߂%Zc�}�Xi�Dk��4�d���F�ĒK��I۾A�X�`����`��X#ib�z�ڴ�`��X#iǷ2HK,�k$M,Y�Dk��4�d���F�ĒK���R��V_W,�k�j�X�`��X#��ŒK�ƿ�7RĒK���&.�,X�5�H�X�����4X�5�H�X�`��X#ibɂ%Zc���%�h�5�&�,X�5�H�X�v_�W,Y��K��IK,�k$M,Y�Dk��4�d���[P�Dk��4�d����4X�5�H��;R��%,�k$M,�`��X#ib�K��IK>X�5���1�F�Ē�h�5�&�|�Dk��4��%Zc���%,�k$M,�`��Xc�6Q,�k$��=7�Ē�h�5�&�|}�F,���X��-���{4b��7iĒ�ޥQZߦK��O�|��4��%Zc���%,�k$M,�`��X#ib�K������`��X#i��*�&�|�Dk��4��%Zc���%,��>X�5�H�X�}Ji�Dk���㻘��%,�k$M,�`��X#ib�K��IK>X�5�ط�������`��X#w�Ē�h�5r�K,�`�������Fn}�%,�k��X����wh��Ŧ4X��]Z�|��|�SK�ƿ�h�5�&�|�Dk��4��%Zc���%��;zJ�%Zc���%,��>X�5�H�X����F�Ē�h�5�&�|�Dk��o *�h�5���>4ibɆ%Zc���%�h�5�&�lX�5�H�X�a��Xc߯�IK6,�k$M,ٰDk��4�d���F�ĒK��IK6,�k�ۣJ�%Zc�����N�X�a��X#ibɆ%Zc���%�h�5�&�lX�5�����*�h�5��|_�4�d�]_�d�m_�d�}_�d��_�d��_�d��_�d��_�dߛ�J뻿b��ۿ�{��%�h�5�&�lX�5�H�X�a����a��X#ib�~�^��`��X#iǽ�ĒK��IK6,�k$M,ٰDk��4�d���ƾ�������K����-�lX�5���m�d���o���Fnq�%�kbɆ%Zc���%��[�J�%Zc���%�h�5���,�n~����,�n����,�n������;�J�%�z ��	K�ƿK��IK6,�k$M,ٰDk��4�d����.
(�h�5���yB�Xr`��X#ibɁ%Zc���%�h�5�&�X�5�ؽ���4�����F�ĒK��IK,�k$M,9�Dk��4�����ƮA(�h�5���YC�Xr`��X#ibɁ%Zc���%�h�5�&�X�5���[J�%Zc��-7yHK,�k$M,9�Dk��4�����F�ĒK����4X�5�H���ib��2�Xr�M"�����%��$b��B�Xr�Q"�����%�vJ�֥�����F�ĒK��IK,�k$M,9�Dk��4�����Ʈ�(mu�Ei�Dk���Xr`��X#=���������F�,bɁ%Zc��YĒK���2�4X�5�H�Xr`��X#ibɁ%Zc���%�h    �5�&�X�5�H�Xrv7t�K��IK,9����f,9����v,9����,9������B��`ɩ�it͈��49�7'�g��T���j�A�S�3�r�ySNu�F��>�*���Vά����r�B�帇6@�qm���.� .�m�]��h�7�Ftʹ 渕6 �y�_G��i�w��9n�(s�O`渡6��qGm ��ڀ4�=��t�ʹ�渫6��Y��#�}�n�k�w��9n��s�[ 縹6`�qwm ���ژ]�r.�9n��s����ۀ<�=�z��l�w��9n��s�g���6��q�m�]8s.:.��j3��n��r��m��m.���6����蒛[n�kn.���6n�͹��n�u�QM�.���6n�͝�qKon��[{s�m�⛛o�V��}����۸�7���m��7�[��;�܈�s�;pntn�	7�
7܅]�nÍ����F�q�+qÝ�ѥ��V��Z�p/n�[��;�j����;p;nt=n�7� 7ܐ]��ȍ.���F��{r��r�M��U�����p[n�[<�;���x�����nk�C�;�>X�C�c���>\�C�����>`�C���[�>d��-?���5�Q��.�
���c�e�Q5ۮӍj�v�nTٶ+u���]�U��Zݨ�m�Fo�0��\7���� ����n�������� ����n��0������8r���@��r7̼.��8��L����8��̽.��8��L����8��̾.��8����w�E�a�u��Ǒ�w` v��Ǒ�w`v��Ǒ�w`v��Ǒ;����n��8���w���av��Ǒ�w`v��Ǒ�w`v��Ǒ�w`v��Ǒ�w`"v��Ǒ��\��u+�~��� �p��o�z��\M�[�.�-W�ց�|�������+������bpT��߁���l&�����
�f⿊����$l&��	���(\M�[���-W[�օ�/|��������p��om�z÷8\��[���-W{�և�?|�� ����q��o��=�Eb7��V��%�[&v�8n��}⸅b7��V��)�[*v�8n�ؽ��b7��V��-�[.v�8n����c7��V��1�[2v�8n��=�Ec7��V��5�[6v�8n�8�Gh&F)	���J�wPbB31�Mh&F�	��(C��%)4�<�fb���Lt9n	�-�5d�����D�[Ev9n�m�ud�����H�[Iv'9n)٭丵d�����L�[Mv79n9����d�����P�[QvG9nI��ݸ5e7f��ݙ�[Uv6nY�U׸ue�]���q��,�*�Eu�������_�p��~��oj��_�Udߩ����Y���s�ѷ����*Ř���XUU�V�����rQTUy[/��*�zo�����*����*���
3T����EU��e����nUU����U�QRU�m�(����EU��_�-�J���]iHU��_�e��_��J3:���-!EU��5����.��ʻL��*�R�����E���.��ʻl��*�ґ����G���.!��ʻ���*�R�����I���.)��ʻ���*�Ғ����K���.1��ʻ̤�*�R�����M���.9��ʻ줪*�ғ����O���.A��ʻ��*�R�����Q���.I��ʻ,��*o4�`�����Tie*e�����V�RVZ�JYie+e�����V�RV��*�2����KY���.g��ʻ���*ﲖ���K[���.o��ʻĥ�*�2����K]���.w��ʻ䥪*ﲗ���K_���.��ʻ��*�2����Ka���.���ʻ$��*ﲘ���Kc���.���ʻD������/o��<P��b8R'1$�s���)�M��'u�@�:y`J��<Mc�X)�\��i��,O��hy-f��l1\�����4]����b�<��Y S�,��<+Ս\3�1u�� �:]y�L��<`�NV8S�*��S��ԙ�j�D�5u���iIv�7������9�p��8u��:Ay`N��<@�NO�Sg'ة���4�K�#��y O��L�S'&��y�>uZ2�O��L�S'%��9�@uJ2!P���ѿ:J,$�-��\ShB�:�`�NF&�s�	��TdB�:���ND&,��	��4dF��r.8���	��d�:���@&H��	���c�:��P��>&X���	���c>��ҹ�)�)�-�6�y�Nu�1�S�V	���J��V(�Q1!���� ʂT�ٿ����HńRv�b�)KR1�-���ʚTLHeO*&��(Vٔ�	��JńVv�b�}z�ܷ�J!����}�c^MxUg\^٘�	��LńWv�b�+KS1ᕭ�����TLxeo*����W�5�&��:^ٝ�	�,OńW��b«:���'��@�χ̫�'D�ռgD�͒k^�>'2�f��W�ϊ̫٧E����"�j���y5�U�gNxe�*&��Ms��X	��W^Y��	�lTńWV�b�+;U1ᕥ����VULxe�*&��W^Y��y��Tarͫ	��V��,W��lW���W���W��,X��lX���X���X�;��$er�Ҕ�5�^xe�*^xe�*^xe�*^xe�*^xe�*^xe�*^xe�*^xe�*��^��+W��+W��++W��+;W��+KW��+[W��+kW��+{W��+�W��+�W�>}��\xe�*^xe�*^xe�*^xe�*^xe�*^xe+^xe+^x�%�ë,^e	����)�����U����px�%�ë,=^YƊ^�Ɗ^YǊ^�Ǌ�����h�tt>b�W/���oN3�^xe++^xe-+^xe/+^xe1+^xe3+^xe5+�՟����M���W/���/���/���/���/���/���/���/���/����ן���lg���g���g��,h��lh���h���h�۟�̨�?ʙQo�{J��s��Osf���̨�?ϙQo�3���DgF���Όz�u�x�}�xᕅ�xᕍ�xO�t.�z�Q���V,xek+���^�ۊ�,nłW6�b�+�[���ݭX���V��_��xe}+���^Y���lpłWV�b�+;\���%�X��W,xe�+���+�ss=`�\3j�+�\���]�X��2W,xe�+���^���,tłW6�b�++]����^�v ׌Z��VW,xe�+���^Y��lvłWV�b�+�]����X��vW��W
�}����ʂW,xe�+���^����z��z�1��Y���e��z���<͢�Q8^�z����@x5�}eɌZ�ʾW,xe�+���^Y����|łW��b��8�\xe�+���^Y���l~łWV�b�+�_����X���W,xe�+�����2΅W6�b�++`����X��X,xe,��^���,�łW6�b�+�`�v_r.��^�����łW��b�+a�����X}ʼZ}ʼZ}ʼZ}j�K�:�s�B�y��J�y���(���kQ����̫^Y�^��^Y�^��^Y�o�0?+^Y�^��^Y�^��^Y�^��^Y�^��^Y�^��/��[=��\��W���W���W��W6��WV��Wv��W���W���W���{��_=�\��W6��WV��Wv��W���W���W���W���W��W6��}��K���,���l����������,���l����������,���l����UN��+�d��+e��+e���������<�ꭇ��������z�z�9<���A<}yչ��G�������,���l����������,���l�����������u]��+[f��+kf��+{f��+�f��+�f��+�f��+�f��+�f��+�f��+�f�����\xe�,>xe�,>xe�,>xe�,>xe�,>xe�,>xe�,>xe�,>xe�,>xe�,��W������,�ņW��b�+�g�����}�ܼ�}�ܼ�}�ܼ�}ݼ�}���-�%t _  ?m����W�/��W����W�/��W^YE���ņW��b�+�h��u����>Z��k���'rͫ���ņWv�b�+Ki�ᕭ����ZZlxe/-6���^�L�����~��A=_�\�j�+�i�������~ZlxeA-6���^YQ���ņW��b�+[j�g߭�[��
��+�j��M���ʪZlxeW-6���^�V����ņW��b�+k�ᕍ��o�'q.���^YZ��l�ņW��b�+{k���y��͵����Zlxew-6���{���+�k������j����ժ����U��W���V=@^�z��Z�1x�x�X�r.�Z�1xe�-6���^Yf��l�ņW��b�+�l�ᕅ����F[lxe�-��[R΅W��b�+[m�ᕵ����^[lxe�-6���^Ym���ņW��b�+�m�O�s.���^Yp��l�ŁWV���+;nq��%�8�ʖ[xe�-���^Yt�3�&������ŁWv���+�nq��m�8}�ϼ:}�ϼ:}�ϼ:}�ϼ:}�ϼ:}�o�s���_=(�\����?���@���+�oq��ͷ8���[xe�-���^�~�����y��c=��\���+pq���8��\xe	.��^Y�����ŁW���+�pqf��G��O��+�pq��m�8��:\xe.��^و����ŁWv���+Kqq����8o�iu.��^Y���l�ŁWV���+�qq���8�70���^ُ��,��Y}�׹�ʊ\xeG.��$^ْ����ŁW����+�rq��M�8�ʪ\xeW.������l�ŁW_=�^}��Cx�Ճ��WO>�W_=�^}��Cx�����WO?�W�?��΅W���+�sq��չ8���\xey.��=^Y�����ŁW���+tqN�Mw.��C^Y���l��W��r�+{t9��E���&]xe�.��K�^Y��1�6�������W��r�+u9������J]xe�.��T�^٪�����W��rD��Q���	�^Y�������Ƃ�8���$��,�1��K~N��ւ�8���'%��-�Q������a���~Z�W��r�+{v9��E��ʦ]xe�.��k�^Y���l��ݘ��kve¹���]xe�.��r�^ٹ��,��W��r�+kw9�������]xe�.��]��+�w9������]xe�.���^Y���l��膔�8�����^��%��+kx9��=���"^xe/����^����,��W��r�+�x9��}�_�S��l��WV�r�+;y9������V^xe-/����^Y���l��WV�r��8^�z`+����Vx�둭�j�3[�ծ��«]Om�W��
�v=�^�zp+��<���8΅W��r��]o�W���
�v=�^�z~+��� Wx��	��j�#\�ծg��+{��@~f,�������e�+K{���^�������e�+�{���^�������eD7��a��W���e�+�{��_�������e�+;|��_��ŗ���e<]}���k^��ɗ�]+�*�le^E��̫躕yݷ2��W�Ut�ʼ��\�Wq;W�x�.]9^Y�ˀW��2����xe�/^Y�ˀW6�2��վxe�/^Y����ը�w�˹��~_�����l�e�++~�ʎ_����l�e�+k~��4�^Y��X]3s.������e�+�~�ʶ_������e�+���_������e|�os.�������e�+{���_�������e�+����_�������e�.�9^Y ̀W 3���xe0^Y ̀W 3���xe0^Y ̀W 3N7���N=k^Y ̄W 3��Lxe0^Y ̄W 3��Lxe0^:�UB?u^�z�4�:��ixu�����ԓ��թGOëSϞ�W�>�N=}^Y ̄W 3�;���krͫ�W 3��Lxe0^Y ̄W 3��Lxe0^Y ̄W 3�.O�s��5�^Y ̄W 3��Lxe0^Y ̄W 3��Lxe0^Y ̜�ڬ|wmӹ�5��k��UvOԼ�.��W�MQ�*�*j^ewEͫ첨y��5���W 3�F�|�FV�ʨ���3jh�-��Zy[��V�ڨ���7jp�-��\y��F׿Bz���og��ˣ ���- �-�[ �[M� ���n0o=�`ނ���u��%� �k�% f�K ̮�� �]V/0��^`va����z	�٥� �k�% f�K ̮�� �]^/0��^`v����
{	��%� �k�% f�K ̮�� �]f/0��^`v����J{	�٥� �k�% f�K ̮�� �]n/0��^`v����{	��%� �k�% f�K ̮�� �]v/0��^`v����{	�٥� �k�% f�K ̮�� �]~/0��^`v���
|	��%� �k�% f�K ̮ �]�/0�_`v!���J|	�٥� �k�% f�K ̮Ɨ �]�/0�_`vA���|	��%� �k�% f�K ̮ʗ �]�/0�._`va����|	�٥� �k�% f�K ̮Η �]�/0�>_`v����
}	�yK�n��mѻ:��F��|����y��n��mһ>��J��|�.��y��n��mӻB����Q_�p��~�Po&�kԛ��*�f�N����To&�k՛��j�f�^��x��n��mֻN��Z�>}�n��y��n��m׻R��^�N}�~�K�y�n��mػV��b�^}ގ���yK�n��mٻZ��f__$r{��U"�h�W>5��Dnվ�P�v��+Enپ�T���kEnݾ�X����Enι\�6���En徾`�v��+Fn龾d���kFn���h����Fn�l�6���Fn���p�v��+Gn���t���kGn���x����Gn��|�6���Gn����v��+Hn	������kHn�������Hn����6���Hn����v��+In������kIn�/&i&��$�D��乆I}=I�����f"_Q�L�KJ������__�q{�����__�q���]��_�vq���%.�O������x~������,ϓ)            xڋ���� � �         �   xڝ��
�@�ϳO�O�RyuɃV&ZD�Eۡ�����G�����1��}0E�<��)�������d )�ti�l;��@�˲�����_�ԓn8��'I�������܍�?�n11��ܥ\�V��:'��˽>����*S6��D��K���>�/�d���~}����Ä�Xw3�-�j�g��>�&<��N�7�AX�c�� �r0         >   x����0ѳ���&K/�_|$��q�kxʷ<�Ry��c�:i�4�+N'���s/��E      
   >   x����0ѳ���&K/�_|$��q�kxʷ<�Ry��c�:i�4�+N'���s/��E      '      xڋ���� � �      #      x�E�Q�丒C���Ō��I�e�����p��)̞T�:O2$`�����7b��F��O��A�?��w�>������
�&W�jq5�J�W��+�:\m�.W��dB�CH�J�d�r�rAYA����ATVT�~V� ,+l����e�i�'�v�i�҂�]iAڮ� mWZ��+-Hە��J��]i"�T�H;�'$�T�H;�&�N���Si"�T�H;�&�N�M�N�M�n�M�n�MҮ�#�V�$�V�$�V�$�V�$�V�$�V�"�V���髴\V����&��dqYi+�������u���u�������$mTZ�6*-I����JK҆�{$mTZ�6*-I����Jۤ�JۤE�mҢ�6iQi����MZT�&-��?iQi����MZT�!-*퐦J;���i��C�*퐦J;���i�Oi�οC�*풦J���J���J���J���J���J���J���J��M�p�6����6�#ϊ��@;2>-����%�#Ӛ��P{2>R-����)�#�U�=V�mW�E��e�5-آ�\Ը��ZxQ�/�/`d`�h�g䚘�1�1ddd������8#;3�F�f �,̀���5�5ltRr�̀���7�7pdp���ȑ��#�3@GFg���΀���;�-8��g �,π���=�=|d|�������3�� �i�M4 h~��cq�\�Fh�дB��84�� �i�MK4�h���E�0��h���;�\s4�hڣH� D�i@�4I��M�4��@�i�,M�4piڥL3��%��i@�4M��m�4��@�i�<M�4�iڧP�@��j@�4Q����4�Fj�ԴR���85�� �i�RMK5�j���U�V���j�մV��������ګ��٧���*�jګ��i����
���*�jګ��i����
���&�ګ��i����
���*�jګ��i��07�U�մW�W��Cx5�@�W���#^�>���C^�>���c^�>���^M{Ug�i����
����b�ګ��i����
���*�jګ��i����
���*�jګ��i����3 ��*�jګ��i����
���*�jګ��i����
�Z�*�j٫�����sq�\�Z�*�j٫��e����
�Z�*�j٫��e����
�Z�*�j�>��k����
�Z�*�j٫��e����
�Z�*�j٫��e����
�Z��mr�U�ղW�W�^^-{x��U�ղW�W�^^-{x��U�ղW�WK}�'�^^-{x��U�ղW�W�^^-{x��U�ղW�W�^^-{x�f� w�7r��j�+����ix���j�+�ղW«e��W�^	���^-{%�Z��ڐk��W�^	���^-{%�Z�Jx���j�+�ղW«e��W�^	����T��+�ղW«e��W�^	���^-{%�Z�Jx���^��*�W�����z_���osx���^��>�W������otx��+^-{%�Z�Jx���j�+�պ�-�\{%�Z�Jx���j�+�ղW«e��W�^	��^	��^	��^	��믯�k��U�+�U�+�U�+�U�+�U�+�U�+�U�+�U�+�U�+�U���L��^��^��^��^��^��^��^��^��^��^e�vr��*��*��*��*��*��*��*��*��*��*�O
ȵW«�W«�W«�W«�W«�W«�W«�W«�W«�W«�������(ȵW��^M�J{5�*��^���x��j�Uګ�Wi�&^���x��j�U�~8B���x��j�Uګ�Wi�&^���x��j�Uګ�Wi�&^���x��j�U�~*C���x��j�Uګ�Wi�&^���x��j�Uګ�Wi�&^���x��j�U�~D���x��j�Uګ�Wi�&^���x��j�U�3(��~�W�O��*�1^�{En?�«�'Qx��(
���E�U��(�J{5�*��īm�&^m{5�j۫�W��`�k��նW����x���īm�&^m{5�j۫�W�^M���j�նW���'o�ګ�W�^M���j�նW����x���īm�&^m{5�j۫�W�^M��я�ȵW����x���īm�&^m{5�j۫�W�^M���j�նW����x���ɵW����x���īm�&^m{5�j۫�W�^M���j�նW����x�g?�$w�SNr��«m�^m{��j۫�W����նW���Zx���«m�^m{��j�~�J��Zx���«m�^m{��j۫�W�^-���j�նW���Zx���«���.��j�նW���Zx���«m�^m{��j۫�W�^-���j�նW�����ګ�W�^-���j�նW���Zx���«m�^m{��j۫�W�^-�ڷ�d�k�^m{��j۫�W�^-���j����x���9^�~~�W�����'�xu�#�ŵs���Ct�:��N?Fǫc�^{���ث�W�^-�:�j�ձW���g��ګ�W�^-�:�j�ձW���Zxu��«c�^{���ث�W�^-�:�/ȵW���Zxu��«c�^{���ث�W�^-�:�j�ձW���Zxu�o+ȵW���Zxu��«c�^{���ث�W�^-�:�j�ձW���Zxuf�&!w�{r�U�ձW�W�^%^{�xu�U���wxu�U�ձW�W�^%^{�xuV��!�^%^{�xu�U�ձW�W�^%^{�xu�U�ձW�W�^%^{�xuv�"�^%^{�xu�U�ձW�W�^%^{�xu�U�ձW�W�^%^{�xuN��"�^%^{�xu�U�ձW�W�^%^{�xu�U�ձW�W�^%^{�xun�#�^%^{�xu�U�ձW�W�^%^{�xu�U�յW�W�^%^]{�xu�~	��v.^]{�xu�U�յW�W������xu��^�~��W������xu��?r��^�~��W�_ �յW�W�^%^]{�xu�U�յW�W�^%^]{�xu�_;�k����J���*��ګīk����J���*��ګīk����J������ګīk����J���*��ګīk����J���*��ګīk�������~�J���xu��ƫk�6^]{���ګ�W�^m���7��k�6^]{���ګ�Ww�+^r��ƫk�6^]{���ګ�W�^m���j�յW����xu��ƫk�6^���ɵW����xu��ƫk�6^]{���ګ�W�^m���j�յW����xuO��&�^m���j�յW����xu��ƫk�6^]{���ګ�W�^m���j�ս�6�\{���ګ�W�^m���j�յW����xu����_|��wL�ڹ?�~���y������k����];����ڹ?�~���y��v�ϫߵs�\{�;�s��$�^���\;7�� �^���\;7ɵW�c:����vea�۝�Mn�6��Z��vma�۽�M�+.��ͅMnW6���wL�ڹ�\{�;�s��C���ӹv�!�^���\;���nL�k�~�t��{ɵW�c���^���\;��k�~�t��{ɵW�c:�ν�ګ�1��j�;��A�������wL��u��\{�;�s���G���ӹve�#�R���wL�ڹ���%r���εs���wL�ڹ�\{�;�s��A���ӹv� �^���\;7���N!�^���\;7ȵW�c:��r���εs�\{�;�s�\�k�~��ߵ��ӹ�Z���wL�ڹ"�^���\;W�ګ�1�k�\{�;�s��I���ӹv�$�v�\{�;�s��I���ӹv�$�^���\;w�k�^{u�jث�W�^�_���ūa�^{u�jث�W�^����հW���:x5����a�^��$r����a�^{u�jث�W�^����հW���:x5����a�^�������հW�Fw��jt�
�F���jt�
�F���jt�
�F7��jt�
���\�ۥ+����հW���:x5����a�^{u�jث�W�^����՘]�"wvۋ\{u�jث�W�^]����հW����x5��ūa�.^��t�հW�������հW����x5��ūa�.^{u�jث�W�^]����հW���~����հW����x5��ūa�.^{u�jث�W�^]����հW���b����հW����x5��ūa�.^{u�jث�W�    ^]����հW���F����հW����x5��ūa�.^{u�jث�Wa�.^���x���U|]%\\;��^]�
{u�*��ū�W��^]�
{u�*��ū�W��^]���Fr��ū�W��^]�
{u�*��ū�W��^]�
{u�*��ū�W�"�<I���x���Uث�Wa�.^���x���Uث�Wa�.^���x���U�[��ګ�W�-Q�����UtO����x�ū�(^EwE�*�,�W�mQ��W%��/J�+�"V��(dū�bV��(h�+��V��(lū��V��(p�+�"�_�^#�î�I����?�z���^3�ï�M� ��?{���^C�ð��~�s]"�P�{��A�H?���w�E�ɺ����t��ò��>p]&�Ь{뿃w�u�Ϻ�����W���Q�AZ7����~��-���[��u����;�^�l�f�}��Y�A[7�������A�K?t�^��w���ߺ����t��C���Q�AWL?����C�� ����0���ˋ}@�m�߇͇��������C��u����;��w�|�}��o�^�������AWN?����wХ����;0r];�p����AO?��>��w���������+qs�>�௛��A�O? �v��w���!���t��n��>p�B�`���܁^��;�"ꇄݗ������~X؝���˨vo���;�:ꇇݝ�}����!b���������|]v�M�E�EO�>^��}�=E�xEz����T��U������S��W��MmzL��:=w�����W��ĿF=&�U�1�S���zL�k�c�_�_��b}�b=��x�z����t��u�)��+�Ӯ�׮�^�^O�>^���}��=�x{*��*�t��u�)��+�Ӳ�ײ�f�fO�>^Ϟ�}��=M�xM{����t��u�)��+�Ӷ�׶�n�nO�>^ߞ�}��=��x�{*��*�t��u�)��+�Ӻ�׺�v�vO�>^��}��=��x�{����t��u�)��+�Ӿ�׾�~�~O�>^��~�>�x|*��*�t��u�)��+���§���O?^�"~�">M�xM|����t��u�)��+��Ə�Ƨ���O?^�B~�B>��x�|*��*�t��u�)��+��ʏ�ʧ���O�;^/�x�b>��x�|�������u�)iG��_�\��;���������?�j����{�^���G���w����%���}2 �*�'���}2 ���'���}2 �*�'���}������
�*�'���}2 ���'���}����4���}2 ���'���}������w�J������J�*�'���}2 ���'���}2 �*���qYi Q�d հO�Q�d կO�Q��d ծO�Q��d խO�Q��d լO�Q��d իO�Q��d ժ����b�VZ!p+�����[i��+�~�o�Տ�������V?�����V?�դO�QE�d գO�Q5�d բO�Q%�d աO�Q�d ՠO�Q�d ՟O�Q��d ՞O�Q��d ՝O�Q��d ՜O�Q��d ՛O�Q��d ՚O�Q��d ՙO�Q��d ՘O�Q��d ՗O�Qu�d ՖO�Qe�d ՕO�QU�d ՔO�QE�d ՓO�Q5�d ՒO�Q%��`�6��˲"urYv�.˒Թeْ:�,kR��eO�в,J�Y�M�#�jU`e=V�mW�e5,ȲZhYM���\V�.�u��ռ�˲/uNY��)k�g䚘:�,Sg�edꈲ�L�P���ʲ3u>Y���'����d��:�,[Sg��Rr�M�L����ɲ7u.Y��%��ԩd��:�,�Sg�et�H��N�H�٩�:-8����#���id��:�,�Sg�e|�(��O�D����Ȳ?uY��!��)d���A��3�2BuYV�N ��d١:,CTǏe������i���ƨ�����ڹx����i��ؑ�Ni��Б6��i��ȑV�Ni����v��9��%���Ni�갑���i�ꨑ։`�yb i� F(���`��b �[�\#� 0�J1 �4S #��HC� 0�R1 �4U #m�Hc� 0�Z1 �T�U�ȵW #�ԃWi�ꔕ��`��b i� F�+����`��b i� F�>��k� F�+����`��b i� Fګ: ����_�+��}«�^�;��G"��>�U����OEx�},«�s^e��*�U�-�^1 ��W #w�ȵW #��H{� 0�^1 ��W #��H{� 0�^1 ��W #����g@r��H{� 0�^1 ��W #��H{� 0�^1 ��W #��H{� 0���\{� 0�^1 ��W #��H{� 0�^1 ��W c�+�������`�O�ɵs�j�+�������`l{� 0��b �^1 �m� ƶW c�+��G�ɵW c�+�������`l{� 0��b �^1 �m� ƶW c�+�������+�������`l{� 0��b �^1 �m� ƶW c�+������/䪿a�k� ƶW c��4����`l{� 0��b �^1 �m� ƶW c�+��g�!�^1 �m� ƶW c�+�������`l{� 0��b �^1 �m� �^���\{� 0��b �^1 �m� ƶW c�+������M�v�ë����j�/s���9���u�v�ë�_��j�7:�������b �^1 �m� ƶW c��I��b �^1 �m� ƶW c�+�������`l{� 0��b �^1 �}��+���`l{� 0��b �^1 �m� ƶW c�+�q��8��`{� 0��ߛ�k��ձW ��+�q��8��`{� 0��b �^1 �c� ƱW ���N��b �^1 �c� ƱW ��+�q��8��`{� 0��b �^1 ����\{� 0��b �^1 �c� ƱW ��+�q��8��`{� 0��b G���\�3
r��8��`{� 0N?Y«c� ƱW ��+�q��8��`{� 0��#��+�q��8��`{� 0��b �^1 �c� ƱW ��+�q��8��ʐk� ƱW ��+�q��8��`{� 0��b �^1 �c� ƱW ��~D��b �^1 �c� ƱW ��+�q��8�
�N?�«�O����c(�:�9�� 
�N?�«ӏ�����(�:�0
���b �^1 �c� ƱW ��+�qn? #�^1 �c� ƱW ��+�q��8��`{� 0��b �^1 �k� ����[r�\����`\{� 0��b �^1 �k� ƵW ��+�q�����`�я�ȵW ��+�q�����`\{� 0��b �^1 �k� ƵW ��+�q��5�k� ƵW ��+�q�����`\{� 0��b �^1 �k� ƵW �r��~�I��b �^1 �k� ƵW ���p����`\{� 0��b �^1 �k� Ɲ�x�\{� 0��b �^1 �k� ƵW ��+�q�����`\{� 0��b w�s]r�����`\{� 0��b �^1 �k� ƵW ��+�q�����`���ɵW ��+�q�����`\{� 0��b �^1 �k� ƵW ��+�qO?�&�^1 �k� ƵW ��+�q������n?>ǫ������t�����{�Nn?Cǫ�����St������b �^1 �k� �W ��+���@}_?�O����J��b ��^1 �g� �W ��+���@}���>{� P��b �o�Kr�@}���>{� P��b ��^1 �g� �W ��+���@}�������+���@}���>{� P��b ��^1 �g� �W ��+���@}�� �
  $�ߓ�k� �W ��+���@}����~{��k� �W ��+���@}�_Аk� �W ��+���@}���>{� P��b ��^1 �g� �W ��~3D��b ��^1 �g� �W ��+���@}���>{� P��b ��^1 Է������>{� P��b ��^1 �g� �W ��+���@}���>{� P��wa��+���@}���>{� P��b ��^1 �g� �W ��+���@}�_k� �W ��+���@}��/��In��ëѯ��j��?�����{��\;�F��ë�/ �j�+������b �a� j�+������b �1��#������b �a� j�+������b �a� j�+������b ����\{� P�^1 ԰W 5�@{� P�^1 ԰W 5�@{� P�^1 �P�h%W���\{� P�^1 ԰W 5�@{� P�^1 ��^{� P�^1 ԰W 5f��%�^1 ԰W 5�@{� P�^1 ԰W 5�@{� P�^1 ԰W 5V�[&�^1 ԰W 5�@{� P�^1 ԰W 5�@{� P�^1 ԰W 5v��&�^1 ԰W 5�@{� P�^1 ԰W 5�@{� P�^1 ԰W 5N�M'�^1 ԰W 5�@{� P�^1 ԰W 5�@{� P�^1 ԰W 5n��'�^1 ԰W 5�@{� P�^1 ԰W 5�@��b ��W ������@r�\�
{� Pa� *���Wѕ���,�Uti��[x][����^�+.������.�U�+�
{� Pa� *�@��b ��W ����^1 TD7&ȵW ����^1 T�+�
{� Pa� *�@��b ��W ���B]� W�� �^1 T�+�
{� Pa� *�@��b ��W ݐ«�W ���bvI�\{� Pa� *�@��b ��W ����^1 T�+�
{� Pa� *V�SȵW ����^1 T�+�
{� Pa� *�@��b ��W ���bw-�\{� Pa� *�@��b ��W ����^1 T�+�
{� Pa� *N�qȵW ����^1 T�+�
{� Pa� *�@��b ��W ����v�\{� Pa� *�@��b ��W ����^1 ��@�^1 ��@��Rr�\���b (�+���b (�+���b (�+���b (�+���b (��>�k� J����]+�R���Jݶ�+u�
��}+�R��Jݸ�+u�
��:W�v�
�d� J���d� J���d� J���d� J���d� J�������d� J���d� J���d� J���d� J���+�+�������d� J���d� J���d� J���d� J���d� J��m��+���b (�+���b (�+���b (�+���b (�+���b (�.֑k� J���d� J���d� J���d� J���d� J���t��G��b (�+���b (�+���b (�+���b (�+���b (�+���*!����d� J���d� J���d� J�����b �i� j�+��_w�k��մW 5�@M{� P�^1 ԴW 5�@M{� P�^1 ԴW 5G�'ɵW 5�@M{� P�^1 ԴW 5�@M{� P�^1 ԴW 5�@���&����f�D�jvM�f�D�jvQ�f7E�jvU�fwE�jvY�f�E�j��(�}Q�_a��k�B�|�Q̚�3
Z�FQk��(l�Wŭ�z��5_q������� �:� �Z� �z� ��� ��� ��� ��� �� �� �[�5 T��k �n�� P�U����^@u_����z ՝� �[�5 T��k �n�� P�]����^@u���{ �� �[�5 T��k �n�� P�e����^@u����F{ ՝� �[�5 T��k �n�� P�m����^@u����{ �� �[�5 T��k �n�� P�u����^@u߽���{ ՝� �[�5 T��k �n�� P�}����^@u����| �� �[�5 T��k �n�� P݅���_@u���F| ՝� �[�5 T��k �n�� Pݍ���_@u?���| �� �[�5 T��k �n�� Pݕ���-_@u_����| ՝� �[�5 T��k �n�� Pݝ���=_@u���} �:����J����Z����j����z�����4����T����t������������צ�����s�O���zL�k�c�_��:���W��ĿV=&���1���)���i��5���U����u�)���i������������)���i��5���U����u�)���i������������)���i��5����U����u�)���i�������������)���i��5���U����u�)���i������������)���i��5���U����u�)���i������������)���i��5���U����u�)���i������������)���i��5���U����u�)���i������������)���i��5���U����u�)���i����������)���it�5�k�U��k�u�)i�
����A����?�������4�      %      xڋ���� � �      �   "   x�3����ͭt,J�L�44�4�������� c�[      �   <   x�32���?�8_�9��,1'#����Ҝ3Ə�Ȃ�+37�R��()3�����$���� ���      �      xڤ�I��ٕ%�v�
,%3z�P����H2��j�� ��!�Ai���U-�G�j��4ӢMյ�e��s��͟�3R��B�;���=w:W^<��������ǋp�|����W�|������x�������_??�|���������j{��Z�.�����j�x�{��ysĿ�u����y�x�~�[������v�i�xy�^����}sZ<Y����#)ą���2zw����AZ�TV¸�������?,�ߜN����ve�Ym��_��xq����r}�xw��y������œ�zy���u����-�
�T6ء�����z�~s�9,����aM9��O7���;��r�}52��_q�����x�ۮO����r�%�^_��Z�[a `�U@�R� ��"���"���+��[��~#�H9�WGi!�vw:�/�����is�+�����C�>�VJ��<䑐'�(���,ؕsr�cXjw�<��������ٝ����r��I�"5�@I��t,���Z_o��?춟6��z��p�ov;O:�#��G���Izi��ώ�ū�����~�����<�7��O9|y��O�b���q��!d�[m��+aW����f|G�'��5��}�0�(kˇƠ�B������n_�����O~��7I�כ]�/]�xOw����M�������[_.��-.)�`��ZX��IK�V\��抟+�Xy<?	q��<�o���5אd28*l��z�W�����a��^�/7ǫt-��Je��>m�[���ޓ�����O���-�C�k�B-�o׌卆0f)�욝���ҺX�V&,�QC~��w�pN���#���|ËC)L���W)ޮ��.D��P7�i����@��Rze�X� )U���n�~L�H��u.:ۨ9�?w�|�к��o�v�|Y�7�2�:]:�T�r�?`X���{��c�q)���ڵ���~������L�+Y�M��-��n�2YV�9�������5_��6�11WxϏ�|�nOx�B,���Z<��h]�l��K�e-���K�ҭ����Km�[�qE�"\H�>���ʨ�K�-��)ǿ�?m7����6���3��j@[S��{����c{s8�P�;����
�ʠ�2Ѫ3��C8�F��`�T����ZL=K��Ǜ��xL���6`�b[tf�5(����.�<�[��f���o��1�f���Lc�E���B�J�?������LIK�#���,����_f�H1�o���\��bI���\�R��a����o�R�QH ��bqy	#���̋��R؀ۉGZެs�(��F��8o��,�;سe;@{�o��i� ���$�ώ��*���_ ��g��-Ă!Ǔt4�V���j�v|`Ȭ�+ޕq�%������66	��"x���z���xj�����~�nitR`Z�$�
r}y��d��O�`���}��U.������.�YL�B�J��f[;��=%%Ђ�7���j�����h�&�RGS F/�o��=�ر�%���^�u*\7oUݸ�ᣍ$ح�{܄�����ܸg*_��S�?~��@E7�����p��(������[�'�ņ��N��Ȼ=�V6b�t��z���� �S`eiC/���v=�P�!z���ɾ��4G�� DQZP��1��Kkp�f�(�n
8�,U���$ ��+�\h�������W���\!>�7�X|��m}}8׏��T7�2ip�DU�r�0�w+��J ���:^����������v��|�O8�߳F��Xp0�����v����+_�_�fM3<C���8�7����؇B}WQ���vī^׫�uR�+"�z^���a���P���i�_l"��K*��KB��@֪ -�z��*D��K�Ur��5�^����}��o�i	�(�<r��/=����[7�r�m�����ͥǷCi�{2��`�V"@i��U��4
��ep�t�B@ҏw�	����GlBA\~B2N��?]ߜw����W�tpw�5i��b8N��,]81�;�2\!g�.n�Ҁ�#0������!�S��q��O�=|�/*����^�QH�Dr�U,ܸ��Pe��ߑ��%�:&�
�1�VA�+��*��w����� 	l���.-��q����A%���6B�p>�6��e{y������#5�F�. p���R��j��(��������ӹxg�
����R�+����)!��V�G�[����{n�F��{�Ѕ��G1]X)�j��
���5t�3ڠCc5�7A���u���^R�V����Sv�����$e�@���c�Ͱ��mw\�������9�kiZ��-~���C���U�f�DBu/�>C0@�x��+j��9�ƪ�w��~}s��;,H�<�ڬwF}��=��K�1b�e����n����6���8�������H@��_�ᖷ���d�E������l�Z\~������U]-�P���]�Po{5����Q�jp`>ʕ�f%�ӎ��� H�FW�B(��Z�n�<�� _Պ���k�B�2�)����p d�e��r鼱�qO/�:�L����]�X`'����|S@���W���5`#����;f,z����fK9��S�o�1���7��#�c?�ȧ&z�-H�4-xa�>�t���
���aL����
��R��� |�HP����z͠g�6i<�
6�]_~^|�Łg�����J�F�'I��,d��� '�5.&R��&�Ҁ�
�W��r޵j$a��z��`�p�#A�LXr
K�QX)]V��1�l�u�+�"\�����z&W���=��=ts%m�KOǀ1�����._�ݼ��rMg�	�� ��?�L���VK��X&ʁX!�D�*�A�'V0�=~9N�f��}>��S���Q���,�w��:_�qHVbi��"����:!Y(Å�Z�0������5�<�a�-�k�i)J	�,��M�Oe/(�	h�
p��0�k�*�!��{�-��Hkj���m���ϛ��w�힫�9
���������6i�r���#�)�c��<w�����N!�=�xq�����t�ߡ���r������ߡl�?q_�!�f�,�y��\�;^�m��ǫ�鐀���wZt����[*;Y%���O�cO�n�5�#�h���>��>C�cՀ������&��ɐ#'O�o�qK��p���Y�����1ǏACf3 ��	���
��~d�L�_�QN��)�����&t�y�����p��g���"�
KV��x���e`~�!Q�_%�a�eu%����`�"�g��n�ǀK/�vxf����Y/�=3�����zm�19ί�g����Z?�� *LN��]H/�uU/���)�`�ߡ�yhQ <O�(#:����p?�[�>n�ip������3[��@���e��k��e�N :x݆ȇ&�����ó�HB��gp��d�d�p�nb7��n���Ҹ���ٸ�ח���>���G�`e�6��_-3�l̀��N8	8WZO��|奞v��������o'ණ��>CF�z���?����o����|\^�#m�=W<�p0+����{�g�w즒��!�V��Ħ��}Q 8��*a����V|�]_���o2U�;�ҋXP�yxH����O�t|	'�KD#5�y��RΚQ�W�Y�\Ws����y�Ը4�?�nB�v�хq�=�ޒX�q��t�Qbx�umJ����.�Ё����m��������Z Kno?�Ȝ����7��"U�|�3K}*.��~�L�c_$�s󅾎[�>����Z���py��tm�Ư
i�vJ�W��=���:^�O'j '��@���C�8�a����@�]� � ���$�Fxt�����50��8'Xf���g�e�@o����`�b��N�Q1�iݯ�G���C��,�f���V)�H�V#B��ys�&�t��_�n�c�Y�%��ƀ��X9<�r*\�<�]    w'�sJ�t�B����j�����d]�����l��,���F5�+�9��"�߬�;�+˜�\�DE�6.�%>X����n�>Sߗ2��r��*�njg�e�8��J��v%�=��+:�s�q��u�n�A)K;~>������ �1�w2!�p�n�Ǵ�}|���ӡ)����,��U�X�����2�����V�xMx����ue�R�T���;���l�tL.���Z��n�m�`��_�*yb���Y6�7�#xEt��"U�EV�%��L�an@a����x�#�d	>�xC�o��}����m���ms��y��������$�~����Z��y]�P��|�8��I︼�<ׄ�Y�0��~�< O���A% �Tg�Tt��F�6��FN(m.�Уc�������&�"YfI�CY�\�j�+���3:�ˌ�/�Г�*<ؠ��0�&��uxC�?Z1�v_�1Bv�S�O%��b�˅c'փ��D،f�r|��h�\!�b2싋�.����L��>9߯ռ�Uq���B|]�RU[���T��i8�8a����~2Od_�c���2)M/2�O=�X7�����e4�x	�\�/ڍF��1�L��|�l�.�|d�#LI�T�1��)��R�E�t7T���Cvx�V��v��*�<��!|��)�e�o�E��A���;�2��$VY�v��ޥl����RٹI�������[�kek>%�T-����2@A���=zc���JA07���] s(b�)��EQX�����_k���:�G���P�\%��6O<>VA@�A��|���B��9Fn��-<����H��p=s�ĺ(��z�����#���9�V��ɦ�3#�{��Q5�V�,�.�㜑Iޡ\x������:!q��]
��xd�;���K��z����� �^m�s+c��-���X�U�L�g���;Xff:�$�bN�x��;S�.�c�c`Xu�.��Ǳxz�����-�����{?A���i�a���j�q���1* :�[�)�0ʅ?٬oX'І�۲]P3JwTw�f����|ͨ�_ W�APz�JF���˶=Q�eQ#0�9����x�s�f�0�|ٲT��|8������:r��%D�
�'��:�ؒ��8[�?N���N�#T.���=��+B������s>�1��z |U�!n��+u%���3e�^k�Ϲ�d ��Q+�k��	�ꆗ�[7�y��MrptIn2��J�r�)	3��ڔ��Q1�Y �TC���xl����҄�4?@��:��//��P��軲',�IOݷ]E~�����q,ĵ=��dORN����L��#�ȡ�+CӸ���t8v��1������d3��v�N��U�)VRhI�Ϡ��8���k4����(p�I����ߩs���|�&a����>��4f��gJ��=��QK���s"��Y�y��M�e#��T1"CO8���Z{z8��]'9�_�[�O�Rz��zl���	�c�i�v�{��pP�u�e����)�u�?�!\�Ԕ�O�.�Na�(��/�	��o��Q��ԬezV9x���v0o)c/R�w�P.�}����G`���l�`
-&�˭�T�]�^?��^eS+�^��+��(���#U�Ho��δ�9\~�e�����&ys�w÷����<o�:�DS��[�(ǉZ7��4Ʊ�97҄�u�P1~	k���WO�9����0��A+x)>�΢毆ۥ����ecA�����*��GX��ٍަ��YGX� e�܁}m���F7Ƽ���Fԋ#�n����ld���|y�4�m�Kp�7��l�GU�tUj�]k߹�6� ��)'�۲v�G���݊cE���<�"�n��]|��m�c�viT	4��Łw剄E\Y֑�&�*�/_����k���J�q�m���Ω������pn�i7_@_N&��@`y�구(�����س�q��ێ{˒����[;(dM��N�~�(C��JKG�?U��v�lr�z:��Q��gL��zK��������K�KI���)�cz�BFD�1�?�����*�"����x�Ziv��Sb��1g]�,�?���`�Ŏ-9�N_v�
M_�#>�\��vҳ��=2�ԭ��C�|��γ��~�"a��ҝV��wC�cO�j�x�)��m�� a�I���0sa-��N�@x!>�fI�b�q���:��xOɢ���v\�eМW�׀�����T��wk1������Њ,����We.��W�`�����P����Z�M�z*h2�|�~ܦ�#<�ݡ{;��O�#eN��X��-h��j��q��$_�q0�W:��6�?�L>��@f�M��̧�"���~Ϧ*�ߟ��� ��>熃�KM�������"�SAh�r��~��?�BS�0���f)�8VI:�E7��x�tݪ]��T���q$��񚹑|������0���x 2D�j��\��Q9���L�qf?���0�!�pT�l��RO���^ᶰ�T1T����hz��^��!���Z=߽��}�8p;�	fR��[�1�VO�[$;��z�Y�v�M	E�J�d��S �8�tsueu>=�w7�/���&%c�J7]�ROt������=~z��m����Y<�ϴ�7ϟ>~��B�?��l �d�����^~�g�\{��&����ie�n��4����a�28_L�tw�_���!S���ޫ(�Hx��j���_���us�����%Mپ�Sy}>�\&�3� Z��R��6��j���g|�2&�3l�rk��KW� KC��8�#N*d��6���*�����	�Ȕ��K	lL���&�Xu9�\�. ս���0�:`;��w���"��o4�Ok��H��X=�LlX���om�n�-�-��-|q\I�Y���ϛ]�Զ����7;���q]�=v`xk���v�
�:�r,�1�h���C����C�n\�4�m��WC6�كsFia�݇��M���UD�(~{�L��-E.�Ķ�/2�T:��ϣwa��HMʨ�Oi#:x��ٜs-����We2s3�{���jr4� ���-�D)�y������tx��*3K7!��n���Ճx�<y���F�.߄�MDU�3�H�$�S�G
���nfXH�d�U�̗��V��G���Rf�b��E0!��������?ڟ��~�|ޥ{z����ɇ)����P��Q
�����8/��Q�3=���6G����*�TR���i��"�8^�V����Qu�
�v�%dX��G�fx�o����Ϸ#��NE�f��᠗ι9v��K�F��=�(���D��Y�ڲ�`s���w\����r}:�.`��'���j*�3�{��mN��|�O��z���º�/r:m+�x����:Y�F/���-� �^j=�8ÿ�W!�L:�1-a~�Tt3f<�nsL���Uϖly���dvà���/|��_�|f,qd�Z���%[�������'}�z>���9Z�J�'l�k�����zS*N���q�M�uɁ���<#Bs"l�%���f���urFQl�l�Tj�#"����8(\L��\ף
݆���W�=ә@R*�S���aF� ��hQ3��pw��+#l��g�D 18b�&6ǆ27
��*�V�7�= l�*X6I���m)����tuX�6�j{)�(�_j�Tӝ�[7�|�%�+Ǩ���γ�(�:�Z�� :?���[�S^��竛��ϻ�1��$3}��4�1���R��d&�8�"Dhi#�� U����0U�6��6*��rM{�j8-B!�+���i<��N;�=dǽ��lۋ�F%W�e���:AU�N)�������R����?nKHI5��5�8ԹNؕ�)v����$e��6�i�|�~���v�4��
`�N|]J��x�%�H�X���,ů�q����]�"��v��n^ue�k�;�+��7�`�����cM�C�H��%1��e�IR%�ҫ���aO��$o����)R+	�g���&YG�:���v�M    �ɬ��h���brG@���N�����ﴊ��s�)�Ùe9v+�����������Z��v���翬�������
x���I%}�>A�w+U��񞆺��I�_�_lA�T�{�x����RbMdёi
>;�,^�b�2��$����dZ���3�x�a�O�h�H�o.I_���'f�>n.�Y1ʒ{yt����x��d�'��z�Rf@�߶>�,�y�J���g2�f�eM<�w�]�\3��K#S+�m�+�O�Zy�����\��  ���4SͶT!�A���Ꙑ`O��L:Xj=Y�O�ZD)�w�<*i�$��y�Nd��isά���㘖������9��અʼ?����U��ԡR5:����ᔨǋ��z��y����Tծ=y;&-~����2��G��ֺq���S-R��W4ٷ˞�"+���nMq[i̘W�G���"��O����N�Փy��9<
ʋ��.���+��6��q��w$[�և�bb�f����� �yZ�Qݲp3�@��+��ld�S�D�� ��v�>��a*�.�0&qi�Ֆ4ڍ���L ������l�%R�����َx�E��x�����mw���O���$��Ple�2���6��)����j�v�bmڌK���}!&V+me�h��ˬ�%�XM�<	��5O�;o~�$n�&����d"��:>��%0�\�F���6Ŋ
b:w%����J�OP�9w�ʱՌ{޲$4�ݲR�ݜ;�5���*������,��5�&w�����Z1W�^Q��Mc�O�g/S�E�����\���o��)mq�T�O7��G,Jr4���V^7��%bibv͗�w0�|�[�����dP6�w�g2�ƴ���~����k��h��X݅�"�̡W�+z�� f�+aǦk�S�&�1'&V�J�r��&�:Hκ����g������t�.uOH��9���I�:����Aؑtm����X�"KM�"����Bt�k���T��:�W�,7m��|�-���xf��l�q:�R�nlIR1�>����*5^�;Zy�(XO&�6���r�.����C3��7x�w����qq� E��0�;���?�웮��+�f<I	d��^['yL^���$݊���O����F��
U��Y�L����qH����݌[5�3��)s~��"Ii]b�{�
T���w�a
Q��J�^CǑZ����l���U--Д	���v��SYA�s3"��Qi�i�^�q/ԯ�eT��Rk\��a��fX��J\�[֢���/����I-�l_��k?$���V�}�׫s��l���|ʶ���N>$�BA6�=m�+�bwt%�������0�V3uw�7�=�g��:$�i9�ߝ?�%?=�����������o�y�˸X��T ��4�dT0BUk��� ��@�[�hz�	߀XP0�M�$�i�"e���	5�D��W�0���OW+�v�h��f��UN:$yd0%���Q��`�ݵ�����r���!!Nw�E��� >�(�%�a����F��7�=޻�>�ׇ���Xm�&�o�Uge�T�Z�)�t<����t!}o{dT���:�f�A�:�jĮ��� 4L�����>Ds	�ڷ]��-6
��`���0�jK�|���m�]Ǎ��[&r��̰�ϸ�d:-B��*�5(W�d��O��Ym�^�W3�8_����ꒋ!>��#�O�D��� &�y<m�)���@>s�z�5Ճ����@|�ZS9�}�\��=�:�ƪ���HS���s�f��YmΦ�� 4�b��,:�G�m{��Og��o�3��ܣc�S��OM����|�d�A��~��V�'�|�Mړ�v�D���]r�y���LEJ(ԁq�s��������N�
���c���cK�Z*lu���Q#����J��r~:�����d[*����<[��ԅ`V�E ������Џ�^B'�܅׏}X�2��Ӂ���>��a�N;�*Q�B�����;�oo�����fߜAؕZ��p�#զ�
aҔ����%�NcT��k��6zH9��2�1d�U�ϯ��`�5nY$w�����ع\��K��Rg�GlAb�����d:���V��.����d;��r�L#p��"Z�)��\�rZ�.�|�NYD��V�&NG��R��$5��;�w��O�h`�]��@�#�}��%����{�ߌ�E����'.�����%��Ԕ�繗��W5k��8�U�t8�Ƹ�+G�`�&^Ț��I���>�?������875�k&yeF�9F�Y���f;;�e�>��ݫh`�)�f�Y� ��ި��b54�v�Z�q5C��mfk޹���n�-�(,ybv��B�B�d�S�\9[�t� E&��T������������ uBܓC��3���������1�T���2�0�^�`=~n	��mw���տ�!�L��p8�dT����Z�I9��,�����i�Z�E���Hs.y��沊�!�$W�5��?�n�ΩT�+I"K(C�`IkD�y��X�e����Zx����~�HM9�'�_�;�0��T	�}M�+�w�5�s�a������9��5gn<�2/�d�pH;����07Ù�Җ�ƌ�O t-#���m|]U��K�I�DO��(�e+e��f�dmS�YLeuY:;F_�W����_g�{ܶ�T���g&SP7���\Bkې �8.���0��V �pr9;m&�����C�6�P��>T}0cD�4���o/���!X���uΜe�}-3߾]_޷q�R��0O���?B�5y*҈��Kl��$��;��I�L#I�+&�2;cpR��$H2\�Ū���].��6�Y-�d��M��u�w.f�)R��\��M���`D�\ȟ:#\<�^��n�R�|��L��,|o�C�TЯRئ��[p{��!77A��_�`,�������{ط$�RpӜ3�.J�=z���9{�dH��~;�7��B�����\�&ģ��盅��`_r�L;��^�һ��φ��LNC�z#'�x�U ��ov�H�~m����'�銗�a��ɸ�Ҙ�c�Pg��ee\�t��$��d]�������,���:2�c�
ߗ�~����i�]����:s��H�����D���J�`��E9�f�;�+2��%�����Ϋ�����v�xE�|�AV�s؍�	L��Ĉ�5�qu�7 �f>�'b�������X���O�q��)r8s;��[ףs{L��͗����*���f{f �Hn-�t�0D�F$��9,Cv��]G��K4R4
�����cZl|ه�L���U�h����߉L*�>�a��0���"<٤���y���3G`��4j�l�����1->uj�[:�92�����t!$o�E6)��e�������a��
~��-4Ժ)���J$?e�.Re�mG�'r����d��+�=g����U��X2�@ڀf"LW#�E��F*j<:ISZ��Mx�q�C�7;�4$�^�LBuo��#߾�5�e:uED�i�b�;Q�)2q��'�!�.4��� �i�o�iL̘�8��ٺk]H�W{0��p�0V@���?�=J�?lߧ��MW��|o~)�A,Q4�=+�{wGt=�R��|Ps�7�Y��[ㄏ���� �9.�ǧf=�P-�I_X3��<��v�ޝ�Z� ��B�V���E�Ebm�k��^��R��G��ʺ�"c�����q�9�o6�Tg7i���]Z���<�������P�T�j۪|����&��`��L{D���ʱ/�3��?O�>�t�����UA3T�B���"YW0�)t�bo����N�
�Q�F'2��|��ȁ�S�k9&׫�z���U�?)����霮���ѦC��fn���+��\b�rf�֐#\E��S}���x����Tz����G���^t[B!-�����&�T��{��D'��!���'`��}ԯT2t��@��q����h���ˢ�qҿv6]y����l>'����{�DQ0�r���1�R���쯶�?	�(���t��E����R��>j��
;�M\Aw�\S���N�;    E9��N����cq}������7�&�����������h�;����W�K�6ϫ���M���P���5f��}��oi[b�<" 	������z��m�Ou�cɔv�7�����7M)I' B�`S(E=y��4*0�i�J�������TW��f-L����E2.Q���Mo���LI��I)Z�����<yq�)E��S)f-�}�r��.N�^$ڧ �&��6���ں�租o��?4tG�Ѓ�ig�8]�?FL������׽��Y��D7��9 �=��8�e�>mw)IЛ@*sw��`n�����8�w%��{B���j�E�F2��AҰ?N22G9u:0��Ő�?��Qw�����s=�i��u�Iɉ�J���
�,�I��o�x}�|�3��$�T��3eH��E,D�8��z���l��%���?or����ɓe�WqɢGo�="�D�~S'?�o���$V^�!��_�*��F�"a)�k\�$\��O���W���ŀe�\�.��&	f&m
.x�����+�E�QN3Ia`�~�a������.^C�2��8Ӝypw��r�<��fq3>�N�ܣ���5;��z(qף����aZ+�Q�e���Vp5�#��!�.��v��ѻ"�+@�t���$���>vQ�	���q�&�E)���б�Kk�o2�}���I�^�m�Q���E��șu���E��ƱUW�1��q�ݴ��"�g��8n�}��Ĕ,h���><�j_�hT�%3�� ��P��ـ;�BT�����u�u��~s���2����>��t�'�d׸[��pfc�Eh:z���@��Vj�r��g�,1]*D]znK���C0K-E����/f���~�#�B�cY:�p�Z���/z,E�ڙ\* ���������^/R�VIHGrv�e���	�0�֤^�]z��n���Q��Q��#j<��.J�*'5˦S�!�C�����u��)8.��Y���k#�����u.e�#� �:��]ӓ�1\��Ж��&Ⱦ���X�sd��'pI�������,wK��"�����R�f�`�	�BR*���e�	d�f��7����Pr>����/�g��p9��M�^�Qʦ�#}�uT�\N�I���h���1�\��xю}Njf9 l��dm��q$ЫD�Ӂ|��������t C�g�t�W���K:�32�ѫ��K�cM�nn���f�etw���gf�^x�$3���ٕawx��?��aw�����ɬ������6�)*<�w�< Z��_<�"?f�dQ�o:�5W�P>����?lk�M�H_eZJR���>�r�ɛ���1=�E�=P��k�|�,±`��V�X� ��� ����u��Ƽ��y\�N!U��#���˸GZ��9�t�����c}�>��Ï)�Y&�h�C�{��"mǡ2c�#O8�o�M�ѭ:�~���ߞO��#�܄D6�Haceo�U7��t!�j<zɓ,7��yd�C{�e^��#���+�+�l��1�3Qs�E���y�2�6�؟����=ߟ6뫚r�%Mޚi�rD�&j���]wv ��{67߾�S���3���'MFTC	jIl��	����ϧ����|�Vϖ�~3?�s�k��Nb��@X6���g��<�9��脎a���:�1�����eVU�Ӎ����t�/�4I�d�O����snB�~��KjKܐ���3����#�i����х�����XM;��i�tYt�67�� O�d�^�������^�p"ʫ��-�>�y�*���ό̠XI�W*�d{M:��2>L��$:����Д�X���U���A#wbT�G�����nZ?��M�`y4�T�>7\x��߬Ә�I�pU�+h�;������+O^�KS�I�7߅��%6�4C�x�ZOĦ��h����h����*���A����I�Mu�[rL껣V[]���uU��mRYbe�U�M7��z�����i����_��*]�����F�%�p���@�۝���x�d�PzO�����'��:���D=�"G�0�%pkۅ���f�9�w%x?-���ثU���t눸-b�,�v�p_'J*(!d��M�߫tr�1M�r���&(!�&����-6�K�m=?����x��Y+z�r�dw��~�Z<�aE��s�y�2�[�b�OE�U- �j��S�zE��\��ȢR٨r��O�3��-��/tX7�R0�:��E\2^�TL;�s��E%�'��DS��LьN|����f���pL�ڦ�Vtk���ZJ�W�C��Lt�` ��ä���O	�[�
���æ ��F�N� /�^~<�H0�F"���V�f��/!�#��;�������7YHΥ6TA���{��4w��@�~�]���!�������=�fB�K�e��&"��\ v�*�BG�/�-'���]
����Rǉ�10�cǂ�V����.�͂u�Խe�y6��X�a�6���,�j`7��2^��Y�1�&P���-t�sP�BA�[vFu(u����4��@��٥9���eP���D�X%����%f�KJ���6^�p,��x�a�6����Q��E�&z���\f�ո�i��p��g4�&�B9˹7���h�^/ܣ����ǧ+K&���0�|�y�/ϛOl���n��'arT_��;�~���q�����K�9q��~
���5���N�QGN ��?W��A�f�s�b�� X`sY��T-YRߕ�q�$Sf�����g����.�~l�1�2MZV�,�L�������2Oh���)ǯ��uFmXP�*!Vgڧ�d��G�#�����9�ة:tC6~�T�|)[T:9r�i���}o�s��Q�愞��S�6�`Ω����g�l�ܬ��X�r�L���1M�!0q�8!R�i�f8�t��C��9]�@��t;������q�h�Ox'��|N��$Ꮌ�Cސ7뛏?� �*��E���O?n���sbF�Ŷ<jH�� t Q�=�1�#������n,��fl��
<�|��<S�I��������f�������}lh�[;K=�s�ԏR�\����aV+ ��Y .|LS1��N_z�Nnr�*G!�&�?��~N�rR��a�ʮX=/�`�`׆F���N�ɒw��3�����R0W���jO68�e�,��ă%l�kX���h�2��b0�ϊ%	�I;�rqLcF��t�v�0~�;��\���{z-
WN���bp:m}�n�$k'ˇ�ӝ���LQ� iCZ�ɶ+"�����1Z<�>�
��)��w����f_jj��<\r �6���wG�T�0]i5�; V�_���+��<S��	���O"f��-lZ�QTn�������:�,cf�cF�o�<�+�%6�1^��m!~;)	�|L��Õ�L�2�!�����̽���y�����:�$l+5���r��a�ԕ���$濓#�|������#R�����as�J��J0�4H�t�����GY������z��]��E�G��(
]rɸ�ڪy��GkD�'�a�4x��E
�I%	��
��7�{� ~N������ild/T/��-�7^��aLx@��s�{���x�`,�̍QKE�X>s�e�{aMH�O�9E[3h+VX`�&���݈����U��n�Ll����5S Y��tE���OtB�!H��y��ױ	�&-;c k��50I�d�����.�*�(�,������w�Eֆ���G�	uB|��xe��ʌ�wf�J�CKY�Zq2���V��$��'��/8��L�����p�N�v>v��R��C�D�1є��8u"G���FEStN��5�A�wu?��?�"U��q��8���M�k3�\25Ui�2k�f8��Fp�f��^���Y<<�̻o&Gp*f}��#��Jm�$����7`�Y��F�2����e�B����3�΃��]8�8a
$a9d����q�`�,\w9�� 2��V��ۿ��t��8�#������%	ifi��ɋ/���,M����{h��U4b    6���c^�0�y�U��3�<�ZU�o'9��JZ�'�OR�8���b�oņ�\@����utHv<{�i3�&�����̽+#���B ��*��_1��B8�sy~紶a8��_�!~ؒ�6�������־[�b�/7Ld������2ƣC�M�U7�=W�t��]���w�I����R�Ʊ�8k��B��'��M�_9q�?�~Q>�\��T��v�;�߬\��&����9m�������n��](T�"�/�����3�(,myW��X�S��U���Gp�4�⛒��|��~{+��Bi�um����247�,kl�6��
�C0"NN����7/��~N���e�d�6�Ɩ�N�q��,.���{�l<�%v�#��ڥVkB��f��6blڞ,����K��2�W�g����w�ʕ$�	���C\V�R- j�҅�.ɡ�����^�?$\�DO�9_7�<���a"�BCFQ�������1��*��#1�R%ޛלV��hN��֜
^{����"ޫm"�i���aB��fc�a�{{���e�93iwri�9u�Bc�S�<��9�N�"-I�ZYɼ���!����h>	@�m&���aݞ3�򒳺r��tsL �w�뜯s���C�B��,l� ]��@���N��-X��c���0���`��ul�_������`�/�5�FN�T9̢�L�Q��Μ���be�t]]��p����0�H�{xMM��A�+;�SDc��a��Spz!�L�@=�M�,�X�GIK�k	�WK����WQ�T��'E:f�K�h�y�y�q�+<��X���N#x(s{'3Ϟ��1�J��&��׎��աa������e	w�l����l�ކ�(�g��O]<KCS�m�w��������h������֞`�����e���Y��g���4���2�m��t�Τ6����N�n�|!Ή���͔� �1M�J�o���;�yc`ak��':�4G�5��r�RZ��z"ꄜt�6���Z�ZOE�=b炚}�޳$z�}�j�k�b�)�aB�O���#��h�,�l�����0āF�IEz\#M� ʕI�L��xn��a��\N&�������Y�.�w�V��J�d����zGQ�;�<sc���3�_�p*���i�]>���U��������I]&��|~�]�@�Vv���^$x�w�+m�.���߬�|�.E^��V��K=]�s!`f�����|��K$aP���Fm�����D�V�(��d9J�cMG���u�M��Ul��U��|(�<PQ&�l�L�Zr��<�<@>�R���*����Z棜.�ƨ�4>mFt�t�k�Cq4)S�\��Au������9:��jMΨ�*Q�C�9%Ljl	���ƇV�Z���������\�u��U{�[�Mi�k�;A����G��ɱ���W:4�I���M�JrsN��b� Ԫ�r�nb�f$��U;�$U.�~_��,���sM���
*�?���h:X��֐�tJf�7�`�Ueݛ���k8�o�NR��'+?>S�2�G�1�����x�^�����jK���V7�����k_U'�h*�p��J�I��ҧy}�a��Ԅ)�2�S3��D��Vc��c�|b^�*���O��:4X��70�I�&�\Y��qX�=�S}!'�F�����M���A	G0N?�j�S�bn���O�9��9��C^�v�r�7o���D���	�0<�Ƴ�o��|k�ͱ�Һ�Żv�ʭ$A
���đc��J�Ԇp�k��&X��b`6$�U*��4>r6���������/��ݐ�,�H��Qt&R��o�Z*�!�q�X�nD���x5�ª��7�i��E�+Ŵ|�+d5� g��E��L��Б82��$i7������Gl���貥��0�:۞�E�-%re�~倨x"sJf))����خ�h\"�Z���0��"Y�	��涏�:�T��NW ���3A�Y�$hWz����Z�o;ݍ�)I�D+QS.V�J�,6Sxe���as�4��yE�-����N��mQ��XB�¤�Ń.��i�n򅹍ɏ�h�����%�z�z+z����(��!�� >��9\�Ml�,��kd�8(RU���f��m
����n�$i����j�ΰ���sI�֐UM���J!;9�^�E�p}\p�,9�b�R�!�E�١�Pm��h��<�ӭ �j�o�����R���w��R��0��������6�_H5��użC�6(��f�]Ʀo�T��p��xH��2��;��7�v5�����>�X	�������W�EKJa��0ј಍�Kრ�JN��[� %�Q����.�ǈ�ǳ�����9GsѸ�qU:W�(�!݊��9� RYa:�$��F1� ¦)>��#1��'�=�d�
n2��h�?m�&�w��Vܝ^^j�z��9�T
�f�i}o�����הc�n��pw�J��S[��Y�ι8��]H�J�)_8䁬*���캲C���� ��(5Ϯ+8�8&�J/�){@zI����y�<YN�GN],�ٜ�5O�n7��-Sxk����$�xMQ�N:��'���0�v���<�V�7��8mX�8���Qz���d�G���W���?�nѝ5w��D=���Hҭ!�2����܋}-8h��P���2玕�[.��ƖV�\��&�з�.�Ѯ��Qz&����g�fCM�aMI�l�(�&r@��6>.�~f���F|�����Dʌ+����v=uK�`����N*��X��(2�	
1�?��T�c�SatVU�O�H��'�f�ޫ��]g�q�KǑߨL���t'�Eh���lL�o�0�#�0�_ ����v� �?#u΢i�+\�Qo����񴣣s��kz��+2r��RB�'�}�"����I�������o�s`�,墂����pW��rQ~e"�A]� �b\B}�y͗:�Uj.����Vs��f�L��?�J�Q=����L��5_�"Z���κ�)N 3�C���yU{��;߲��� 1,'�*����﨓O�=�5��ɷ_Ћ�Y�w4*�m Tِ��P`��f@h��xk��)��n���P�~��/!���5�H��rZ^��A�:̶]�hBݟʵ�P6v�.��Ί�xW����� �2����Dv��m���T�]c�;'��Y@l�Z�<��t�&���(������s���.�0=0�CP55�� �)�L�� Gp:��� ���c�l�����^���GN��:�\m�`��Zu���<�T�N�&:/Sz�"L�4���y2~�iI����>��v�!ѷ^�6�p�pI��:�����
.������f��	x�т��Ƨ����F��Z1�L��T����$�V���jM����t�$Ǐ����FL�d�D�GL4�{�Xs�{��L�@��a��~ȳ�������.A��D�X�U>�yQ�	 ���l�n�C�fœ�+����(�ǿ��F�o�tJ��%�o����p��c�m)o\˔���nn�ѢԬ����q��b��|ܙ�6c�Y����vL�O_�9�o�o���3K��?إ���{Z�����C��?��h�;V�y;XDZ=����?��)�6P�WE�E���?�T���1q�22�2h'�ڔ��v��Qd��$��r��st�${T�� ��C��ϯ���W�B(�dmW!��3I��?>1�f��b�!N�J�� k���Rp����tc��!����
�����6)�\����:3G<��E�ex"O�u�dV��P�~�y�;���4�&=��Wxk�D����ztkZ�������\V��I�'JCF-�����_�C���k9q@��'�6��LE�mR�:���؃ܽ��js^<[��o�Y��S>9�]���T$"{�/fD�]w G?�d<k/W�8�7or��-H3M�K��������nu��呉�pLv�{#P<v&�8C�D;p�dp��t�+��9��TU�Z)�[���ж:9�f�|Rǒ����b��ԃ2�T��84�����}�uH����|[q���2�hBw���    �}��U�~������0�UVI�1�R��?����h���d.J��k=d�x{(��DS؟6���d����$e�!I@�m�W:��5���Jz��x���S��2I^|엘f[&�~�i˵�O�If�UoV������ VN�vY�)�ʚ��	$`��1C955./K��a�����S8r������@���E!����Zv��e�9>����KS1����y�ЉZ�Н��j�"��O��/9^j�#��/>lK�`I�՚����>�n����U)���$p�S懱��`q��}��y�P�d�W��t�<���m�s��Lb��G�$�9��b�ܶ�.-d� V�����q{���]�^u�i	尞è��up������\ĕ�t�x�����Q��i�g��y�8����.�Ϡ�@Ƕ�yz�g���69��`�M�)��H��i� .֔{I,H��/C���U^���ڹC}��䆖��?��)�S�S��0Ԑ�:�Fú�{Gl��"�wn���u��'�pG'Hg'S�tP���m��l��Z�����RJ����y�6���}O�C�9�����V��� ��;�N�eS�eS���0Vz��C	�7��4��т?B�{OPq��U�$�QO��BU��z��q\�.s�ڹSU�0�O�.X"39��������l>t�.;�j:�]�`�F��Ҝ�� �Nei�*99zc��8�+OY<�D8�ZK���<-��v�Mɘ%�r��w*0�������H�J���r9 kt�����Ke8�ٙS�I�2�/�e�?�	�h1*g��~y����̿d�&�z���Ͽti�4��W�4jt����&sI0�Ԯ�$h���*��JF%tF(�]6u@�[kmJ��x�ejz������w+}����fs2ͷK܋ �������7�����ַ��:3h��o�Þ�)�S��Ճ�(X/X{�F9��Q���+X��MV�Z /�j�';���<�]JM�����)�~Z}�
�z�|��sf_� n9 ����y�ςa�MB/� o)�!���|w�2�»�3Q���Հ4���B�;�Y�J��]�P�
R���$6��9�2����,�5<MG�1��� ���v�&n��m![E��`��s�U´�%�,�T����7S�#	-a���	3���И騖ٸ34.��#�xu&����5g/���(���6� 4��0��ő�*�N���EK�.%�1�#�~?�	��z�gP$U~�d@w�Kv�ܖ�h�{�f*��By(��+;�LI���f{��~���G�;���L���a-z-E�N���I��$h׹5ȸ��>�M�4�MS���)_& 5��H���?۳ƃ4��5͏s���ƚNL��!m�v�F���XiMKu�Z3�ce�4��%�w3�Q�NJ��M.|�}���-�,��HI)&[:蕴���|��j�~7.R6Y[��h����<������U9qV8����$\*�伇I�mב(���ynv;�&��e�O`|�T�'�mPV���S�N���#���\?�>:��ߜ�'��B��,C�Ѽ��1�{�i�Σ�`hQ��D������	��U��/Ug�.M\�Z?��v���۬B��f��X.���1ی��J��\c6��|�R�1۱! 5}u`ۯ��Y��}�UӠ���$1���k�KlpL\�;��2���TU�KKbM �p�&IK�u��G��m{@��v
���.1	�?���zM�:�g��B��j`4{p��'p
6�����e劂���c��;���#~i�r{���'N�m��w��u.`��8Y�[�C�"&��\����X$͞���D�e��!�=��{�ik ��.6zŔ��Ek"�\�W^ݐ�"�)yV��}�v��\�y<�evG��T�l��Ɖ�ӟD(��,�S�y��H<W�󋵾��C�NO��=��	yGˇ�Y��&�ꃦx�b��r��*�R�Զt�L�y�ģG��x�{�deО{��JF��V�أy:#����H�L"[|������~C���ODw�ŋ��&uk#z��O6��ɑ�"��v��`�e��b��# J)��
|*e��!a�צoM�9ƅj'`r�!u���»-��Ɂ%E��%m�W0����B�L�vhĘYŹ�YJ��Ĝg�c��7aZO�,�H�~�<g�TI��HT�^lx�_��;߭�q}���d��g����*�<�M|A�;+�m*�z}׬RK&8-��+�C^����9-\j��7�^�](�'�ۿ-`J faORj�WG���PsZLSE3�Wԛ���L�f+���-�?��+��|�,w7��X�"E;Qn��y�wD� ^��ô&��H'�,��F��Y�w�Voo��Gh�}�ב�̑�t�1�(:���/ד3��O/ؔ���L"F�p�����kx~��^h�,��3��=2�]���!��;e��
��w���d���LZ
>���5Y��}��S�c��\��L��;�v�=U皿U�mmfs�Ƕ�	C����Ыo{`y[�g���%Gw̖��?� �$0I�O��&I�eB�gl�;�����-�|P�P%�6�k�G��e�<���$<5��|���iؖ�����0ӟ��m��ٜL$�u�-z���9�[�u�d&{��#B3�{c�֪qb`���t�y�O��o�������#�M���܁'��B�G�D��	�	M*�u�)*M����oie�O9���JK;�4��Jp���$�o�o6����\�KOim�'��ç�`�6w�5M��j���i�>ϯWB���z��׏��{�jT	?g��Y�Oy�ܷ�:��I��ތ�T?Ř3�������iÍBf���ü����Ɯ&<�4ҩ�UY{/�C�'ϊL��ɀ��`��~��y>��xf�����-�$�uq���uR.Ҋ�{��W���9�vv���W�ŗ�G7�?������r�w�В��qf;�qΧy3O��!����'	��܆M���.�ˏ�ۛ/i�yw��<�df>r�A'��'�k�d��:s�\��'3�<�(S��i3��Yo�0ʿ+%�HQ�<~�[wO�Bk$��V+/ɒ�~m��r�W�}��qI�
Zy�!�n�f������&L0�6|%������0��ټZ�b^�x�}�q��fr�qz�P'8�ɇI�\O��yR��g������&����T"6%?n<�T'5���sdNT����M��قX���#�4�;�~>\��x���:�c�s��j�%A�P5͞֩�\���sL��c�$�Cĉ��8�w#��x�㰽�m&h��<>�n�"��d�U�#D��cσ�	4�2ė�/��vʌ�}WI:��`S��dP�jYߌ/���nV����c��}wr:� )��G��jk����3�E*Tϳr���k�Ɣ�C�G��4�a�U�D����a"?k��lf]�P��:wmz<#=������3mϞ��kxP7_���B�h���Lc��_����>?+� �Zս�qЇ�/���#۫���XLJ _ϵ�bZ�q���z��W���:=!�T�'oɴ�>�嗔k'|�x���A=д4��y2hN?d�"�j�g8_�����eZq%~�и-7�m��"^��wh۸�函�K7�m9/]X�1Qa�����,�V�g���UZo6��tҼ$rl�$����{�+�i!��(ĸu��*F��D�VAǾ��Y�B8��������|�Lw]�0TA�Ё����$�b0
���j�ۏ?n�]v8?�j�Z:�����vד7�թ*ȧ����yݦn|��Q�����g)b�j�m77�tY�7W �_�R�v
9�j��`6.������S̉ǒjD�q&�^�*�5�2�Ρ����_��P��<Z6��rr��]jF�ME�=��~�����$�Lb�I�-�4�1}�������b��!O�M��Y��G��S�x�;prS�Щ$�r��U:�� !���+�[9���M�U��ɍq���D���2���e�k�;	��D����Q<v��J&buT�݃H    �xpAj6����C��_pH5c���-�s?A�{}���,כ�r�S���W�I�t�%�2n��/=	{o���#��J&�|�������϶�mr8s��}���^R-�q�t"B/���7��r���h�i9�-��
�4L���}�08�旜���`C�'S>v�=.�J��{@Z(���'�q���u�U��I���6�mw gI:�&}9o���Fxf��1���2�>4v5�eY�K{���k/ȣs���7q�x~�_����X�q�h۳���"�q�e9˺?��;WF�T�ƚ�	�14L��2�Ie�Zr�����^-;��2b>��CR4 ��{'%6͢�gz��x��E>��mK��d󰁸�;�����L��_Q���>�a�W�mMؙz�Um>�S�y;S�u�'��K�W2e�~��/2R�-��e�^q�L]:4s��*�����E�`Q]����҈R��*�)N8H��W�=06RZ�	Ge�$��c��ߜ�|f#��y��	2%��=��MNЧ�ӷ/,㷅@��	����r,:���{2�O��*0Z�o�_;o�3?$I��:o̓���d�#�LMo������@=tt1�-�Pq����RY���?�v����tp�g�b������k��10���jie		2k<��(�9�4����C@��qL��MN4���<� �rI��	J�8�으�9_��"јh�Ǜ�3�$R(��k��I=�O�����I�3i�d��+����;���6?�=Z���o�mH(�a��L`�E�A�J,�8l�V���Mu��o69,RG��1dD�u�be��ӄ9JQK��� nt�ӹ�)JÚ�Y�XW�����or�(�efF�.?g��1�0#.i���4HA�
r����G� ���&��c�C����c�E�N�ʄ���`/]�q��F:�e���lDPl)�Ә���.�n�oՑ��"d����qsΆ��/��o��ܟ6,Q���~)<'s�Zʦ'�~�Xq�y��ᢔ�d���'��*�����\E{��@Y~��4�Q���z���X:MD�kЊep턦q�`�+E����"i�����E_H�
��Ė�-H~�e�n����U��Yŝ�p=�$�>��*Ú:Ɲt;nݍ���S�lo2�T�?c������޷¤��T �Q:0�(��Iwq��NE2����p*.��0W�7g��b'LS%;cH�&|�������@^�g�Z8t�:���偧�m����ʥ��
�b�%Q�*��C����2 ���Y��N���
X�]z�	ݢ�$���WX�7��_�:g9V�r����AE��>��-#��T�*���7SDrYE"��Wd��1�+������p4�Z�_2������I��[���ǭ����it���Vx��N8��ᴏ��\��ė��r����/��w��{�=��gE��t�������֥�}�z8}�	~ԣ\�#�ݹ�����g帺�)�̜03˓/9���� �'l4��U�+um��4ﶗ�a���g$'��]����T-�7Ac=" �!���T�w7X�:2��.�e�1�J0�_��/`Q��れ����l~b��x�����`~!ߔ,�#��_O�@-���!�,�k#���âdV��N+qʹ�	�i�J!�����IV����wY��H���S�n�̀��/gGQE��آZ=ֻ$��� U	@G�����<�N/zTfe6fի^6�d�d���KxDx$�:m��f�Gx��_��i�,)[�8WX�@E���.���ū�ƈY��z����������v�|{��� 
8��[}Z��~���1SPJ�m8%Z�V+��'c�'SD����|���a��'��"�P�gL�������P�cMF�������|���3���B=���m��r��9hl�`RV�P
|
��=����y��w�؂�a*�xw!��M(���l��?�b�W;����\��3��Pt��|G�)T�,]j���1$%s�d�DQЃ���oi�*7���r7�I�āi�\���1��;p�V����FS�k�n����:���) )�>N���//�~�k��� �v��H���eE94�)L�zY�L���0��w�l�����]�~MO�,�*μ���	Z�����Q��9��O�eMtXSڍ��& +����숂�\����(���P��LR����s���H�>��~8u꼋�.lA�����`�ׇ@NRF�<���S��|�
�����
f���I}z��aO9�)���
�Wb"T��� 3g"�są�j�'��,3�Y�@-*jJw�u�g噤�%U
�677;z{x)��!�#
(C���B�e��ᤣ2^N�Of%����ɤ�/���UU�͏�t��B��t�X���,���Z7�=�#v��7��l�,t>vv�����h��p�w�x-STA�n�����m���AD��8�+W�i����AhؽlL+���<OWGGQ��j̓~ʩgk���H?��d��U�R���za����阃�����
}�I�He Ϡ�m`Ѻ|jP�\�-O�R��~�C��`X�T�
�E#���Ԅ�U&�
{V�qT�pʂ��f��L�_}�+k?1����N�K^�N�G�1I�rc$�{e� �މ��#�Qy������w�Go�*Ԭ�-X���P����)Uᅤ�]Kn_]�����e|w�����O;ފv-�3���s�h�r+c��0��@��؇��Sdv8�s���\�8��f#�F�&{���k|	#��:�Q�j������by�U�Lf��0d��Z�?'A�_S�!3BL�@�l�(s��v^ 4)���\�XC�0�C��{Ӊ �.:L(�I�]�j�1A)l/(
��y/�'/�髲��طȰ[z]O�,�0��L@ǂi�k֡���p�Em��Ϸ��>MRR|������D.XqUи����r����C	_�f����E��i��X�&i'j��=�maſ?�vqY��[��}��=�I��]T���.�,��Z׃:U>�0U�$FR}��dy#�й��=ѼP�(4e(*�8�HP�h|��]s�/7��[���e�:�"��K���g��Q;2�)�ֲ6K����DC ����Ʃ����@�P"�e�� o���ѷk�MM
h�Qp����`[4�<Wߜ�/�R)5�Wغ���V|��1u��
F�L�n�uFE��3l��Ь���$͑Nl�cTv���>�Y|��A����\��K�DV�I��c���Ru%[i2�&H܇����H�殊2#ǵ?��D��Vt UѲAō�xj.�/�&(���h���g�]W$���R�[�Nǘ�`�~�U�*����$���3T*�zs*��cZ�P@�.�E-���`Hg�+YI���[��?PY�9U���g�Z�OB���F�/�y�CU
�2���Ղ1 �>SU�d�	%�G��茡4.�e��E�xw @�0{�`I���_���hn�d�e�1�����
�Eݦ�|��`X��ʋ�;�Yb��X�
�|p�c�����9�c��#n;tP?�r*�	�@���Ӑ���z(ϸE9��=�����O��H�^Ǥ���h��������zJ2��j�W�_y��/�LQ�������x�8k�Q�@�Wl_Q5��ᨑ�1祚Љ#�Tx����)�3:�bSS��] ����ԙ��p��}�jctQF�4ء��Y�q0e�_q�,��M\��?ĨE�mC�r�('굿�]ﶷ�%`c��G�
�@$&�Ϣ���6�i�C�A+��U��yn��3��9��������s�t�a��7���fl��AVy[&!R���5mnJ0���X�G)n@�j<���I�-C�@_݉�qF(��फÏ�V��gTl�^lKvQf���%���Uf%�v���2bt��C�����G�ү��=5n�-�-�G��;ho2���9�Tw��dw�ڎ�h��`)^$(E!�< n�n�!�^��oQA�bl%�� *�9��}��򩳕�'���P�R    ��^k׾ˆEsK�)ƍu %��:�6�E���8w%�c�Sw@Z��A�^�y)B��I��;�e���ʬIz�y6B�w��K]tP�L4X�q��
홻r�kGp�}/4@��jFkC��G�W3	�OPk<�^A)7����	�$�O������y~�C��a\��P<��(�]Z��0!����#R���̌����\�T!U��*Z�����%�'\���L�>2i����2�k�&��^�=��2�ej��PG��{)�7<zI)���=	�Jy����{��=�i,��B�����b�-�
pզ-��-���h=X�Xfq,
= ���p�QJЦS_R�@+���L�%,fI� ����o�z��5�� ���A�r���s���z��iX@���&%Mu�����dcx�(�ZZŦ���������7����#cdh�;w�9��뵵)��x,�vaL��٭.���'\����ȀE^b_��wJ�xq���ܞ"ώM�Vt�"C9����*��h��$��L=�����3_uT�4'�y ��Bu��Ty�k�uC�$ҭa���I�RsFD�:��i�̪���y��ª���MppvҊn�XL���Ee}zy�}c�L��Y �V�Z9M���^���)/�cS�e��:��qb_��¡�xN'CҸ�z{}۬/WDw9O�,?�ʊ����5�؛�ݿoG����$y�']0�3��0e%x*���5]� �>��qZ4U���� 5��0L��]�F��[�$��Qo]�����%d�m���#i7ڵu�����Emz�.Ϸ7w�y�:�=��_��)��^�xډy��@W mA5�fҘ���t!t1�J�#WG*m��@�p�,q
=�~�]8Pb���d�G�Lz���j��bȔR˦�6U�mD��cV�+cu��Z+;���KO9kL���=m�&y�,G웦9ND�����1%�J�U��kI5'Փ�����w�X�.<�ϳՄ���sޙƬ�����*�Œ�Y*��Y�L8=)���T�A�R�{=�9��PD�≪H�ž�Dx���L�%˩�l��!/��AS�ԉW��.֫g9y��U�棔�6��v"Ώ�?��.�����ʫ�_�N�=�����)=��Ɛ/SN���fk[z��)�Z[=a>����O߮>�v���_f���\"�Ϸ(�Ϻ:�m~����כ	fVg�����Y{Q��|���3��e�5;pm��R�t�獞K�5|�a=��A-��2���PH��H�昘�u)���jv��?�W�F���E�y�4�g���1 4�ߑf��L{b7/��w�P}�}i��v��I�2��*��)�� j���;�%'��fy3#Z^�H�)�߼�Qy����4X]FE�)��<�J0>�յ�qTK�!���we��yW7�,g=�1
?�$�̃��q�Ds'����91r�V>Ȕ���!����x:F���!3o���*�k�#i��7�X�L��až%e3pi�ݑ���O�ޅ�jh���g�n�k���Y�`�ނ�c��AȚ��%PF��q�� �w�"�c�MC��f�-���Y� �?6m�%���x�ݮmຂ��� ��/G>�zN���d�L+��]X�����D&7ݖ�5|px�|���p�m�`c���� a��i�v����"����uT��(��F_)jՅ�#�~#��R%�����=�0p!��$F��\zi�OM�qM=�]E�b�t����e��QO̗w�y�ۏ7� p�h����,��8H��5���qJ�O$CO�#0��4�m�TRr��Hѷ�Kԙ4"����C��>z5o�Y$�p�� �G�$�w v���Xi�wt�࠸��1-�32�F6*v��R���������xz�js��^��'J�Q�o.�%�{�Zi��׶D{��+�$ծ!v9�$�܎��.h�}���_����ԗ�������+�p��a�qo���Հ���1�>�-(�{��g�K{�*kL���)�O�f�����c������.6�'�5�y�!��e������C�L�ҋ�.��fg�OUJC�莶#F�*��ǓRZ�.[tV��ΖEi�-z��<l�yQ�Ѱp��u����/>?h�S	�r(qDvqF�C����K�$���h�Яyo�N>v~�ls׾��������MK��q��L9��`M\��S�̽�h�>�mΌ6�r�ˮ�j�a	o�W����Տ�%7��k��Ҷ5f�tI%����1(`(��������ލ���R�[��_��g�,�ґ��,z�>����-��x��Zp�(�g	`�iM�d?F�z�<;�^�����F��;�W'����n���'^`Gv�2-��1�`�0@}��[��i�����;ezeU	�PF�C	�mL1��d��Vi8TX�<pQ��~
�����W�<Q�"���`Te�;�XG7�j��jg���m��;Y��eюQCc"�`%��m&Z�N4v�g<ɒ恲�u��'R�Q/?������E�QLR����nUDU�R��mJ��z 2�7 �}�p�=�G�ܛ
m��RU��x~{���	[�ֶi@��9Z��A|��r�`�AД�Jky��A����HP����W���n���������|�	^`Ų�u�4����a��:DI��_[��ٙ�54���CT#|����p�m�Mz�<I{�r7.�~	��?��g�'�du��vG�����͆�B:�v���P\䙬i/�[F�`���ݿi˕����W��J��+ʢ��MQg��⡚B����)���H�[G?H���SVt��/���=�j�n��0H/̇��f6���=�G�O|���� &���x�,Gځ�%�\�J����q�Vx�״{�5����Ė� ,�p�P��v�WIB�2/�A�3���&�
�t�E�JH�HkgͲ�,�� B��� �����x�*�éE$6�U��=sTğ�+��asD��Z���#M��.�P���k@���(~|E��T�B4	�%������W���� �����/U�]=����w��t��3������=��ҋU�[����h�T`�-h�oZ�G8;ޑ)�)��
?�� �i~�S����*�*�e@l�zz��D��M��G�:��-O�bm�z�8�S2�>aF�H�	,s����h��1&.3>4���g�J\�`����n��"�Ww���3f�������a<�N��}�{h��ngf�Xv� u��H��ﲤ�^wF����|{�����M�+)����3�[	&'U���S/�Zŉ��CZt�aR�� ���;1(� ��h	��My��ޔ��Z��d��?�i�H$4��PNz�i�c%t*gK(i����YԔ��{�������vׄ�t�aAI26h��2��J�m_c1gЦ3"�X�v�!T�!��c��`��ޖ��7%�_��g��V�3�(��%V�gp����~<�B�̪G.��/���v�a%���Ƒ��@�mC�������ԡ����}�s�#� b���V�UپU B9>�5�v�{!�]�0�[P�߾�Ǝ�ʱ!*��#���'x����
���V|�iR8oQ�1�ӻA�K�
*F�l�sC���8��ԡ���;�0b����j�K!S�W��`�z��AY�đu�z�J���hP������l`AV��tZS�S��L�ʗ$KG��5Uk�?K�c��;�u��p`��_x�(�<�3���[������Oe]G���ᒴ?ʌ�?�����#�]J��-<|4j�>D䲜ώ��F�l��+D�ۥ�'/��!t8/ ���[/�7�����z��nW���?�Lf��:`��e��u�%�5|�����c&.כ+���h�f���'5��"�v���?;.��'R,�E`V(~��7��kӯR�t�>�Rf�4�+	����%+�`��?j���K�;S����=�MJ���Ɇ��kA�m�����߂�-��M�7�$`���{p����`Ģ��+���Er+N�s^��!�j��A����fmY�o����\�E-X��    9�� P��9�=J��9�0^\\n��z�yU��$kQ5���Q�^p�ea1J�Q�Ao�a1��S4K����?���9�OW�֗��y�TE!�"�o�w�a���cL3b����U1[��ɜ6"��&��C��asFrJ�s�m��i'z������"S|��h��KR��PX�9� ��.���i�ja�P�c�>����C$U%���M���h:�3O?�3s/%�Mm�thUѮ�7^F��'h��B��Ko� 2?�{(�y	��5�A���)w��[A��/��%��p �B}�
�8��+�>.�L��u�8O���k�G���as��j��%� �R#>�6g�w#Ǿ+97�~<�C1�Qu��4��7��ځVR�>R�rxZ�;V��ʣ5��\l�)W��n��M�jlXm�P�󬨐��X�^x��!�Mڄ�W��&GJȪ��#���8�i�����g^R�r����4A^�^�v�L޾��>5*�;S5�� �k�|8��	`Z�,�<��!.H��K8��!����p��E_X ���w��;�r�nC���~�Q��|�_��^��x)�as؞ox�gK�f�E��б�17�����O��KI��U_x�J���m#�0��H�q�F;ꭞw�U�P(��(�gќ/�"�kGY�3����+�h��lH�[8�<fW�5bV�u��:�`���Q+�؉�_Y��,�)Y������M�G���%���y���NbIi\5�@ǹUG��� �,[����x��ז1�R��\�r��^��(p�[�����í̈��g(�Y1�V�n��B���9�v`$͔��N���Ws�%��Kc�v=��A�|J�o���!�����%�J��_`�Z iF���T\�nl��"Sb�b��9�*fr�P�Q��A/sڑk������*>d`��WH3�(�u��(@]�W�a�lw����	�$#]���m����K�"G��0�d��B��p�����k/��zq}���a�A=^��z��,�i�oi�?=C�"u���Z�����.8	�=T�;�ܶ�v�n�mٿ|�P�I�d���|�	ک�J�vw�Ă�7�u���NW�5A;p���2�̱po���ֽj$E���=��ؗt�fR�D'���En�+�������> �W֛���'w��
�=�~3|���c�����g.��?C���p���uQ@IBX3�E/y�x���z��{�0�!7�_n7TG��t%����VFV�GtGm~n`�i���G���L[ǯ�,���8(){���\��'F�z3���.�d �2r����g�7��b`�"��@�c��5kE���b"���W���mή�Mm�Q�`�*k��vM>S,M�P����"R� �\���"��A��� ��=L����a4�Qf.h����_�\棌;�m
'd�0I|%��Sn�5s[(AHVU��ק^I��mA�~�W�β��� =8/K�����
)b��u���"�����(â�߾'�_0�CXsT���{���%�$�bñ,R=)��_D��^gR�2��T���� ����)�#��ފ��ɢ�>�A�5H<�?Zs�Ck⢋Q��Ŭ7��NDL%�@Iw�@�O��2
ԛ3*�G׎h+��t2;����gn�D�LA�������B^����qMJ\2e�b���'���i����o^�`�� +��$Ke9[��d��[��P�=�;��f}����V����[ܫOK+�F`�@����k��0�}7WA���z6�1��AO�ӥ]7�����h:�I�7tL�W��M"�^�^��vsN�����p%,v1�DoX9��u`�q38y��(�1+�k�?����^#�ܢ�]Η�U��i��-d)�н�n9���l�1h�Mpp�)*dhm4�\��_���]0�%Q�SƲ)"[6�JT���Q�Z��A��I��n�������zl��s��:��[�]�*�N���+���R��r���/;̷�u�hNV����TU �;�Ӝ��
����Q�z8�i�R��Sɭ%z��m.��4�-´f�l��a���ͻ���|W�xn�+��_�2o#�R�hmj@�&1A���(���w��9B$5Td����I�;�
p7,�9a���rk:X6�}`�\�7��w��$� �5p�j� 5<���lDOr��x�����]�	�Dt����b�����c�F�$6;q�ω�a��&i���"F5*�~h5J�:qQC�pO�t����.�'x@_�D��1ݡ&@6�3��6_�C���w�9=���Oj��י��A�,�  �#��4Q�.Ie]��^0�b�^ U6�e��D�&�^<�T-�q���s�\>�u�t�B۵SAI���n��Ŏ߀���)�6�d��S������f{1��5�� ye�:=�P�3�Q��z.�� [�b5<��lr�T�ꜯY������O�}��}i��J�+�m �G�X����i���`6���PY����Y#��cYi�`��!RE�&)������N'�A�1�}��|MxD]i+g��蚧�t�}�G�J�c �`�����Z��e2��ũ�:,#jE�P[���c�Z:!�0��~T�Ò2�!6�$k��fr�i0r!({�ݨEUm:Z��k�'�� �@:��,�Tw���?�J�+0h��6�@?���d�d��j���Pn�M?p,oǴ����m�]= _�./?�^mo6�i/��HH�����Î1�j�����Edћ��P<�#���둤&�
�^�����Ѽ�|s8+[��Z�,]��]����0���I��QtW�lP�g#;���z�g�)��i����q� ض�#���2 ]��{��C�rT��L�.�n�b!T�5ŕ��L1-ڍԁ$��mcc;=�����%�[�P7��BnA��ld��#�͗S�u:P����N��*4e�;��![�*4T�ZJ۬}�o7Ե��lJ�6���E�β��I���9�5iFemK��+Փ��w�Rn���'�?H�ݵ���L���VI�b��:0I���d�GK�՘��F�[._ڹ\'��8q��z�������ѳX`L0yL�F��Ϲ)� E��椅�9�$,�PT�nn���2����Fl�i�3�K.�dА�����2]ym�3��[۲��֧;o������l ߌxa �\Mo�~E1�vP������EԲ?��Ź�X6�l����Z�!y��ӹ��z���m"���W�C�H�7\�H�f�k��C��(A#W�P
E{w����=��*zS+���Y�y�O��Ϸ���r`)���ctj�$��(�!��=��������ǩ %��Q�,c�`��7<��ד�(�o.�~��Ko�K
�nQ�R5�4?q����.g>�^Q�@?|���FB�����"�K>?l��FvX�iP]�#�:�?���c�ڊ�:m�(�3Jޙ�Vҏ��CGh])�h�8�u�b���`�'�+I-o)%N����w�u�	�\�샡�d5"a( :�v
F��{��U_s�~���m�Og����E!ދE4eРvz�.Z_b�J�26�6�B��GK�*�k��(�`�T�|8�V��;�-e�5����@�r�ֻ��.��*ố��@<�#�~4\��Az�X���`��UT�*;Bz��@��f�t	�mߤ�/��8f�a��M���������j��z�=�����\���4�7�3l�* ����#�����[G-c��q(��F��+�_�� �bn_��q>Av�5����58���`�q����
�*@�8�����b3)!�;�B���iJJȀ�N�����31/��-}����C�Y�#��e'!�UE�
�����M�j����[cl#���-�9R)4�z�U˴\���]5eOHq4@�|�Y��@__�y2ѳ�(���X�!�8X�����
[�F�����ί�e�q_ǵl��{��>0�e�TS\�.T��(B8���c�*����Uy���� ��Z^    ��42����_oN����!W�]�i�~V�:���1��ۊ1��@�7�ᵶX�Zؓ�nEP��A_��
����˰�ʸ�>�ֳ�3��*�'�z�G>\K���"׻�f���;���uϚ)��%�W���'�.	7O�@7�������f��RI�릚M[�^]�\��_����C~�[�R�R��O�6��C�#S� E6�D8���4�ߚ��".W�ha(!��g 5w��Xs�! �JS��c�s�j�W�k���{rf�E��)k����uU�@��xO5%�oM�������
4��gD�5�U�B���
���<�W�	�i8��,�����[I�Z:��|�1+�֫��h�'�%��u�i�:,I��p:i�m�ea�
P��2{ ���	%\��,QZ�2�RR�׶��1_�緜�B����S�6��"N� �ň�j�^q�ҧ����z$�D���������C��C�|���e�#�����e�+��d���P�N���%�zxW�� |Q��cʮ'0�n��Xwg*N��j{q9\���9D��f5#9�y��l��mMߔ��#⽽�]C�����+:\�!wm�\�ӗ�� ܼ�u��i��l䄹п���ӱ�7��c��:`� ���Z2S��x�M���5�A�,�����X��~"x/k^O�p"{���`FsJl5 �ًv��D$�-[�RV��Τ3*e��U��N��9���}2\oI�A�
i���``��4�HG��������OR0K�:8я%9�:9Z��r�L���C����=��W�:�w��_϶�}�y�&>���Gg\��b=�-�	[:�#�dn-�d���������TCj��u��ƹ|�!;İz�$��GQ:���W�d���]6�N�~���`�Sre�Q�d)Y��ds���i�����N)= U_	D%�L�Ԍ�	S^	 �ڀic�:በ��.�yw^J=3R�^���,�5�z$|�}�Et�?Tw�J,�}X��P�")!U�#��ߦ�B=C0�G��Wc	���ٯ>���"�K�`��Ĵ�Ќ��в	F,Ui���Q�kZ���I+��|9�k����@IM�42w�k�lss��7��o�Bo雯�a�F�#r�bkk���(�k��R��'ެ]^�WLQ���G���&�O8;0~�y)��qk[�;܂0�a��%' -Q%�:�qv-�]�i+h֥�O&��e�� VoO�H��$!�GN�V�}����	,����A��5��!�T�e"��/��z�늮v��dmN��\s���Ћ��h�<�.� �KG���Y��[�g�apNh�-�����j���9$Y/��-7p����Nu�	�������^�/�7E�����O��Ј
M~h�a)�]����AY4=J�i���j�r��<��hlO�B5�%Ŕ�!$��|3���\�u��&�::zH�{�t}��@�w����)��6��-P�قk�H�x��cbQ2�ZSZ���R+���S��X�Ey���m��|�y��/g�x���.-@�E<����K#?��P<����I[���cn)�Z>~F���D��sihq�������[ȥ�jʬ>�]��vW"މ	j�.�|Զ�p��X�C�v���Ɗ%z�(6�U�k�Sk���dc ��gӷ}}���{:3o�x�Il0���w���볔�'_k�2Ǳ@Z�p"'7t�Z;�|��vq*�ٺ|@���0�"o����{}�Ӏ-�����t����8V�T-YOmmK�L�z�m6�� P���ޝ��z��ᰯ���#�[�j߃�B_z]�yy��N���
d��=���ޟz�%�x�j�c�nf���Z���~aJ3S�2�+�ˡ4P�bY�2����S��+6�M$�� �)��t:T�?����P5�2�z�Gh0D��X��:�1!���dh��/[)Q?*F9Ҭ�1�����?�y0~��bw�>I����H��#(f ����z%�z
 ��"q�UI���Dհ�e�T(�-��l��ƴ��?�<����^�wX�)w����W`�\�ɤ�T��x�xp긆�\	&�tQ�Ww�H��t��!���5ܑ�7��KcMUKyc�)����		��V��g�q�ٮ&NУm`��o�b/i���.��=���q�K�LFI�kl�kf�]B��(���T�Ȼ��%�qC�7Y�Y���o�Hq��"|]Ģo�K=�{��A��aR�S��΢+ ee�Fv�Gy�E U�b�C�i�a!y�����ͯ��al	�Dv��'R�����]�:�I�H��!8�t)�J�Vh�P��X�S�{�V*`�����(ӓ�u���*c��캤�x�K�*@���ξR�#.ej�l��إ6x��y)��g�P�L���������W����_)K;YA0Z�&�L�$��sdְ��	'?*�ᔡ��q��M��5� :���K��R����"9Q| �E+uD�TO�3� 6��}�L��BTK���V�)��j���Sg�R�
M�|�S������@y�����?.��B���Ϸ�Xl(���SH�7D�h�˖t1᳐R���ks��`�H��r��-�f?�^����o��qH~@��B~]VZ|<�7u����ZW��ׁe*�<u!��^*,��VtqH�(����C�7=D�$1
��!���\G?�t���+���'8�Q}�Ҝ��$��c�b���=\�����|�sX�\�@;s~�(��a�>��4%�V�*�`;�T��E@wGl�	��)[�˔�S\sh\LY�>���j�1j¹D�g�o37{�9��+0Z�3���GO���k(>k#%����T��g�-��	lN�$�H7�%����Z���J1�̠��+�)!�\%a�g{ںO�'��V�1�o�ћw�~�z�"eױ��Q�J��z�u�0(gg���][�������ST��/�N�Rp�I$���:��F�(g�|��A����qğ�?����l,5
vF�O ������r�V�� TV��~Y@6��.��ǝ�@��L�|��Ny��ҕ��GǪD���1Q�v*��o6�����ҫݩv |@�D�Ht����+~����8�}{��-TN6�'��	O ���f�I�B+&�}l*���|��l뜛 ��gwC�n|HHqfZױD�Z��h��V[y-i�O��b(�fH~L+����G�3&"4����	��Q�R�����9����Ӱ���g?5�L܃��Jo$��|��8����׿У>)eA�0n��}'#�Y�ҭ�C+=���]P�  �������+�Z�$f����rss{x�n��󑷼��k�&gy7I
��ꮣ��Տ�;��\ �����R¹6�j�Ɲ���;�����ɨ��P�*��ګaH�/mvL�?�$�v��c������>����|��rNV�\�M8��W�������ٝ����p'+�s+ !�`cPP}G�?!(S�
lM�ˇn��C�h!M0#�����Q`э�z�O��_(m��#�%T�c���k1�͠Z*��Y_BG�tI`���PI����Sn�V�T8��uy�)��J��lw1Z����gdd$��qJ���D�w���0�ujF(��N�j��3;:�L��,��%}���ȝ�w�YQ$�x����#/G5o�������������D*]JK3 }�B���@9�H5�yFx5�S� �9��x/c'(#;�.���Mj{I� ۚ����!Y�8�Cd��	��vܧ�#�m����yK�W�ؒ����r����A֡3���7w���6fy�q��f�ן^�%�o\5�h�J��+��^��Ǔ��O_3�\���F�F7���V3�䲩�	�XB�ɈtFj�ZF1O((:|��fi���z�kzt�Q����y�����>.#9t$���$T����#j���x�ETV�l?\�K�]*�b�����)xO��$� 9���T�j�XҌY��\Ғ�h��]�pW���_�m��G9��?&��KҋR�.Ҍ�f\*���#��'(������ڛ�����U��ѡ�:    �V��ԲHX��xi၌�Ҽh�c�拕ˌe�I);�)�,^b���,D����q�2��o.��x7�F����y�w�L��=���cF2�w��" �bt͂�������,����UmB����6/!+IO�bT8#�L��62��^ z����^�(��:�B��ݏЂ�Uo��
�?e�ן�VꞼ���q�4U�g	K^�lOo[
�7#Rm&4F�r�H�ԍ���g�������=@�H c� ��%�)��R�\B8'�%^�z��5"����C{�r�S �ˉ��f�r��	��{ĕ�	�d������}���+�!���N��c�jO�{۸��Sq���z��!��"ִBG���S#��v���&PP�XK�HC���~�C��2��p�*�|a:�"b��lm�xݭ��KU�rl�+[�
9l�ql�� �L�&�T]�0E�D�b�C��o��ܳy�%���8�2�����QHu��M	8m�����w"7�)��J$������ oR>x`����4��|��r�:\�Oiz��7���.^V��D<u8x�{���5�첒�)�X�j@����ۻ�ˍ�)�l5m�2�
� �Q�4����a���;�&^�" �+XM���!B�k,��́����j�����řО���x���`�����H5�9�3����|�k��"���ӫ������Q�E|�Y}Q>�=����P1�\���gi)ɇp���B��82�pc���bu�R�ѻ�qK�e�F<�P�_Cā�:(�G66+�z��Z�4�FP<�E���2�� ���#�Շ�ߛ�'���W�yWy'�<<��k�ow����7��K����:N��т7��"�ns���8��ΎM�蟸�H�sg, ���� �<���i���YIjg@;|�f⛩�<�}�1�y1��@�z(��PY��Q%��� �� G'G9~�d���-�s6E�h@��+���?�RQ��ef��7g�q!s ��
�B�r+Y-�����k�W�8��������`��E*���
1��@ӟ�:�~7:���&���@�o�R�\�Eb��@��`]���,��%VB����� ԡ��R�E���}�OTw�餦j�H}6�|ZX�y�9}'%�p��֭3�D�W{ &�n��7���R3�M�T�;�H|Gf�ͣ&^mT=�ń �j�Q��j#̲p�T�3�y��_��.@*Y.Ȗ�z�<d|P��mOȠ���
NA��o�_B9�V���#�|G�?�zC�]j�I�d���To�K�܆���#�|����m�}��~���J�i=�� S�P��D�_�cN�v@�#�q�y���Bj5��D��r��*�C˹���j�0�������{B��G�h�4���=p6�.��c��A��Llp��m?��Q��ܮ&Н(ж�T9�a�=i��'��p�]�񲆦�{cX����+m}k郟��������y}2sa.�&8@>%�E�N�u���<�!���h�,�ރ��Ғ4@i�q[!���H_��Տ�O�������E�`�D���3a�F�l<��4R���Q����Sg��c)M�Wt:l�
�=,�9H�Edt��$�J%�� 1`L�����.ܠ��/�I������ �{N��..�>\�k��{���v�R5T?��~�~ʂ�˃oJ ���m0b�oo���-��ga܋6��:+㻖ц����ʂ�� X�C�+:�Vt�x�K�*��S�4�xj��|#���]������F>�޶u��s��!���Q�{�X9\�3�0(c����`�%���`Q��D�$v���" ���D�h�:{K:��nIq!��������%��U~���m�'�Sk���{���^5tD8��H
z��7&J��c�$��F�:g����|�c��p��B�ڞ�o�����mx$�+���7ц(3�cc44-0����>h��1��Њ%[�zsp,48�)?UU/w��a��f��|:��H*i����l�V_\�l-��?m'�iԏxt{�Ud�!l*�}6�f�\?o��l(1�5����s(�&u^� �c>��^ٶ��f��(�*5,��p_��	C��ǁ@��  S=�'��q��ڜܒN7�NPd��ӽ~:��`(כ\ր��#��o)�8��`}m4�����&3�`�� �������&�[��ҚB��9�W�o�_C�̂5�ʶcEI:*�)"=���y��q�23��u �'�PK e,�L�4*���\��&s�q�4��3O��ѝ^����_�DL4�\Gg1e����=�1����B���$�����*�Ȕ�O��}��HӔ��>N��\>+���~��=�\�u'��,�x��}W��f�~ǃ�����E���=��J���,�*ZP����VkN�^&X@�XC�G��ʗ�Ь�;���'����b�y�9G��y�Ȼ���=`y^�J�e5�]jm�Z��uj������G���=�՗������]��$��=���tr��E���s�����6�-H.��� �4`"T����^IRl�>/�������g�-��v�Tɋ8;�϶ԒE��^��q�"M��T���Pr�����2���ۼ�W���J�8*��e�N�!�������T�{��}�d7�驋��h�8?�)Y��UA��7��o$��{���na�QUu{u�����z{}{}�FP�`,Ȝ�b��k2�����4��XN���vt_�n0QOła0����4l|�:Ȧi���4nϴ��$L��?��Y�+Ѓ6���?����,��Y|�	�J�wc��U�<����hWw��*O����4h�n��S���� Æ#zV)THz�eT})��,�1�Zf	��Sz��?��p)T&�gJi ��V�� �^9'�>��d���*:y�|L��5@��3gk�xZE�6u?�!�����6H{��/`9�%I����W��D�I��ßX�u�2�`C��B�[z��uR'�z��"39�N��I�"Փ����w\�ʖe�?�A����L�L<�ĵ�v�)�ѡ%Z�������\YHnu=� czL���e$|iHóg�����|���rw�~ߪ<�#
,�����.0-��"]Ѵ[�c��I���,<"�7����v�Y�{|��
GD^�_<�d+��l�CF��'V:�����V"lxP�ז>K�nsj��\���?��(Y���ޘM:F�OԞя ��xqlRN��)�Y����Z�Y9I~��r�k���C��L]H6{�͉����/X��AHEs��f)[��ڐ�X��"��A��SI��>51 d�e9���$?�����a��p��5�AQ~��9�/t�#a�9�/�H)im�f������ˋaX��9��i�R� ]�1-��4�Ͷ�m#q�ߨ��ڸ�s��È�wuT�P4�jF,����K��y���8#�D��g��p����j���=��[�ݐ/`kn~���ȱ�0=d�,[���!Q�];�J}�{ͩdͬ�"<}�J���b�]Pbk�2�.��z�D�w�j�;ou3S����6k�#Qԧ�W@�0y"�T���"ڡݰY6��t��Ӿ��РQ@&|�sg�@°K �_RS��6�k;5��l�C	PZS�b)�(�ڥ�!���,Q�F��Z�:����`�u��y��'QJc�����]�pp7�gQ�al��b�nP�ܴ��6⢷e�R>b?�j�f����s0c�����'i�z�dq�P���lPx��V�Ì�F�Z9�Y���f`�@�����Wik�Z�B�D=�4������(^����t��@��$AbT��J���b������Hl������D��6UN��]��~�r��T��}{��1��B�1� 	���Iu����A'����C`c�ʫ � Oox�}�+��`M�umU)�ηp�}F���ʩ�ȧʗ�-t�'���ۮ�ŦW��3iДGS��UG������ ��������Կ�E�����m���    �����P�ҫ���*�2T���,��*�P5�F��$��S�,�8 ���8e �2pB��q&�@pZC���Jή�0�>݆�~&�型
n�E�(ΰ_�f�ڜ}F����M����
�������[Ԟ�8{�;�?����7�wYV5��=�6�i�2��6$OV��f*Zi���>���a�:#w�ӷ,�ܡ�,�u�	/!��m���nC�da����=k�e�Q&�l߳>�P!�c�9I��jB�ነ��2-�)��=�(���8(�I%�P� �R�q�4Z���T.�=��G�ʮ�u��OxW��X(|�"�|�$��dXNV`MY��ۏ��3�G/vW�����%WF�E��Pf!��&�Kc�����mTZ��3>����Kp%	+�]�쩶����`|��;ƗF�}jpq0{�m����H	)=Z�7�B9�����u.}iɦ�L�~+�U���3�1�i_5�c�Gi��e1�Y>��^���&���2^mn���̀�)����� �O�����kN㋬fuL�`�_B�2;��@'@��d|&P 1	v,c|�=�Ѐ�+-����W���a��������������&���xsH�f���4��v�ue�h7��7Tڻ��?��͔}펈��h0i��h˳Jyng��盋
B�2��$+��*�?r�PF�"݅�`�=w*�<"�3Cs �b&���(_-aIe��	�ыy�`���*1�� /��\�A��?�6�n�Oe�i�3��y�~�h�4/��B�M�I�c0��$Rm��Џ�Bu6q}��u���ýbh����@@��J_OA�g(�Y,WW~:�Cw�7c��b��;�@�/ �z��E8�6��>�=����]�8"{�k��e��{RP�O��h�߾�_lS�N�T/�K<0bp#�<-�V����l�$�CF��8T����x#�z�`�GZ�l/��y�#@tEDUV	Ύˑ��h�Њ���VSJ��F����ww���m�*Л����IBUj�H(|q��&a����ܼ�¸�U�g>��Y���9~�i��[c&i���^��X
�_�~����IPq�)m�%��Rޘ���p�jP���<�+�
Dx�Γ�@*�J��S��f�XC��"N�l��\�b�u����B��$M�&$��V?R��
� ��\)���K,�H�&-F�v�v��׮���;���E�^S͖2�/o��K8���������*���C3���!U"+�I��}�ZG�E�=T�(�z�A�Ee`��[�D�w�I95�����T|��P,���K*��~�r�nM�)�5��s,?���k�Q;���]z�p�m-\�_�z�(S=�?Q��QBI��5���ש�aXы������\x��+J3��Fo��9���xJ)�[|)�^��A~-����$EY�]{34����v���Aէ��Q��BK�HF�����rkmYjN<(�`ڀ��U!EN��.!�{�}�G��q<�cZ�_��%h\s��T>�g���)����R��Eɺ����t���$}�`e�&ܳ�i�fq��:,��z���bt��s�݈�LaSR��]8�3�huS!yQ��0Cl��#Ԏ�(ѵ�"� bSMS�~���dP@a� ��i�h<f0"^�R�GY��$��<7�m�-N����]������[&l�~����b��{�"���4��tI����H//�ݑkx�F񐗙u��u���f��OP����+Ի{~��O�PW߼�\M,�����q�w���ȉ���f襥RI�ZD�O�������d�;i5E�f��ӸLA�`��򂲕da6xp�ҍXި<�w�GFm�(�nl�joG�ZB�H�
�Р�y����xJ���>�.��#��{`�`Z�Ҷ�fva�Xkt1}��5�xoh
"n0fjv�����A׫�{�k|�}�A?�*=�v���au�I�U1�U���g0�[��<�q�}�!ahti�r�vrg=!�����8�]l���/�WWYAګ��2�'��·<	U�UW��?��93d���PSe����Z�{��hx�(o�H�6+��]��>$ީ�Co�Ք=�6.�;�sP~�7@��;4�l]R�|YX�s8�~��_]fp>=^�R��OV�'"��qz�<�=���I�؈Q�f����op���h�:�o|��j��)�b�'eYP{(�C�ki�iT�l�I 7�N�M�}(��@������L�Lq����iP�D��g
�M�{�<� ��0�0'&UBN���
j�`�8KE�{���$�Ũ��_�J\��)C��W��ʨKy�Hxޫ� ��g���y�n����y���d�1���Bv�i'�_��2��u:?�e��]����V_S�v�a�V$�R�-q�����i�X��pҥ���/tт���4T�R�a���e?�P߶�`Y]��X��1��:O��0L� ��SL5���L���(6�SeZI)p����<����������bw����m��O��7t��Lڞ�����3������'3#��Vs�N#:��4�SJ3���C*0>��𱔁��ʾF�vH�^%���czq��ړҹK�T�O*��hұO�=��'�I�	�bR��|RK7D�)p��$t����TpXbɌt������/�M����� @o��J���eӼYa�wd�e�<)Ѫ�E����N݇�6I�V;_��#���m(J��j�5v&�EE��c�i?��"	�X��t8�u�c%�.�~�=ߍ���vP��X�!���lN�y^����P�i��jY�*1$�R�ȢZ>�F��S���_��g_u��!Ծg����oy��
�}^�T��������S*��奶�H���y�CШ�O��I�� ,����i�]"&y�{�]�r�"봙S8����(�E���f@AM�.�-�6L80�BAѝ��iQx�^ƒ�?rk�S����&�j����{��=����
��f��RD��Lj�^��ߡ;9��j�ȋ�<��u�Y��Z#��R�=b��&U�a{U��>��b"z=�m���t1���27{C)��h��~����Z��+�?���b�����X���g�ʖ˿�`��co�RQz!N��m�b������c(gKq�2 �?�X-�7�ի�ڝmW�l:\$T�Ѓ��MԪ�B�,�Z�z�{(��&�QEv���B�$��(�a�usd�EG9������Fe���S���1�/%;��o�����lw�5�Mʝ2�:��N�[:L(�8�)��k��s�H�8���0՝�ġ{���^������a����c^����d�d�;M�D����q9�f�?H�����^mnh랡�m�������R� (����OӅ��|D�|$���΢�Ջk�y�Z+{u���fs�t��@�
�u8e&N�)6#��D�f�-�3�����q�+����$�������n�%OϷ�w��Fƈ�\V�t�^ц]��Y)�A�)�<H�u��X5}�-��
}k�>XZ�~�"Ʀ^p� ����ÏfwFև����DvX�lx?(
64k���}sTaS�v�`c��I('�޲�zX�z�m�%�rs��1i�Յ����\2��������1����#O��V3L��Pk�^SL��w��)A�����9��)�t��-1I�S��0�~&��|{����k�%e��ӕ5�3�L�����ڹ*f��6f��ށN����S�N�ڹ���tJW]2��w� ����&��z�cv��.��r�Dq>"�=�X�����u�zeyj��5�(�V�֊�K��>*+��\�W�hn!6��>qD���ܿ-&*U}�����؟��o����aq4΅{dQd�m�j��y�S�I���郜 p���� �Mf�� �SQ�Z,�O�!F��(el芣��*�����������nY�l���e��S�9Y�3ِ��r�-t�C;f^���u# E�	H!�����Y*���1yO�|�#��`��G6������
c�    ^�� ���)=@k�$C��p��Κ&G�v�_�	J��ة�����.��c$���#d�OV�o �5& ~ő��:^�n�]0?=�L)�H����T�93?��KO����6y>����ǉ0�9J��,���A�F'~�^O�I�u!��t�U#��rMo7���/K�T�����C�ʽO57�
{i�VS�q�:���-^�V�r^�]M�Sp�m�(��2U��l��KK"�.٬}{�j�"7�=@�\���?�.!�2����tF8qk9?��x������]}����?�L�Z�#!/o�kʉ��X�,v}<o��vi�ݷdZ�ԅ�p��v��RH��4��x��̑AK�E���+@ޘ�<ɱ:u�����R{�
m=84�ӿ/F������o	��������_�2�Љ�ӹ	I���}c:��87ٵ�M-샒t�!t��+�_I� U݉8��&��P�����d���%�Ę��y�^>=�w�7����ǭ$�Rz ��'�� �C�����։���SLbt/�3\'�1�0 
4�{�2Nޟ���O*�����CCY����F
b��t�:�S�I��͞���KW�U���ݤd�"-�&@�ise�
�!�w[zOjD��Pxn����4e3O��'�<gF&�Ǌ�\v�����PIo�;��~�Oy�U3�����z��m?UW��Gx�+���Y�vcB���h���������~Q���:�O���󷢬3a�s�gx�+��x�����69�|3񴐊�Bk]�;�C�����S�[�X�N��H�%}���gܓ���3��.�O��Y�<���7ߚ���B<��������;?���զIl|�@c�;���'���6%1,9B!�pYEV�x�/����IS�*���)���	DF7Rc�囂�L�G�~Jf3�ml�h �+
	s�*n�����z�pR{F�"���4"Q���YsA��fc'p�
�X2X͟�43l2:�
A'��qP�Y`(x��-�ڵ���K�$b�ʨ'�� �t��{pC	��#*a8�>��=Ʈ���:��tk�2)ʜ��F�72�r�����&�X��0u4U׵��h�?�� _dʔx4W5^��Ζ�9����C��K��Q2}��a�(��U��@>���J��2`c��6 �`}v0t�w{�3���.�WM��l�N^G�O�|��ڟ�\����!�! ���g|��۟m�n��~�K��O@�Ut�{�]g57�Xk�1���'�H�*���h1)2��4��©}G/,��#�vn|�����v��7���6��������������¾�j�#�����+}=�wEsn����n5����jT̥�
�uK���Zc2u�"�󲟰�^�
�5�������f�#)V-:n�k�c���=���F��,-�Bua����Ɲ��،(@J�e��Upc$��tZ�)܍NիN�Ը�K�#�\�V��ͯ�듌�[��w�!u�6��ּvT'OE�|0�;�}��/�s�3�2嶄���i1to�S�O��F!��O�?�G'A�S�4����mO�*Q����d�����m�����"W��|���aZm��r���(9ʿ"�
Xtڇ�~�&�r�kh/@�W�./�!�� �6�w���1�iǦ"_fl���mH._"�����x.Myj�*��N�N�!�Gؿ���:5�0�*�n�lY<?n�$U�H�AyY3敻�|�g�J3-ֆ�=�>���Z�n�%��{��s��V�?������I#��S�*}:K��?�@��
��ݡ�������{F*.����&�Mۋdz^��Fv����Ud&���b�z����3L56��E�a꘣�ig��EmϿM;~I��#J�{BS�!M�d�)}��DGY(sA=;��Q�ˋ���u������w��w;Q��9�JMhV���]C�~��l@�8�0�<��Ƌ����z�ֺ
nv�F� <^�L�SBV�2��.�u��Cbڢ��7�׏r���J�-��|�f�TF!�+�Q+	U���#�Ӈ/U�Q�'g�ć�$4l�i�������"cXȀ���ԑa�4����$׺����ܿ�4�wd�;�dz��Ƞ�ܥ�I����i[Ml;�m$%I=�y�k�q쎐��a��ipk;�/��BԴ)�W�� �����������7�̡yɭ�R���[v�M$s��\䁪_*W` ��шrZ�`l�C]?��w�����s�/�.?�8�7�n��^���a�h{��(������rgi"s,�"d���(uK����ݎ�����D�GF��'�w��	�\(J�U�&�&S�� ��R�*�Wɩ'9��z�SJ�)z"?g{�/wI4}7���c��˳�0���	�؍M:�y����X���.M���W��F����G�� M����ey��ĶH��h��r=뒛ȃ1� xD�L4 >$�����b%��A�r�-�:��M7��;�im��5���;qt�y�M!]M>��_@t�Ϸ��|�u�+�0���Xq�{M)���!��jat���C�-��ka�|D^τ}�M3P�=m�҃��_��\nϫǴ�vV�~A�Zjԓ�9M]�cRF�	;�j�����Q�����r�G.t�+#`"t�Z�8��j-5��fC)lƌ�t����_�щL�>,�,H�q�#�-D�)0�v�o�bP�p����5��\ٖ�s�nI��������#M��dbe�u8P*	��iՓ��5/��)а(�Ц߹�������a�y�&��N/F�D2�TS%T�~&��t�"�rv9�v��Ҝ�'{zA䑪�`��7.4�8v��v�v�9�/���ϫoR��- ���!��v�"`�I����?�S	F�b`I��� ��x����1
�RZ����O�̓H�]��P��y��ܞ�L��
O��0SOB\��(Lqs�Bw�yM��=�<
�~!�� P�o1��#�b��
�td=
(4c�b�Q�����S!\�݊=���X��9U���O^o6W?��ہٍ�B`�K���mR�b�x���:I�eR���'�tOϱ<v>b$�ȓ�Ǆ��Ґ���J��)��#S($���}�a�,vQfX�p+�4$�R;:�L�#��a�z���\��;ɕ���1zpѡ��$:�B�o�H�uw�ܻ����6�i7�~F��y�3�]g=zH����V���eV�Sao�9��M��@(�t����m�y'�J�כ_������nP]�1��=p?�*͆�AڑoSY$��o�@8�r�������u~ɮoD�e�Y�b��FiG�Ȁ@�ڶ���h�w��q} �3PI�񥦚 �Ip
J���P%/鳟��=:xG<���)]}K2��Q�����p&#����$]-����4�N4��2j���sb��:�:��aQ�J<:!�l�J��7@W>)�ʊ=LK$n�`�;9Q��h`���f�MNE' #�������	���5K
�uz�P�!�J���w;P7ﲙIN2�qeYc�V4�Ӝ2��Nqs��Gel`���a ��J�j��Ew=��B��z{��MqE�P���s_�P��9�Qi�s_���j�5���w��qe�I�o�P��������z��Bd:���˱�GɷG[9'-�����;�NQS\���p4J�3�1^oq�e�jvh��*����6;���u��r1���CW'J��<^;v��^-&��ut�2(�:E�4������ִ�+�|#�pj�W��k��J��✬Jt�^�k�������t���v1.����Ky9c]�w~/(U@�a�؄��۳��q�.M�+\�d�Mci�\}v���K��q��_1��Ԕ�$H��#q�K>�$oeo�	����B�~����=/�>T� !���
1>�c���:�Y��>��C5��6�,�5, :[e�����v�}(�;M�p�
��������/
�PL�Wͯ��ܡ��*)�^�.΋�g����H��    -�-��x��h��E��I�"���Z�Y0z��`'�������H�|+>AZ��V��!����)��J�Ecw:E�&��u�u�E}mn%������
WC;\U:�W���C�<�a7�r\l>�_�n6���{�n��^�UC����P�BPL������Xe���>��=�+�y��X��%�o�ݼ���Z�-�r��3�E�d׊0s��	�̗��;�/��T�@�R-����b�=��I���2dS�����=�6��۟��"5u����A[���6˶���	�G�z�ul\a���a�r��vzP�|{�;��cW�TG�YR�1��2	N�ѡ�'�NP*S�r�!�)�lMo�/H�(�"�P��u�i�ٌ�����D7��O�(FЈW҅(��o�*8U�g�X�[��Tn��?q��p��\����]O|���%=sk3����wP}Q0eg�7RB:U/�{{�yΉ�Ϩ���{+ �)��]C{���=C%��\
���W��ٌLF�3�)%�$i<�>0�*,B�X���:MɨE]B��=����������Bd�f��T�q�zJQ��s����t�(�Aq�Eqʏ��E�Δ�Q ��lJ���g�G*	U����t9�^�w^���;�+Mj{)�p����V�?�]/�N���ھeI��<s>E-홮�_�)�*��G�Qʬ�a�y�yy�#��g�������sɓ�'��);,���*Of��߾���Q�}��!�f��X�������ܾǣ�Z�_o��c
M~�������o��.�.+��6�Z��,61�<7UF���	��2�[N>���t��>�K6b��2����͓��7�b�n����?Z�g#�p�Ekj���ݝ�h���і�/����YI,��`R5��|�q{=;����tV�����q����<�8�3�t��<﹑�j�/������P	�i�O��O��VB&V��.�)����\�WS�]Yd\ۘ�A]2}Pt�r��G���Ӱ`���d��6����j[��K3ѷwP^��z� � �Z��?�,�u�����HPl��J]��V�}K3WER�r|s,����x��8Q<dn��	�r��G>�v�]�ov�6�u(5Z32Ki=g�zn-SɅU���(AY�>��z�}�Vp�G:�oZ��3�Y��/�$u�ƚ�+�N��E�"9U�b����O��ЎL�lc�FSL%��?���x)@��4��z���5�����.3�g� �KU�[CR�Y#�oS��r�	��-C�%�ZWZ����H� ���6	�"�s�?trn5:�HS��l	 ��W�t�d�4��i6�O�� !�0�ٳ����-7<��0tp��\@:Qr";�j������Xo��%l�WBt3"��q�Ph���!��P��6���a��s7�7��̐͞��B�&�D�4$��ٮG 9�?5f)$�j&q����Z�ZVƅ���F��ry*��+c���#��D48� 9�9�1ٓW���tX�>�"_UK�W�ʟ��i������S��hV����n]��rv�$�J�:�Vi+cW�
W�6Q؍��%���.�,b�`���g��͢��OI[����`n4�J�8Jfj�y���
���8Ҏ�G���L��2�t�v�YP��3)�3[�dAn���7�U7���c�hOR��?��r�,��*�<�(����p<���^m`s�Xl ��,w�����2����O�_0���y͊�z
J��}H
F]�\QF�:�sd�Z���a�&tM�BS�����bp�_7Ҥ; 4�Qf��S�J��t߳�3��i�
�U�SѵsK�b�����\���鲿�E���Wۻ�@r�r�s���# ���W�	�ʤt�RY��Y�t�I��)�z���\�K�<e@�F��mk��}0$���j��)�z�z��п�Q�Q[@�[G�FE���M�,���pY	9����R���8m�;�t�Et��^��ؓ+�ִ=���6�c�)�����U�d:ί�A�X��I�w���-�7��YdOz�Q�C���`��KC�%���|*n����s�U�s0��	c�w]?)z�,�Sx�!):іۛ��c�v��.��G�9!@HXā�;� �������h�
�i1&/����mv8�5=�ؤr�t�f�Ec�=�mz҉��Hּ�]	u)���ݻ� 8)�۲d�M����I�
�t�}���	V��ʅ�<��Z	���Y>]}��3�dxk(��J�`.�q����q��_����bT6�ܶ�*6za��l��Uk����$a@\\�$&R���[g���!����>_��?�	��U��4��S���ő&E��2j#ä�4��Џ%���!/��ݹ�S'������bO��J�NCN-��];�y�8���pc)�ë[��n'&����ֳ���b��K�[���� ������������>~H�D��(2��gZ��E��)[�U�֫����pZ�^EA���{�WR�H5>�o��8O<�Ɖ��3�F�L=<%%h��⹷R
�@Q
-��31r�����&9Y�s�,i�nP]��NW=h��RL�F9��^��3�	�6��I4F0Z�y�����V�B�O�K�ݐ:�8�&����������2q5�-M��;;�m�iټQ��h��Y%�jAu��hT�BN��-D�|wL����\�r✎F�m�N�p7O%e�5Blb�%$���f"%\8Ml_�$a@�,`,��²�mZ�\p�i���S��.>&,�`�l�	41�F���
��2L�x�G ��ALx���S� 0Vq����M�+F\y���uh3���X��n��D1y}���A#�R���=}+��zH���z��e�hN�_ӛw��S�V4�ȭ*�a�+��XW� �5+]��R��v6}Z�CEJ��f�ہ�?���Ė��� ���%*)�HS��'ٮ�����Ž�!��~FO%�t��6å�X�޹���ώ����?lo�P:$�{i���{U�1 ͨ�b�K:8;R'`�|O���Xч� ��t��ݞ�j�W#P]�����Py~��	3��8���lK�	[��o�n(��`�Jǀ�M�)g��א&�c��p_�x���[�K��7X���D�#$�̹�=���m���ò�=7� (�&X������@���:|�l������ݞ
P(W&�G��A�)�����Ĥ�� 2�W84[���j�5�İ�����~[�%����ʜ*��{�(~�<Y����y��VpS����Ow8ZW�y�!���瘡N9�Z�`%:rCTǁ���Ġ����T&E�0ߕz@�_/�o�'*�������f���r�2��0�O����R0�K)z� �@�s�7QN#��	'�[������.�����y�ek=�-��I���R��<��a5�P`��v�
ѩ������:�m���/�p���4_6O<��:ڢ�	;Hy�T 
�T�BJʎ�\��}]_f�̙�&�����hǵ����� �nT�ps�,C���v;ʔ��K=p����à�W��WR�W�"�;Y�<)�x5t3��p�_}E��Ly0!�|�e���h�X�]t���<}�kHY{O]($-�G���+���_1��w) p��a"N�(�.+5�9�i�:��1��n���|�a�5}����ޝן��6�	���M��j��a"����L0�r�W=�'�X��D!M�H�_h TE�w:�	���� qzJ�g47�"���֞th��66�',֞(9��"��x��|�I�qԇJ���j��� h�N���G����l4Kn���`F��;�2�|�觟�֋QG_a������G�ܯ���ˆ`#Qͩ��A�o<%�r����ի��Z9��)���|�R��b�n���Gr�Z�4s� ������a����TuWk��:�%���Bd�v��x�e՝�"�+�/�CU��q���W;���wP�]�V�#�4T���P� �7)�K �ue*��t����V����C    �����θ#�<$RW�J�'��ee��-�����O����V���z� D;^��v�Ӷ��� /���س���}v1��cm���.:��y=�;m1���WT�`])�=�5Ũ7��r��H�#�y�`���u1��a+h)+76�v⁸�ڶyU'[�fq�����<v�S�Ɵ��5
�o8B��[��@	2W~���b+�=���#�����r�?ܱtqM��� �D�m��i)�0@GP��M�_�YmY����7nWo�n.�'�/��5����dw�a�_����;�������.�����w�W��ү��W�7ɭ+���~���U���xU��������|j:+�a��v��%e}�hr-]`]H6Y��N& ����
zn���m�?H�	�H���+�m���B <U'��?��COo��Q��DFb<��hߌ�LYd�͒��m�|3˛jc�~���X�i��3i����?�0��13�\��m�uD@���)颊�iZ"�$9,�"sG�r!I^ޫ��r�m�f^g���� چ)�l���҆� ^�%|M�qV�̎o8#*� iZ>��V����3�P8��gjRI/^�ˍ�\M�,��@-94���s��W�Mi�����rp����%`9�իݛ����ܢ��K`��~������YZX�U-H�]��sV�Vn��	���^
�aU�JXu^˒0�쑻������e�j1�dl��҇+�\NI6��b��dz)5G�t��wi�G�}
���*�2���gȧd�^ArO��fq?Q����b&�����%�lP��>HǗ��@��sv�v���3�BU�,������!�g/�}b�	�����:H�ۄ>�w���Ђ�zt�Mf�'ר[PN�r;WyC�Q�j�p�HiZp)cZ�*�G����,-�w�	��� 7d�q2����P�n>�&0?��2������ ����t�X���h|��.!���۲k�@�����g��Ms59��`�E�M����ؗ����KA�.�  ���=����It��L�r�u!���cd�V�X55y�k(�T���@�h�m�N9B�� �{Eu��?`J�a�|���G���_]�� ��ǫ
� .�\�|�z��x�1n;.*Y1B,�9��	�oGUV��ҏ�5#+&�N� ��d���*��]a�Gf!;"Ӑ~����<mE���G����#Ib����ޫy�,{��	xk.j^Z`D��ϼ���h�MQ�fwY�%Zߚ۴ �3H����Է�~��X�P�/����j��x$гR�=�f_ͬT�ҷ:����8�~���_�p	��eB,X�*�G 0ىԪ]ېRX�[�)6�H1�PÙ�jd�9*����Ⱥ)Ӌ�l�zFeTa�'��$6	cA��S�:<Q�pߤJ�5\�2��@c/�&�t?)��ޱc%o0��oZ}��e �8��\6� 	�w�K�����M�7BM�b�G%���p�TtwM�B:���/w��S�D�x����ߛ�"%(Tѻ"c���n���Xˎ#���@G%�"/��c��(�x�)����>\��F`r��*�b`�L���%�6Dn)�S�爓�	�II5����s�~/6�6F�?H5��)Y�)�-Ph�_�Ǿ:^���j$)�p��!)�Mba�:����c�;WURF�1#�=f�*�p��jH���*���|�V��}y����Vֹ�)�A}ݤ"�%`��L��^ժlk2mL!�����O�'�@�
3Vzz���� ��¸9��R���\��h��rr�:�����6K(��cH�@[��#i&*1ɾ��ʿ��#Xq.4�ypq�7@�G ��vߢ��`H�z���F����S��W�DK�� �T�-�u�i�Τ�8(<q��M���P1ڲ��3� ���,t������dt�x%��XX'Ϭ��΍r��
�=lp]�2]�L�OJT��i��ô�c�haf�
����{���7�	uco�3>���G�n�E�ÜZ}Y��^%��14'ʮJ�
�!Q��f�0����0��LX�K�f�MJ�L�?�P.�v� %���� 
���̽���Gх$Mرp�=Ј�i7B.*���9�!��y�d���ᥛC0K��#M�⏋�h�WoUb:�thZYi�[y��=ܬ�C��0E��;�B�d���P�2�;Î�Y�:&4yȄ��%fZD��P�N)c7�E0,��(e���^��i	�_3�lP�Kw���"�f�f�Y���r���9O��o�D*U�{م*���ܖï���<޽=��#/)�/'��on��]��D��ʇ�l�
�Oj?q ���z-[Bi����N��P�3:Pa4�g+���F���5�2#�з1Zg�{c�K�,���%E�r�jL�-$�l%���!C�$0Y�]-�&�Q���tWb�J�^������1��W<�*�����8��X���oW�v�R֭��]!P����t0�1��;�����6��b��� ��$���cY�\�7TI��DT^K������2$�CI'��d
v�܊� Jo�r2�>���2s2����?.�%���߲3�	_��@�� X@'T%�Y�BR�j`���VЄc�ƣ�0�@�^����2��A��9���V	i[|��;b�
�w�BF͔�
#��^��ߥH3@~�o2헙�2׾fpEA�Ӭ����xJ)4[���/պ:����}B]Ϋ�:}`2e��Mi�T�/X��11$Hp���溓t�7��f�*�����5ʖr�Y �Q]����|�����X��Uk)Z��d�o¡Q�v��5�S�/cM�j��\:�;h��V�,��-�@2?��p��aӄR�g6����IJ.6�Fm��&J�S��)�~S%QY�o��w������j���XJ
X�B9�e2s��Rep��8�j�3�3��P��8G���7�~.���y�u�Fm����G���)3�5�4��%���ؠ���Z�-)|ܰ�ed���X#�Ɣh��K@�s[��[�R�������TL�w���~}�oG�$,��;@fj�3S�<Xl���ʱ6�r�9�����Uyd5�׀��9G��'��?��$���/x�q$���u��_�ѻ�Pܘ�"Q?��"Hi�|4YUT(8��aad�1��tt˘(;g�Yv�%�+\�9Y(y`r'q�bP�I�3�4�͠�l�����E5w�Fr�k��_%Xm��h�+�	�2�t�H�p���Pl&J"�HD�%�v�q��PO�P�'3��m���n�	�B5h�y�0�D��Z�ވ���������{��ﯡ�t�kJ��`*87�}V�;�ͱ�4�P43p��6�Q�e}u�Ruu}������� �����'�lH[�
'�FR��j�[}ޅk^P�v��b*(�;��xG����	���t~b��l��oonv��i�^##�+���+/�R/�="T��C �2��*�:t���`�E�ش�0/����ǡ��z1Ѻ���,,_Tl�����eh�kGzXiH�t������L��1���O9�c�_R
��QϷ�S�{#�7,� �_��,4�(PH���!<]�충'E�a<�A�y3��E��P��A�5f�˸Mc�������Ck<h1�EPH�:��9�:3p�Ynf{G�Q�Կ�TCFH�'Z�� U���2�?-�/7N�9g--�`��kȋ|u�~�8��q)�??�)\�V�gͪ��� [$O�%�=+`�b��jIf �Q�FS�L��f�Q@��x�~wC��a����5iZ�_c����n��B�����+�|b(r��CT&�J����ޙyާ�)�e����N�"_u��ر\������;����{��!֌@R�j�!���N���2�M��ʴ΃:�#@��3�'�U�"�{'3l�9�ZҎ�R��Ke�p%r:���]�x�9�4�����kN�#�VD _�n�m �<�D{{�2.���#T9
0!�,�f���a�#U�uc�d0��\�_���*�U|y<��va^�9���?}M    fm���k���7n\4,���H�A��+��!�/+�s��`/�s h�#��6)3�5���������~�M%[K�N7�G�-_m+4��K��V�����㛜7`~T�R��Pʯq�+L|����6r`���$�x+O����֍Z�u$�Hz��V�`�/p載�"ix���:o�#�,�HlX��H]���MU[�k��/_����!UW��h����Qc咀Q5��B��fj����ȴ��%�����]�?���:�/��|��,-�H��GLREݧ�B�T% �v��b)͡�<h��a�P.�H/���X�sH;%�HO�ʌ�v����Ј�Zg?�N'
��e��ۻk�N��)/��I�w��c�q�0O�
�r����B�� ��:�Kڧ�c�V׮Uk6��t=���v���A����6�$�i�׵�)�������b�����,S��X��郘��+���q:�==��0���=˗���ct�L��U��Sn��݄p���H��mx8ϗ��eE? ���̽*��${�~�]ʔFc�,�d[N{zrc�xf�(Dh:׎����ڐJ��ϪV�mA��٣�h�u5�"��2�sRrp>�"Ǹ>S��!���vE*���c��I�_�!&UH��\����Þ����J��v��jv��=�}'��P�=�q��|Y�w����'c�<�//i1ۤ�m�+̵�r��ߡ��V0�'!O�O��Cstq���r�}m:d�/�Uc�{�p��K���q���\QR�o�geJF1(�Nf35ee7.����_<�,������k��o��{a���E�_Q":{��E��x���������G�XdǹdfV:����K�iR�v�����1N�;-zS�/�d㪯���M��0�Cfn�2����,���=������#EvI��w�*H�i]ɥ1��f�0<���oڞ/)H-y�Z=�7�h3�lv  $���� �6j�,��77Inp��i�'!HЈF:Q�
Q�ig5z��ݪ��C ���$��\pU��~�� 
�y��jQڠ^8K�S�,�<L�q�:F�������N$J�q	��	���z���D�@V��`�<��DB09~�J`��ҝ?�lO��9�h-S���ZBBi`��ӅF3��60�F{�
���k3I<zs!��Z�P���8�1��y�%I^R��?�c;�R����&T�X+�3�/��Ï��Kb!hӔ�v�]{IOEqm��Π=P����*�r�W�8��
�i5	�X	�3�&�V_6�g�1(h��"A��+>�̏0�݀����5n�iw���A�H�?���?�����zGr�o 2G��� $�Xg�+Ph:����U=1T����pb�-��S}+V�Tw����(����6�����f�6�n.E���{���������I'�ņ�RAQ�bm����-ȷ��w���j[���a�!´�r�!XZN,����,iI�X���{^ܳ��{���$��$��%5ԁ.K�<&���q�G�$���&K�Q�ײ�*i����_h9��Mz�Vi�tT��9^��D<�Pt����E�����W�(�r8�$D1*?x���r�|⠸%���VJ
�R��q��࿂	����P����b>����w�UfoKPY���Ǹ��B�Ell�D.h��p�99��\���@0��G{.0�_�oM����bngRk-�SY���P�pC��x�Z:݅F�ߩ����D�3UI�ǿ�;�͠�f�?�P��^(	^1��i��_�����fr�^���Yh:�ELϛi����(f A�Ʋ��1�Q:P�y�Lk������d΋I�ܔ�|������/�[Q�������~�j۫���.!���VC�|����+�.hS$vH��X�|�
Q =�&fl'�`E���I��)�Z8���7��Hw�k�Fi!P�+S��)���o1��d����kR��	h�6v�����z@^s��|�U{CK���o�{�~W@9n�
j�,-�e�S����b�5��;�����D�I����7C���M��߿ *��Q�ZRҬMb�2�H�� N�a2�~ ���h�)��^}���MCD���!}��S��X�s��ޤ�!�dBI񴿡v����p�٭~����Y���-�ʟ�0ޭ��C5����7f��)������!��D��ˁ�Z�KC+6Ibʜ�xlm�W`]dUŠ9&G�X5W�/X�J�x����/-���Ag�P\H��Th�gDyb�����m(�0c��6u��@�h����_<X������9����/���*������PҴ;��I�y�I�Y3� _�W���ZQ�*���Cq{���ȍA�{i�b��+NP��1�CkE��SF�;���ih^}��oBA=zmZ�`m��T
��G��+�2�Y�>^]���DzJ$��v����Q`E�P}�r�j����t@
�5[�ƌ<s�D˽*Ҽ�7��34,)`xFy�l�ݥsD��q����T@��Z &�J�s�@���ϰ�)��,C��$Y�c�n9s��UU,�:�0�TL�'VZ$��u�yMj���M$�~�V����d+�	��j��_o�������'S�WPΓ#��zm����R���A�m�a��+��.G�bIԷ|��{�7��Z���'}{b���[i�`a�*�^IC��ەt� �3�p����I��lTV����OQ^N ^����v�c��n�X���V'is;�h,)5J�>�kI\�_�Y����yh�}����K�y .7z�)�g88 )�+��������C� w��I�Ԥ�i���G����DA�ן���U'4k�:��ޡ�zAO�b�h���Ϫ��ơ�P+E�!>瞧G�S����)���Xv�����O����������uz�����	e��vuR�*��T��0�T*6RvT��}Ň����w3�Ѵ����%�� ���|��p2{�!!��
t�7�Mp��$
�jT�ѥ�}�lI���oUʳ�a��%�T�Gt�K��j8A�W-G&I�Z���S=�K���7��h���eE�.�8���B=�-�;�?�h6,��*[	32�k���m�Nt��Ni}���t�i�|{��������R�.�w�$h~�0zs{��)���/7������ƫ��(/�+=4)���d��Ző�Ls��J�U���2,$����B������,�^uf�����p��g��A-G�9p�ҞWt3�2����������ծ^�C%�E��F`�W����B?C��L8��,X.�
������j��6u{�r&�>ۉހW�#�LE�m�Kl!^�?ߒ�9C��[h��T��!�9�f#"���{Y�E���	��W�y����������?��V"D�nݾ���Eo�G�ZP����8�q?�-vJ�8 )Pd�÷�d�hDW������P�8Jx�	�6���e�
RKT�.��z
f��C���^��B����EN�Ĭ��&%��?�-3ܷ����糩�m�t'���H�sV	c;oig��|_{QB86T�m���΋[��0;�c#P9K��Vݻ��%R����v��-�&?(.Z��UC�*�we� �aȍ�o� 8/� (����~I$��V඲_�Ӌ�ꎞ����Α" �P`��l��Y%��S3Pi����b�K����݈�=��F�[g�?�ZPh����ս�C����J�yTQѶ��lo3?X��.���Un�w0��J�G-	�+&F���}!i:�J��jRH�k��v�LY��e�j`_,��=�Iz�m��#�����}z��,/�Y�w�-_*�ɷ��[јh��f����m�����lO�Y�JvW�����<�*kR�^mE@W�]�Z�7_kE����R��T���8��ˋ�-8����O��Quy �j���ab�%=8 H��\'�pZ�{t;�u.����lc��ޣ�p�ZRY��i(���#g�Z��Z���E���rY�o�H���q�ı�g��<�z�)Z�7>4e�l|b��RwF��_}���|    ��q�<YZJ(�������\ދU�.��K���pa�J��S���|<|h��Ie���tem�2;�\���]���^�eu3�yp�Әf���;/���2�e�u����#rm	�Z=1A�jR>}~�,]�%7��/���T�~_^�":����SچO�������J1�i��	)m���&��(�'9�vA׉j��	<����,o�<���������n��� �.i#|.�\K;�H f]pŊ�EU�;�/���Rp���e��y�=��в�|<MM�h�	�)�Emײ�73"m�h��
c�ſ��^CGE�cf�z�8�����u^���������� n!
���& Z�.�b�����݉�.`���y�(�0����������ˑs�36�R��Ȁ�`�21������G�gSxϏ�?�FAZ�����| ��~q�g�H5��?����H�|����)5��=>0��)����o�T�󐵈�B4י�:��²�R�q j�Pt`>1F[ѵ���,�h8����C���Him.��ڹp=%���T�(���:~L*��0�R� ���2׷�h�+��
`v���LY�����d �J����|��ڑ	����O�ҦD͢��[�A ��v��ϓh+HR>~9H��%��������O^SRFE�P�ҩZ���!�wp(z,#u�@@���QɯE��U� "�+ƃ����r�����{�)���p�7��Zsr�n��������l�SW/����&���$������0�@V�)%�����a�ʞ��.�4H|h�B�Z��+�d�˷��C����	8��~���X��̳�	��􋼐i8x��^e̡�|p�zN(��9����(1� qАj����ڇC�!�O;Ne�����A���lX{c�H+�Β���K�#c�+^ �MK�{��ò������xS7�YS��t*�sc[G�<���m�_�����\o#-�n��J��7%��=s��<��qǵu���*?�Ԕ�R�#4��A��r��ﴰˀ���$�5{ձ�:�l��Xx�(y�ϰ�׷�� I��Y��iv�"�D�0�W�Г�I�Gɱ��iU���Y�3��0I� ���+|��k��=%�m�N̔h)|ڙT�<�
y�WF�C#.2��U�K��Z�@�9�b�8�EW熋�|�� ��kw�~�m��F�Z�*4��~S� �����n�D[������y����Z�8���(�I��M��B���j���s��/��)�I/}wX� ߡ|M��}�p��7��pN���㕸����>jq���b<�bu��f��|�m�ߤGo�s~�{����>�a��.r\�e������B1^�	�ܭN��l���'wn4M�Ne �W���){E`�j#F�/�W�D�]�'Dr���Q 9�]��"I0���{�Q����1�Ɏ�Hح���� z��z�x�q��*��3眉l��}���S�����w���g�q�kzW���u��P�?�;�>ksQкXm��a�P�y�[�A�w�n.z��Ӯ�Y
�9�hd1�,��_6t�o�3������NVR����|��K5�6W�o�b�o)n�zQ&٠��[XJ(KI�_�Q]�����4nA���!���0E�Y��F
�+D��s��c��_�ȧ!�Й8����ˆ��h���>�#��>g����{"k4b�i�`�3�t�p���[��^���m����.Z�JV���+�ݿ�C�|�[������f�M��g���~�1p�vwX&Z؍
�O�9o;�6O��������S��'PL0�A`Rf�M?��-=�ڑh�4])	-js��Y`���}9(�/B���~$���uΏjꖙ��.]8?+�s:�R�G���ۼI�3�+f�YGrȠ-f؊���9�r[�������9�����S�Rڝ����@�³Ns�����5�(4��-+�xm��v#��0�:�j��0��̲Z�3����v��Ls����[ə9W�u�ݼ��u(ep���h�8	�qn�FqBd���W0����W:�^�i$��f�	���c�&�q|l�����v�>l���8.Et��{����l�5�Y���to��6�|���6vlQ�C	��c&�w�*pc��@N�~2v,��Q@��]��^������̈��Z �N�N9�딐@�r��%�GX?Ao͌(}RI����S������#`9�5�O ^��B/G:���{����~{xK�� ���?2A�n�n
���������lz�~s����}���\��aq��3ź�+�ծ0�
<Sc�糚�&�}T,��Ç��C����ُ�o�&�Z�&��sq�<�e�ݚ�p�Y�s6��z�h���HA�Qf|�MK�y�t�ܳ�fRll,/B�n1���Y�$@�,T�sg�7&�̨F�=�W�B6�Zڔ6�3d��ҳ ��}�y?*՟�!�q��S���S/�)�'���UF.HG@��bz�h�ʑ�P�b���8}Ш?�Ė�+�G.4���)���dώ�����C�z"c$�����+c+~��lr,�h��}tf��N=d�<ȕD�X��BED?����ڮt7�jè���K�F3`�P.$vV�
oFE�h�ir2UN$	�'��"���q�\|:�#Z�5�d��m�W�Хo��n�c��(j����ɞ�orh% �ۅ�~ *���ً��������B ,=�_�1�e~�Ѿ�g��	��*��`�%Ԃ鵩b��%�S�K��F.\!J��i�V�E8Z�5�������߀\�[lҷJ��oA���Ja4�9������y$U��̜{XÀQ�?��K�K�ac�-�LԺ�ߦ��ܥv�X����O�&�Z+�T��G���0�s��������RڐT��� %h� +V��`:ԅԴ'{��,��ԗ������b�PNi���7Ƹ%����ӛ��.-�"'x����z��;>����zD��"�cJ9aC|�?^����N����D�ݔ�pH��/���.�c�u'��y�Y����/Y�(G��贽|��<���v�U�.�cB1N`��%�Iʢ3����{HƸ��3l��ϛ, +F@ę���Z�� ������s%� ��g����hl3���g�K�LW��3]�gRy�ٳ`��T�RyK{�D���6�xyY����^�1�3��^����o�����C��!�E򒏖G��a!˅��5�^n���չ�e_o�����U}���%<��[�f$��\Tg��D��]����{wV��f��c
���Rb�m��`Ja!��?���z������Mc�9��Ui�'�����M,�`� ��H�=�ߠ�
8���w�:�����{�R�ծ�YY���&")�I�<CmF($�-(H�n��������;����X�(�=h\�����bnaxO7������_���mjLp��`�Җ�O����G{�^6b�|LuE���tCaI�C�[7�Q��D�/��.K>�\1�/C��M�rۑQ�%���)�Im>���b;g��:�LIY���I����q�_p����w�Fe��[*����v����Ӕ��"8�I�e9a@"��r�u�+�ͥ2h�M���������M�ޞ��v��Jo����϶���N�ASq0��t����t~�6BԈ]
ղkA��AH��#�ꆮ���9>�ݷ#�j7"�A*�q//�F�<J���X��(QK�*/���6@3����:��:�Ebq���٪Ci����麟�}
$uRkT���Ā����xw�Sz���"�J]��m��Y5v��_�v�x�KO*S齂yf������v�|l���^eC�e�#s������b�^\_�8��ܾ�L{��.�!k'4և�fѧ��mLSfҰ�� ��g��S2T0l�����:��� T-��/VJ���F���b��N���.	�x�*�� w��1����R�q��쬃�K�Љ����j@�,3@+]v�Q񪓜[[�P�=����A]n~K��Ԫ4j���L�r�:w�d��+"�{���,5t=e �  ��ŵj�{�E}�[()E������&�J>DMSd�AG��"��]2��H�B�c{��<5�|	��4@���$�� E��\�d��� I���<���f�̌)8�\�Fd!0JQ��]U���@_q\v�#O�R�A[Ʃ���:Lk�:t4؝C���^[\��v{�Wx����Y�\y��p�?�nRf�E���ZHro�eS���А�K�p�'�����o�>��������;w��!hsN�vT'6sï�d� �Wq.f��G��ނf�꼛��hB�qu�[�O��{y���v��Ho�#��&��Aif�r� }hJ_48�yc��$����¢$/j�Z%�z����cZ�ݏPmXukfե����k�����B3>M0}x���h��w�#�Z�V�����'4��5k�y�4aN��G��b�$�����)b�.��ܫ�K�'�<7��e��q0�)S�J�9̼<@���w�Cn�c���ԍ�S�X�c����	A�O���OI�ju�d	ciU�h�B��`^���O��g+w����P������� 78t�ح��B��S�" S62�l�: ��5��_�P��������Ǉd2�<m�9��w<�S�S���(�KB0 )E3Tn�|^�_�ұ�d�d���7�������H���<i�4'a߀�QL
[�8,6��ƶ�*��x0h�[9��֠Ԃ�˚
�R�?��9`͇�U"��� �
���C�pXcO��U�b
��E�Ȣ��k��M��3�Hd���
��%w��i:E�~�=�n��bS�������rp ��m3�5�z��eRb[����e,�O�s,q�Y(Ҙ~3�����u���Z��C�(�]�$/ڟ�0��ٓ�yo�3�� �]}O�b6�=����8-)ߌ{��ƚ�.�7<�Y����N{Qn���,������#X$�sҧS�G.x�9S���*D��TZë��O|*��C�~_��i��D[�{�vΫ��U-D�ώ���4�3zXիg)e�=��_b��;�l�?���LҖ�Z�n�.B�$*���>1�Ѫ[�Z�U��N,.J~w��,������,-&��u�kT���Z%Em����k�p�]n���"�H��)�E;�{m���_]}�s�-.[��y࿾�4�>����k�u�G�?�#}��8����G+��~t(������M/�܏����[oF������,}N�~��7����>��Ͻ��m:��ߎ/��yw�i[�dqHk�v���t���X�b���Yghw؜30�XQ]��<	�2�:��A�~�}�Qbb�z~T
g��|'�r	~��f @�އ�cUG;��(w9�K�*�L�+ v�\A�=�S�z��[/߼����%(����#U�������AX�1g���[�k~dݹd4�AUF�AA���ƳT����	�\�w���.��Ր~�f���3�LѮ��Z���=�lc�8R�����ݑҲ�w,���E���	BT�����g�$��7������=y�}_"�\��������a�r���R���J���֐�:��#�������������U��w�,�����nv'|������*}��yߧ�_��'�_�w
_��RW0���=>`�E�m��Βw�S"��o�/�W���|��&���W������7��y���?�Y�\{~B?#Gɟ%��=P>I��w�67����?mon�S���d
_���_|��ƭ&�      �      x�ԽKsG�.�����.
���@����A�Nۘ�� �D+�6���,�j�w��hS�iU}7���cs���#3<2��zlʘ� 2�=܏��w��1y�h���v����8[~X/~����&��l"�Ŀ˲��=���*���b^ݴ��l���ۼi����*^V���I1���;����_Ӓ��#;*�ON��|"�i��T=�����-���e[M~���a����֋����^�V�U=/�U���x<1db��e�W��o��j��O�7�bU͊��x���-K��
�U��I��"I	�3���U��N�q�~��=�����'B���k�۶xz_����x��W��z�<�͢�����*��Y�h�U�j�!̄��K�#�ᳵPӒsf���)3��2�i���t�/��Mu]-�[�_�oK���U��7��9�uݙ-���,�j�����ϯ�_��e}m')&J's<��g𤒍�l��W��_�e񸂭�jO`���-hYRx�%��d0<x��UPVAj6!�U���I�����Rݷ�j~[]�w��l�|��Ϋ��x�������x��C;���z���0�j�M�Y�D��@�E�3���0�o
`^��&�U�s�}���D
��´L�,�8r܄T�R�m�ϋ&%�1�,�X��l���x���p����.^�ۥ�Cl��͛�^Ux�nX�wu�ݩV��*)�pt<�enjVN45�������7%���\	���id4]	)�Ԏ'�brv[��b��jq_���p���̍nϭ�9aO����_��<�S��=8^Faɨ�E��J`��;������M����D�䬹���Ɠt�.��x����j�?��j+g��!xý��p��lQ]�Wռ8�&O�1���i0˲���[kC�󈯋�!>��)m?t����A%�Y��tGH�t���z��έ������V\V���-�4`��U���}�ti7��jvS�9�%��9�p-�����`jJ����m���x}]��m��Lk�5fp�`v ɂQg`����x�)�kn�4�j�,�-W<����~�H��]3�n��GXV��`��@�A|������K>9q���r��gW���;DY�\ve��,5�~���f[�P�,��a]��ε��9ʊ��h �����%4�����q��~0�7ʗ�z��o�iQ�6?DI�5|QJ��D���u*�^'&�!0�y�B'�����z,T����C���ph�*��r�9����滀��yY�W�.����6�n�
x� ����'a�`�D���^�	xa��!%S8�c�s	�W�/����������8�Q�f� �n��zs݂�U?��/�0����XΘv~�������O�>8]<-4=���r��N�7��g/�I!a���E�j���W��l}UoM�n��pK�I鴌�@I�� S�x�x�:v�];��/X��`g���#��܎G�j�Hw?��o�ch�a��˪:��o�#�3�Z��ach�{f}�:����Oq��BE�3$�N3:����KÓ�	~DUW�bU\4hqxfH����;�/����`�A�B����JbTn���<x���t��M�Ȱ;aW�,E������_��m��?��բw1�HB�çp���\$>�h&q����Us\���I9�]���ï��h�`�-�VBE3)����^��@���B�o3k��D����e3�g���HxO��|J/G�����e�����LÐ�M��o�/ؑ3䫙[&�_�+S�?|Rp��.��,�ص\�v-�|]��nӾ�Vxo��U|Ds��o�s�v��}�\���Y�ny^"��Q�Ɩe������(_��[sF{2��{��Ü��g"���q�%�{�"9����/�yu��Q���͟׷1$�t���ͷA��vS���b�;IP2�p�o����e�_�&~ʤ��?��%�2I��"%a�w�\~�w�k0�����s;���v�Sq"��Ň�Ǔ�����G�ԩ���G(�[�gdB���.�ҷ��{:[�F��[�9����k7�|Y����cN�zo*����ޚn����-��3�i|���-S*}nf�i�,��2�,�+����q �}р+P�0x�^-��ʥ~�o�_p���w	�����7�| ��6��\�_55����)�x��6I�oZ����ՋͿVy|��ߐ�+8�ܾF�
v �a$�@��i8G�)<o7�d���!$]z������.6��������b�����J�-��C._�c�o^�Gc1r�R�G}Q/����M�,ځ��f.s7�n�l����w�[����1"��p*̈��#c'%�Zː�H��╽�����
M�V.���ʯ֋e����M�i1ZX�d����~�
9P�Ҝn�BḾ�!�� �{຃W��a�r��`*�k�^5��O��e���g�g��E����s6���nv��2y��+t���,K̖ː-V"s)*p��1#����1�tn�B )K�8F�cJ�Ԕ�!�]��e��Ƀ��1�{@���]k�zÖ9��;���=VZ�����PD��L��zŞ���D�|��|�U���NR�-��GJ��J�J;4��o�ٽ�`p��t���mj�z(5��oyo����O
"E/���2alJ%�1^�S��6'��w��dG�֨c�#4��7�|rNb��VI���/�Bx�l����Z4�ʞ�U3LH�s3�	K+c��n)10���K=Sʩ��:a0P���ۥ����m�w��=�	��c�܍�TP�g�&<����}�E�,�	b�.�!�3� ���f�����0���bݘM9|qۇM	�+๨1��x�,��.&����������_^>��|S�������ϊGg�7��W��l*��q��ܕ��w�h�*�=}}���F�u������W߾F7S��S]�m�0��� }�aW�mV笹/�D�_��Ӓ��	�ż�S��6�ݠ��t!'֯_V����}��!���wRHVz+ Jr��kH#���)1>o��1;"��|�������皋§g#Q���`�x�����^����;r�a�U~�Җ�/ۛEs��MX㩡�7���v=��TM57�+^��
��p�C�&:?���bt�D����:�D�}�B��c���$1&UD��$$��b0�S��_��ڗ���gc���H�s�>�	F�D��$/N��r��5V0�6����x�^U[�p����Vn�w�٬^X�r;<�.:Jc�C�t����(?[��߹\�Ti�?07Y�n�`e�����'��$_vd�}F��gFSq����ńA?�m�o��:�\�������Dc���n�S�?���b���b����{�FWa 惉�Cq>87��Ɗ���p=����oB�]u�U�=�'�D$,��u��à�{�'�{�'d�9~ӂ�>�nI±��)-������Gc 2j��b�h�|��+D�
6!���`�m;N(�8��c����I]�� ���v�au�}�����Xp�ᮅ�,f>�sx�^��X.�'��C�&���ʌ}��]�$
�`Z�C�e\���.�3�9��Db�L�SC��(�T]R��i*�(��
����c|����溮��� z_V3>D�D��n�������բ���k��n}��\U?T�5��U˺��\�4ˏ�67�N����S��9�LrQ��\H��WBļuX����b�i��Ϙ��	X��fm���(�M�ckmQ ���[���;�9�S��"���2�@8��>|2�l�@��,�@<��8���g.aKh[������y��G@�Wc	q?�lB|���S��hpGiCʱ���� ��+�̄}f�k�v?��9B�\���8�I��-X-,��������m�+̷7�����Wz�o�စ�C��@�XprMdM5�8���吽�Ш��3ٹ�+1���̊�!��b����1��j�Ő)ڕ��;����^��)�.��-AUw6{F�<�?�W�9p��    n֛_�>���Ń-O$�A����0��|�69�hc��-�� �
�c)u#?
Qa���ȭ�iakT�k�	��	�> ���`����'pr�a/࿒�[n��M�^n�0ujJz��$dw��^ꈬtD�vYi�)�κM(�17sӟ����G3w����R����Ee<�k�ͿVL0`Щd��Cꝇ\Rq
�i����P���[ԛ�wO_<�x��)�������j���L������W6c��l, ׉.y4�.�d`NS)�,��o��#`���A��&�ń�j�N)6l8;\[��Y�t�{@o���`��u���[�W�����UWEa|ʸ��fg!>��:+^�]&Kn�ƃ=__c�NMi��)���w�����dbs*H�I����o7�w����wO�ӵ�D����U�ϐ|�٭F6�5�	B���&�3ѧ�Έ�O��8��&�I�A�,<r�0�5>�`m
�s�U����\�Oo0��:���b���PV
0<2��d���?�3�O��%.ʙH���E_5�p��A��#@H	��8{���9��j���}���>��pQ�J��U�ݰ����ǲ�l{PD�7d����+C�i00�W�m�'�)\i�.B!����X�l�!���p��o^�<tsj �qx��an}f��r9-.Nc�a($}�!���O�����Q�h2�]o@�r$�?�7BZ�\��0��\�W�:��
\�<b؈�%x�����ZB ����cd��H>ю�_���g������	H1�#`$��0��j�d5B^<Yc�|sb���!���-F����S��{vQ�t3���K��`�)� ؔ�<DJ�Gw<<,%�a��Ä��k�&���2E���)YE߁��gg�_��H�S�����E���>u�k��z�x��p/<4X3G��{��Ax�`c'oo#�vny�v`a,Y������v��Y�0 ��\��!�y8����O���w*��lz#��f������ƪ�J1%pgC��';4���W���V����NKg�ߵ77�z����(
/6���%�~=�,\j�T9�rn�\P����>l����k\��.#����1&�]�ދ�L&�EXɰ�>|0���+�~�?�����PY��]r��WQfZ�|�&\���0���z	t;���K8sa#�b��u[��jL��}���ߴK{vC(jW\s�#tf�|P��l��3f>sk���V�$f��X���Z�=�0��j�p��f�0R}�d(p9�<�A�x#��H񙁋��;Q�>r�����u���4�P�/�%�|��S���}=����]Iū��-���k\�&�y��j�:oͬ��X|)�7�=e��������됻�����:T��?B'�����fWO������gωs��ȉ�����N��i:���#~׷�$�<4^v�ʭ��������NI�h�+cƗ����8��T�|�L:���5�
+�A�?|�p�lM	7V�^|�L:
�=w:k:X����������_篞�#4���AL��@�7��d�������w���5 `��?���+�F�]��,o��ŏ�-�Lá'�2���5�v5�u
���0!F��(w���9~/�u��C/wI�5M�p�3ER\�.M~��z������_�Occ��D;�7��ދ�M�ԃ�!L��{?�A�������Jȩf�)Q|��G�O�3����cbGj;�|��|?	�8�3�%GB)M�qn�����p�T����.>UDebi�g2��N,C��>��י���}w������t�Bq</��Z).���ȁ9iU��l�ӭ]����L0�7=��8h��```�����ߙ��`���9�o�d���\��j��'>��gx�)`j�y ^h4��w���q*�=�y:����Tĭ	�hۢz$E�x�i'��;�z���}�ž#H���v�����E^�m��38�����4`*�1�6j
���%N,n/���ܢ�]���*�]�-cʩ�=�.D��S`���ז9�g`|ct7n����V;�ͭ��/�Uz�gW]�@��:���N5�l���������&IZ�a���@۵�i��L��RX��؜h}ҵSh�� i�[Jc���Q��u�n�y
�g�A���2M5U����o�fI�E.ߪrD�Ȥ���3��J�)F�ܑ!��D��5n�%E8��`;��]]V��O:Tkn��1�Yl%���[Oif_��A�mE.���8{Q(�+%l.��,�e��1�YW-�I�Ҧi%1s���ZQ��2��&�7;ꬹ�r�dJ���A��a������rnDxF3 `z�pӆ��jy��o���򊩁�q��^Z�BK]N9�j��dr�7sKa�R8��[�T�QG%!�;[T�|ߞP�8���'~r�ٲ��PIg8VWn��#q�F�򶞹$�=r����>8n&~� sR�����d��*��+2U��7�|�G�s�O%U�i܇�����6g���o���[��(��C���<�7�`�>��{�KE�H�)L~N��(�D�-yҵ0���<�bZ$�:��&ic���c!�cy�@�7�ӫjy��+r{'F2�:�����hz�iZ�ËM�f��d�rIn�U_����#�~ٞ ����Md�������\ן0NIb by�{!t�w|_�����J{��~<��
_!=���X�F�#�����)K��c &���w�ht_�ص\���`HXn3�CO�E�^��"a�:���$���K	ᕔ_�d�ᜎ4R%\Ĕ䧌�.l�!� ������/����/��~�[��N;���}���j���8�&�c�������O��]��A3���ގJ��Y���`�%RH&tr�d!�:"v=2�Or8F�U2�w�=�"��I�ݓ�%D�4���������D�X��n�M��$p�p�dX»Dڵ�����1w -��
�G4�����N�c�z�a���c]_Y�Ǣ���T!�WU\���0ֶ�fk�Y`K�%f{b����gs��=�6�j
F�L[]VA�靟[5�W߀�`S��e$o���}��g��7�7�AVG��!��}� �(X.\�>� ���VH�`��m���L�EiA��Ƙ[&8�<5��� �"H�g`;x�22��!�b�)�b�S�9ƥIҩ3����6y��)��"VݬC���B?�"�����Jw@�CX�%�h'`זUA�(��Ph�x�������'����h�q������dm;^�!��t�n*Ą�ݍL_<t�ι���$���$����z
F	y0PU��B6�r��ja���|�RMA�Q�k��m�q	5�c[�ө�&v��eܻ�Y�`J12�S��x�?��e�0��� �c�h+£��4g���v#�I�����`d,05�}���]v����m�p4�]tzO�{\	�6��2uǐ��$_֑9a�EK�wsD{m�.�j0��d��ZBw���cxL=M����x����CDC㽍��N�M����݁�2wļr�\c6�.�������K�2�Fߋt����D�����Q���VL�i���ݛo�N����_쓜!��rg��ETG-�.@X�/� �5�ÑZgSk�p����軐t����z�)�A�.�TK���&�2��"���}�,�����д�vue����8��F{��(yz'�	���������ș�p�-N����.�����ia�̿<�Α����Ӏ]�SzN �V��
];�i�~-s]��gnZK�^C��%7ӧ��ri\�J�z���J~�89�\?ץRj��陯����!�.�W%pB|L�)�)���+BÊĤV�n���$VbS�z��*�/;"�P�����!خ�4�o"E�r��Z��_῞ѹT�;*��ew��ۚDZ��7�z%��D��D�>�n�qh���?���e�aY�T��Kp�9n�e���a��(Uv�ݶs{����m�����\��BΎ[u���    �Է���$��ί��`k1�5���QφÄ�׉���՗2x��Sz�6�dj��ғT�[�$!���'�j�LFՄ��������_��;e� �j���TkU�j.�-W�o\VN5�H�\k{��v��q�n���M_|�9٫�z�^|oW{̑�q���,�c\.��`����u�iM,�(��I�0vp}���f�L�p�?q�"��J2�G�ȱ�,�:��B�t �q�Xųf��P� �H��hhֳ"R	�$H*һJ���%f3�G�Q��D����^���rQ�+O�'���qw��G�KS\����3:��I�&�Ta�]{��ّ�R���-���� �i#��߾�:6ٔ����hF18A�ڽi�X=x��t�	�5hiK]!i�R���=�������Ya.}(���7�&7���Q��^�c�����8�Z��˄D*�N�D�}��K�G�6�9zl�q5N�uDZiK�B�9!��A4���G�CЄ2�/��9,i�p�'��2�]o�l�,^�o����pF)c��8�jPBtq[����Do�Y�Fcr���eqk����Y��ۆlA�I��p�:�D7��ld�EW�͢ZU��k(Q��y:�T��܇j��V�RaG�k����6US�FHH�ƒ=tv�>�7E�h�<s��@%%{�����>�J�0:�K7��j^D)r� �3�a	m����� �#���;���_�%M��,G�@��`�c����`0�Ӧ�IH-��j�rNPn��@�up5�s1:����ug�~!��4�>lq&*�r&R6�;�n}�_Їm��"�,����0�)U$�D��M���m�3��.��5B�����20B��L�%{)Ũ��=�E�/���(0��R氤�����U�׋�"�'ϷC�͗^��ʉv��{��K�
��rR�OE7;f�%�EEh��s~�"~�b��EN�O�9�!5��|���D����ׅ�uyV�p��y�%�X�;�ޱ,��y�h?�t!e���C�.zM��4S��p�>�͐GK�S6(���i�} Ik��y�Z��cd��1y^��fR��/�EY�t��;�"�m��q�F�D�ĠE ;��!�3���}�b�|����"�31R�.�.<��<��4��X�9X��n�j���H�(������MP��Tv���U��/F+G"��ު4
S#���������g،�W6�=�QG�Z3>�ЏFo(���甆Y���ɐ��AԔ���m�>/���] �	< `���\6+W$���
U�n9�4P�����A1�G��H�b&�r|X�����s���]���_`J�	����	|��^YޯF	���p"M����E�M뢕L��q���^tf�M����p$�,�q��6s��>�<��?.RZ��v̦����!�H������D����^�yw��u�������Wi���c#�ڊ�9�1[0ê�o�5�t�D"�4�Y��9r�28���a�7��M�ݸll�J�K�$9����Qvxe>e��2�tO_�����%�\�&u02y��������K����W{�>V�$�!2ˎ[�%�K1-#nj(F#�05ĝ�P�S��w"���] :	t�g��Җڹot���p6��+�S` rf����g���K�V����gI��<��Qp4�UBK�f};�Є*s;�c��3�� f�y�1RM]�e�f�r�L ��]}IG�l���F�M���Y�#��%�_o?Zy�椠1�3ؿ�g��U!��Q()�� ���Ѝ�v7uC��.������_L�km>Y��{2���]�x�-�y�l��]E�+����U�4�L���e���\^�2�W�na��G��b%�$ȇ��.��X��.�;E|�� /z ��V�A�U �'w-����}�q��Y�==*�߅c�p{T�..7�m$�ۗ77��u�$m������L0U��"�^mT���0#���g�=��IN���Vad���������7wCX�:���Xo Zd�{|�;��p��D��4��c|���%=�=��Kኆtu���ʺ�o`n�`֝~�`���}����3�u��ٷ�GQ�#x��2.'q�7cB@��'oi\cLΥ��V����ڸ�����5��۽-�7���U�'ʇ�t�"f$5S��9.޹[� ��3�3��΂_QU�mYe�2����G\l�[��{��i��#���W3z�l�>���,\��6"ynv:��U���ml��u�RJ�f �oĝwK�D3�!ַ<���	��
�.�
��5]v�0V4�U%G��M_�X*�qhj��jd������~�=�Ҧ�~��2/��?:���S�����֝�?�/)���TdiOEv�
��Rُ��7�ͽ��Xh��{}�4���u=��8gY��N(���m+����zt��S$2�A�5}
Kt*8���"nC� ;w�\/��c�I���4�.X��#f����΂�k�Ml�J���.ѥB%^�y@+�4=�񎭅��3��ɐ��f\�5l,ze_8uS����g�^1~�2����n������o��5����xi��e��"���1�ΰ��d#���K�]^�N�A����~�!*�$� ,�B����4�w�
i��gIX&#LVE!�'��B�L�Tp������EX]{֔�;D�}S�'�ѻ�B]]p���0��߽��� �F�N~�RH_��I�y����jh᧵����*��i���a�@��?�Ν�_��Z�ժ����Am㧵�1��{����yD�(���c}}�9\��.=41��\����`,���(��x���j��(���K �o����h���l>����'���ǁ~e.�QA�<v;ǡ���(X�7gϋ���篋'O�?�v�b�`L�)��x�����V��C�=� �n�ݬ�K�^�ܪ��b�g�f6C;u�xny��su=Ã*�����h�I�-��V���=D�frJ��d�"Ϥ�Z�~�&�'�Rk9<nr���KH��J��I\��'�6��6��������;�>��v���o��G��Y7���j��@{�^9l��)��Q�aZp�ͤ��Ђ�k�xTY(E.���H%���Y�-i"㠲Ż�z�kk/pp #-��I˯� �Z;�7U�-b���Η�I�?����Å4����m06b�i��Sp�Q�"�у"��N�!��0��A7�T��Tϋ�;�ͮ��V̲�=F��bPQ8b��b�Ĩ�(; �*��%?zٍ>i?BLuZ�$����kM���3��0��$"�=�;�����d���5�]?�f��� �-��ҙ�R�����2��?�#�c��5z��	V��ʟ��ޢ�aGzX( ٕ$�G���E0�[�Y,�!���IB[њ��z$ʝqfu���Yu��n��5�٬��:��R��NX耓X����-�\���VC�,�(���r�!�QoB�Aw<,O��l+H#Tn)Y�2���w�i��� ��v]-�kw���`���2I�`.1�Tg�^��(�yJ�9��kO�)9�Pg��i6���"@0VT�r��zS�F�g�Qe>L&̿����'�:��0]��W� vl-���E#<)��$��&�@m�!͉����}��Owp�<�$&�F����-�,��xS-��j���{߬�\�Dؗ�w�<�g��F���M���ׂ�������P�]"����E��4�ʨ��+C��y��W��JR��PP���~;n �:C�v.ψ���~�s�^�ת�%&�J�%��B$��#����a�ּM��
��1����fvUc���j}�g�[��M8��ڻ#���]�jj��z���][ ���@�]�,��,�J�-r<�.۔�)by��c�+�u�aщFЩ!���h|�Ȅ�!;��%-b�`H� �u���JM3#�ʺ��z�n��V��P-:��*����ǐ��Э�1��A���L���K��S&Z%!Q�5�K눺�x��ϗ�U=�.٢�6s�o��ݩ^��<ѹ�IJ    ��^��{
��ç�V�!��Y�X*�:n�2�P6Zې��u�Vͧ��ò8�P'.?��~�S+	������A�3�fv�&���6�Y��-�>����(�������@��/�?ƴ�	*��䶢�&�s�jp�]T�5�yI��N��]���d�%�zʍ�w���[�@Gh^7{hf}�w�r���zp�і��n7u@쌴�,�(K~�A�c�^y]e�k6\�c�5;c�.���z�y�c�ʷ����'��#��"���?�Aܹ3��ĝ�.��Ʊp.���txƴ��Ӈ��Uc��r*F�f�:9�0�\Tט+ۡ�wT���'�U�H��R�,V�L�U��+|�Sch ��ś˹Q�D�6h�fXmŗ\�z��r����kκ5�i ��?_�?�9���t!2Y��3�w�5�60�gNx`ţ��_�N�����M����:��Ǫ�*��N(,d	�#eY	�8��em�6D���9��<Yhg��
���� �.ۄ�73�UɜP�l����Қ���	Ab�R�܈�*��n��o�ԋ��%��)�vݿg׋���t�Kc�gyD6}A�b�5�u���MJ!�IS�.�.H>��S2Y �_��[�ʫ�'Alʃ�ւcyბ�0u��+�BӒ(�38ϳ� ��x�9�W�p8Q��+G! S��AƘ]7խۻ�vQG,���nLVڅ�_�H�Y�OL����%�TS��:�W���@���I׆w���.�4 J�>?�����/�JЂ����(T�������7�{(��`�Ĥ��ʩB�à��JD�q��:��we�Uqq��hB�3�qX#��X9fR�K��|rjF�}��i������}5��l��N��$ϭG_F��( o�&��r.lS���Z��s�Kֱ4-`t'�ƚ[7�c'�/csTF�N�� ��1�@"�>'�2�F�e]!i�M�.y��8>bf��
0��F�]%�2p�	�h0��EhI�4����2%<+�L��]M�63��D2 k03�Sɳ�8
$���9���7�/ ���`���S6��xk��7a*65ydyM�)2��o��W����h�0�>O�{���zȨ�]")<6�f׍�us]0����|k�2�Бr�c�@I�E^i���t�Ah�ɵ�2�!YG� �ti�>��h�&�@��yOf�I{lk���,$��t�z'�?�T�%aћW�PP͕��Ϗ�W�����rx��T�F:!Bq��Us�n�aBS���Dǻ#%�=d�O�������=DG���}[Y���Y�D��v��硟�pe_.��+���'ؒ�<����H�H�%�y4�� �0�����boI�u�.[�%����ؚ�՘t��304���9h�]�@f�FD�6��T<�@cR[-��M�(���Dˣ����mg�W��|��#4����A&���s*_���Ӹ�{h��7������}w�D�66�p]ݠ�l�g�-+�4͍��9
x|y�Z�ഈϢ*,F?s�S"g�;�շ�����ׯ����/��������1���W��.z�Gl�^��8ʯ�m����9o�i�����??}��xqv����Y��iqvy����^N Ǳva���0u��JT�#J��݁����8\�p��0wv�%�S|lg����� lO�2�F!t���0Z) :�u���X�,�HQ����w7�<J�MtP�L�X�c�V�`#�'��bO�O2�t7H���T�`�T٩������@?Gɾ �󊹿@)�72�2d��f �S�^�yG�~�~�q��M���or��M����ty�s�P�ҷTes$N�Eǉ��^�^�?s=hR'vEH9"���H��X�W���R%�m��yt��
���Ȃ4p������ġf_>˝���K&�I�*X��xL����.�s���Ea;ޕ&j0�� �Ft�:e%� �zp	~������Sgt98���xy@c�ԣ_�)�j�RxC���Q�:�,�.ܭ�3�YoK6t��S��[�~iA+��y;.4�ۇ����F4��h�ڈ0����a�I,"}fYzu���	b42 ��W�'mG��K��g�CN?�YH4�����'�^���ڮ�^E�8�qe
BF�Q�2b��g� &�����W��_-��ʵ˩�t5���`�j�M�)�pp-r�4n�����t� *��D �CF�S���Zۣ�)����m�޾bB{8�����)�n�2@�)��y��j1�37���!V7�-LgͰS3�	�)���x�Ќ͎&����;@B&]n���`�]���m1�8��L��B�S��DlJw����y���p��3�m(��8��g7w�z��46��ONMt@@�&�}�!]a7����=�v����88�[�M���z��I�(��bv!�/�R�D����n�Rl����(FH�_%V�M��":�Q��<��ͅL[~�>]�5����dN~�^h�RrN�\�H��R��f���G�>���z�����D���b��NZD{5���P�V��ͺj��<J^,9�	�3�|`+�c�,�=p�!1y=��|G.-EX�xEŅg�L�Wo7?��q�I���a�Ȋ��e�"��yL��D�L�A��@��G�<�3x�5����cj����O��G�=*�43������%-�<Q�K3���ٕ�a%_/=O��A�p9�Aw�M�\�M���."x�`�ޟ�8?{���I���� 	!"F��
�C�������{��)��X0�:!��K�$�!��H�(� W�^�������7�c;p[�R��;�����Sueͬ�!�.���ȥ��բ�a=�<��׵��q�7z��?N�(;�8�J+=��؅�1��{��1��P:��4�h��E6b�X*��?�w�3_�W�t+t�㯗��ժ	�#�B�>l�m��i饜�ݠ���*�"�,(�ouE/F��C
���{��!��E�H���N�.�nn�H�-�>@F��o�����$�����P�y��RfǞ�J0:��乮:��Ǹ��.W���c:�~�|��rٴ���?�X�Eë \�[J�O\��0��C��D|�ϫ��0b7X�(lv��@ڳ�[D"��!� ��-a�)ްX��:�eW�D�˼"!%�®07���9������V�BoJb�(X�RF��J�Tp��e1r��x�_Z���|cjt�n^5�=�q��0�Ǩ}b�G_���y{}.�,"��0#�����L�+�DS���V͑K���Ƒy�N�	t.��W�=J�/��ݭ�t[�k|H?�sp�W�ը{hf�zY��m�k,m��o�}��#��!��j �1�y���ݘ(��cE�g�uͻzd"��s��o ��ym�������~�l.(����=\�K��Y'V�A��"*Gv�x%�캈������%�xq8'������a��`���2K�1eJa�E΢<U;���a�t��0��5�sF�b��2�G"��]��P�|���os��}���+5\�Z�٪�c��4J8
K�޵�eY�C�I+��Q6�cC��)l؃F�0W����NOe�C�b.���ЩWHBsb����1ݹI�S��-؉Ĺ2ȗ��1$�\ò#~��9��ҳd�����Q 9�p����b�Y!�S+a����yǵ��C��~�U!GG�V�L�!���;pg���*�#��Z����v�h�vg&P��!�>U�SS�Sb����P�J6���l}Ug�*;V��	��>�	brVv��R�	=��f���A��⋤��t3�"_F���!{�.�mgV3����}��I8{��I!�O~�ՠ3���X/�����큸�7��ºu�[Չ�V�Q9�dl?a_��bj�b{��{S��� ���|%�ȱ���<�:�2S�C3a��MF�q(�>	�16�b��g�� �.��!d[��v����+�umcq���vU?�h��|H���6������ �xd>Y*����{��E�q�.�2�����bj�O��/����Ȯʴy��1��x�]+c`���    ����&�ZOӉ5�j��k�	���f[<�B$\A@]Ȧ�`��0ұmF�����2���R����~�X��X����Ŭ�Ѯ
U;�?l���q/�f�Z��e1��}N�4=��P�k1��K~¹��!��ȈS	OκN��#w�����`"���Q�8�?�$/��YXZ���$���E]�'������{A^�<׻N���D�i�������5��>���X���v;��CI�ז*!:�g佡�n����=�	'�X $"�rZ��#�-��H��f7`ī�k2�ο]�C��#us^f�����7׵�XU���"V�2�G��~��r"2�*���e�X����
�E?~�g�x}mN����uCs��ܕ���_]������j�d�2Z��8���-�Up��.W]Z�`��~�m�DG	�o��`���Z��ρ���{��� ��3>ǂRa�t0�)|�%�2�J�&��0����l3����~�T�4{yL#u�{�OCԦG@�0�S��OKɧ��A`�PC(�,L8R�S���3Lr�����ae�G��q��t�	�f@$���a=�u��ǟ�
��zfL��_n~�m�NG܋*�� ����Q!o~[��	�5��`e��B[�L/�%��z���J��]�p�ˎ/yX��tu�d���t����	!*�Ȥ��5;�>aK���b�/C��Y��%����jg\�u0vf1D�䠄\�	X���2g���{�6�"�џ�0�ZV�X�L�C�&�$=�&���
'z��"��d��A|xm��5�T�[Kl�x����B�R�=��]R��)/���]��k,�|<hz|����\��4����S�1�90?K�z��7u�C;,�����-�y��4���x��g��ud�����n����Es��;"q���csMI�}��a�r�x����!χ�l@��k\��El7.q�Ei�L���p�;�x��!s�*��\�fዶa"Z>�ˎU����"oܹs��#�Z���;H䋨Pi4�0�a�(���CO�H�ֲ�J\�{�X���pɏ0P��' ڸ���E�+}d�E="PX
9$7�à��r�1�[�4z 1?{�����-JO��w8�Ǘ��^��K�^��f�.���0m�˔�u���)7�>u`6�:�^�T���|\�?\Ҏ��,c�G�~y�����V�-�#!�oI�,;Ԉ�(�K�TJv��,}6��]fĉ�`H`w��llc[�M�~6��S�܏+���y���av�2t"iόy\�Y񹈀:��}��P���Ub}YY��,d}!.��5:p)&ϫ%r-�P�C���gv:k)4�)�%�xL�ؗW��y��]�ԙD�<5�$��+5(�bR����
�1��z����D��@�5$b*������6��ұ���#�(�=�o�!K8x�h���z��(��>c[	WQ1R�*�>�	����Pn������bօ�yO�����S8�q��(��m»=/�L<A�U���r�Ţ��/���ēV���?!���>ceP�SiiI4V@�ofg�}%��@��_��w�G�I{��/ڏ��b��AR]8�j�����NuXO���3�Xʮn��]��|���&��^��H�m�7���f~{�`+4>ו�
�1+�F��ZW�3�j�.�k�d�N�Q����˘����c�f�quyRT�뚥���x�6}{}w߬B|Ϝ�1�b�����k�e��}��_�?��<�`���''@�N|@Z���Zа�$X2[�I;"��ѥx�czlr#F�)�o ^����iq�<45�;"��T�k�׋)dl-F��Spħ�3d�e㋵ך��A�=1qp=����=i.GNpe����~4�H�����َϡ�/�5k̅�f�ڑ��һ� C�,���#�P4��TZ��^"������a���7�r�M��^KDTX�ݖ�˲x��yq�¤�+\������-��Ne��eCV22F��m>���:]��@ҥڣ�+���F�Va����j�j��`l����ԃ�4�4���/�w�.7�m��D1I�%������[Gˉ1��]�>TL�8�ѱĨ>�=Ps_��0)��G<�4iU���靸.�����}��k����<k~誉/P�xq�t.���MĔK�V����M(����T���ߖ�г�l��a���Q���c}���L5.7�0f[�[�[Z�nKD׺�b�F*��� p�����Truj$ܯ�R�ʰ��V_���9����n#l�T|F���wF�]:��t�U���+ۓ];'�Y�	D�:�O�aa̝��0c�ғ�O�55P��-�<�y9�O6�� g��Eʿ[ԟj����o��ꝡf̧��V���oP�h8��(o~��\���*C�Lr���/Mi�f����5Wp7�6�.�N�n���[ضF�%m�{�!��PB�z�1�Hl��6�%R^�T�3o��jǯ��z�^19*�M�#e^���X ��^x<+���Ϝ�;-�-��.��<��>��ѩ�9P1K>�H7A�;�.ۥg9�V�p��i[b���Ic���p�(�Rrz�v	�7��1-���=u7��[�mTꨳ-�T(�u��X�;h��8�Vb���L0<���g�	�ᛟ���'�~�[b�HO�AN;��5��b`Ɠ�b���� ݶ�[z�:��#��/~RI:
Rৢ6�g� .J�\@�DtT��!����:_p/.�܋C�����Y��^���oqȫ��)��g��c�?�LԠX��ka�o�鍲��̈@/I���t92q�L���+Z9 э�p˂��9�����|i�D
Y<���g��4��1({nU:�n�X�I�}�H��WTs4|"�m1�t�X�B?]�49%�j#�ƌ���B$��@ ��ɂX�%Ɋp����YOb+q?)O� D�z4���|��ͼ�������Ö��ҕ+�B�mi�O��*E��5���p����~���3k��i�f��W�S_`�&G��X5Y�qd�&#��I$�9��R�!���;��`A��	1g{���*;��W��!!��������yP]���u<�fe���񠀴៭[�(�.��u�F�O��3iT{*�c�2ho!����ӛjv�z"ێ� �øʨf����%lD��ާ ��ce[|�f�����d؆v��BӦzR�1�!dׂ�Z̭����� ���DG��}��>�7=I�bS����a�o~^@L�d�� �z4	:���&�ʼ�oo����?Κ�r�V���,��(M��	Ū���S�IQ��ݢj8��U��Ll�|:���+�1w��ǉ1��Ę����ȝ!y�2(��V���
3�6E �C���	f�����_:���#���>
����9}j{��l����n���8�O��έ����H�kk[�<�5�2�C"w䀬YyJ��}�܌$bmg(|��,I(�&B�
�evt����>v�Ȳ�8�-�¥�p�rjF)����I��7T$Ejg����:�(��U�� �Q�]�,ѱ<���(�|@O/��U�/{�ɱ���:���-�y�{�goЛ!���Lk��aDn��"��� :6�Z,��DH�.�<�A���J.�g���G%�y�I.���_ͮ�v+���'�]�Sc�Mz�����N�_+7��kzֿ�~���{����{���AZR���q�z_�Q��q���b�����#����޼ne^�pWE�	嬓��f�^[)p�iy^)���,h�� �V�Ƀ��]��0�`(�D��/�Q�^3F��`�فFN�7��~����g��G	��v����Fi����: R�L�1��K�cr-��2��E�rk��+-�`d�Ǹ�¢]�������:��C�e�5��킮�	��x����.���y�h}BB�j�)у���8��j0�o׷��nۺ�r������8̍�lL�
��S7n�)�-��jM�P�+�L��l��y�����(a<��6���D    �	~�v�tD�C�h�𗨗�J��d���^Yy*�3s�E�N�Õ1(D�RIX�*�����#���^�|���'�N��Tw|�v��\}K�������s�&ƽ��L�T��G���^&b�l���;P3�'�,��#AGOv=Dv=�/��*s�V�Y�a�\�(�\�b�+�<_9	���Ϧ$	y��rN˿����K����3:������Q��Vq�O�6��c��F�X)\�o�YQ����������Q�O8MaV���mk�������Z^�k��|�������V�kn�#�u�
l��"4�3�%��J��d���*:����[Z靡f��t��q�'�>k�YĂ
��ٖ7�f�X���S�'  �Baف��Y,\�5,R�<`Xy���5��1�P�m0�{��-�3�R���B�ȑ�(쀰��ꇴ��i�R6a��+��7.��V�_"ԛ
��<�`Hr�k�����x�*���.�"Sߘ�1/3�aI��,�)�D���٭��G95�6B�ی�Z>�� ��h��o���
VO�L�w�4�q}��%y�\�|E`����}u=ܰ;N�󫆃�7������x�$x��U��ln��v�@���yE"O����)��A���d|�
�ܲ'��%y�a���_o~yh<c"�H@�l��j��ΧF��%ۡ�+=�T�ʨ��?����Ȳ�ſW�%R<W�5*dA��M����t�ţ�U�)�f�i)-~��Q��n��`��WW���ku�m�8���<-~�]���=���5���ڍ�����'}u��1����]5���?Y���Vw�]2����Č�C�����=�H�g׊%�~�[Mi����Պ����㫤��X�3l��(�)��n�!休��x�ξ^�`ėP�2,g��&�m�n��G�$�fva�_�r� c߇5R�8�J:Q����$���v�,�d'����k`�\�����R�t����.��"(�G����f��B8��Ǖ]p}2<Kt�ǃq�z��E^��+�9~f��Ba+����FׇXy�$�:�۝t ��1��"?Rg��@X;U��v���>�=�lR\��za�P����NQiQ�2�~i͎g��_y�'�=�n!���jLr̐|��$5�:�/��f�6I�Ɂ(TY���	���E��\>��$|�@��x{���'g�Kxf�f�:0�����5�w]+A�0g�����S�u�F�N7��bg��!�^���L������gfY�y��cﴝ��.���<J@f��)��ğ���Af|E�)/X
a�0� Y��������t*��ϐgҜNͳ�1X��y��H�O�!0t�c7�Gi��B�%�
�G�f<2(���_�x.�ЦT��,��k3���P���ti�Պ �$.�!.Ǐ����.�Ŭ�=|�݂��~��^��� �8)P9;b����B�L�F�HgM��Mv�U۠�x�<����2*�,^6�w�=;� ��d����$��/'�+�3ѧ�������t3�-M$�k�'t�xֱFv�9�6i��#�Pt>��/e�IʷC�籸i!��V�(*SƷ�@�7�8;��(�(*qp�?������ދ|������gO���1�/O
�I��� ��/Q��c8�Hd�JZ�?��Gɧ_"OAm"�p���R��������.��d���k��<Lftg�H�����4��Qi3�]����||�K�߶�q�%�w�K.[d �YZ��G.���|�f��M8�#�Ξ���`�gW��\��͞O�=@���:c�q�V���DI�|���F�����k!�Z��wՃ-��G���:P�(�=�n��#;*��.��ih̝�6�[&�R��Wx>������!؀���K����q�	��I<��Z�qfM�E݉���D�?�G/1+����S'>�F?A��֪\����ӄ��\���*⺑3��iL1P~�0�د(�}�*��ѾmnA�%�;$G�ԑ�#���,��"Ռu�n�G�D�DDFH�nbl������� {r��Hӂ'紀}Bl�P� ���zH��g9�g�)p��Ǌ��L2�24�YT�F�Np]TW��	���|��Z$�ҡ'v��4�����\Y��Qn�QГbʾd٦e�����R}pw��r�ý��t� Bg�[s>/^����>��Ģ��5է��^/��pGa��:"(TG/װR*ꐪҁ��J�S�3)�d������N΄�(!!�ة4�1�E�h��HX��6����R�I�C0l��/-t�z��B$�O����h{�y
xҚA��M�Fg9O�~E�Z<�y��P�Ʒ���c��L�Px���u��a�i��ǣ��]~:A��Ǻ�kq�Yc9� �l�5�^/�w���e�2;��������ΐ�&��x@`D�3K��3�,:J=at�A6���I:m���d�	cʮk�KO�{��\��{�n����g'���7`D�G4O�����	3l�n�x�+m_ή��=������R�.�۽���W�͂Sh���o�i���m!��$>��qL�ł����oK(߲����?m��q<q8ٕa�Ϋ�]LP3�&����;qX�eR�S"���H�{�tƬ���C�m/B6a��ц'&�E�! ��G�f�)��S�~�҄������7Lv@�r���!�%u�0���\X�㗇��f$g*����I�eMY�GGa�CX���j��~�)��I�#4�ﭚ.r����\�>e[r�qTH�V�_	�O�t�j��ɶ#�$��#\,&�:�GZ������+S���1�;!��b����+9�c���P�:!��f`5(�l�1I;�q��5��"�ER%4R"{%��a|7�������������NI�pN�pؗ��C"K[Q��C�Y:� ��Q΄���X�`�eT4��꺷Ϯ./���a}Q����)\yJ��e�c� �w�|��W�?���J}ٯp��{E�td�<3��)�z�Ȟ�g�:��Z"��LÝ�E�Y�V8���;�6���KT�� ��>*K��2��Tݷ�Z��H�x#c�h�G�#��&��2��N$�ň�%э3S��s��b+��ݶ:NF;RytT;T�G&]X��}�O���xQF�-�%�����ѩG�]�w�^ܶ�x�����'K�i%�>�R$�Q�$�L��-��1-˘��MB@D|J�C��r[����=�[��Uul��Pr��̃�J�%y)��#
ӆ*X�(sLex�l�	�4���Y:x���ق��$�����|��Ђ�t{Ă4�M���C��t\��p�y��w���_!uC�3D����0��7�O����\�I�m�@��li��ub�D��Ic^��NS�)6�j�͍߉�Mg1����Px�'��wU�S�7��
]eˊR9�����h��'%��o~Ƒ^V�[���[
8��HQ��7�]ߥ��IrJv�e��Kl��/��pO�����e��6���ċ�2��+���	R8d�������m�;>R�+o����P�DQ��)���!�$��
%Gb�9{S5�o`�V?"��kp,��m�G ����uJ�Z1��7am���y��҄!u��U���q�A�o4�w�Zh�8�X��@FC�ŸP�x�Q(S�l��(p�( �c��0�oa��_��#���>��"z�D�_���p$V�l���}"��HGwd��]��2�u,Wz�a�K��aF��J�`��1w�#SuP0p�M�ig�;�@�)'<�
�,G<��O��FH�����B1�������XhVj�l�4~�z��b��D�2�͉�I)�B��5���Y�K-���#E8u��u�i>��<�fs�	�7ęy�r��cV~��_A�&����j4�&��[*�mi�S�>,^63�����4�<ZC�i-w�k�%�ȦD��3�+e����:�x��;m2mC�e���ySv���t�B��L�'LB�l'lg���2�F���'�~��=�z���3�6)��    �u��fƆc[o�����*�i$�c��3Bs��}��K��O1K�F�;;��Ȱ*�᱘	�Z*��ܣ�[�VtZ
�����+q3v����e�U3@.�`�œ�OPA�v1�8�E�B�K�r���`|.�<Up;) n�0z�_������6�+�:�����\{�|��򆪑+C����Ԯ^�H��D���s���ǈ��ICbf�CM�<���x~�\X�e��\쭛G�bK�"%w�]c�|��w�$|P�B�G�.I���N]�M����9	__vl��TT�L���+��Q��A��L���D�{X��myK����ԲS4�Rcb�B�#��Fv��� a%�-��&�[�9oJ->��x�Gؾ�XG:�Z�e7q�qp��C��M����z`PA���~3;G���P7����r%P�D�(ƽ���R�5ЙZ�攨���Q�"�n�1�|��P͛�cV��W}̶��n�4�R�����H��V��Ճ��K���(d��N>�l5C{sm��G�&4�h4J#�DB��E q$��E�1�֋V)P	s�]��R9��e����,�qKMa��������M�8Z,�V����6aەS-�H0c_{z#�G���8#G)���lsm�%����|۸��K��Pi�>�n!��W�`��r������9t<v�B���,�U�М��I3yV]-� ���ۄb��GpnЭ��nnH,VF����\W��?����6RDfe�u ��J!#a���%Vd�H���s�I��	�˕�P��ni	M�=����Ì��r�s�����h0d\�㫐]�~3yS�H����9�9��-�����D7��6��H��������uBgN���J�A���j@B"�i|�n0�q[]�a��*��w�(�jX0s�6�F4�n2�&�ʺ���	�f��'���K�;򧲟@xE�㶐�ǵ�� �kwM�oy�z:MEy ��!���.��w�W��I3��C1w׀�����H{�F����NP�_G�b},�SdL�W%-����c��]�ڶVw�4���¨���j�	OЉ�S*Y��DJ
���Tg��l� �H_X�Zԛm�xN�G������?���9V}uZ�z_T�$�,.6?���K��w���AqR_��>���������RiX�u���ak��h�Qw���x��r��.��1�Iy�t�/���݅���۹#�Zm~� ��2X�r�<�F�n�V'kߡ��V���>1;�B�QJ9g.�Γ&����[��°�2���D>1��?/�&0�r���۶+�Vh�a�r�]拰����.=��f�wn����TQ�e>��4���JT�bi6�$�e��͉���Y;��L�O�՘7X|�EiF�dM����l]h��$�I{���IE߅�JG����. HnCX����DUNn��OM�Y��`4i�Nb9|���긪A����\�¢�V�\!\|�mj�.�ڨ�]�&Xh:�TzH���8���!�x�����b�=̴jg��<|�+�<�zy�^����Bo�.�_(�:�wR��y|T;�K��0;}��& X_JŐ&�Nx�CJ�:��J�bN��/�E/��U�-�s�b�\c_�r�riӴ���x��8)2uxdU0Ay�	����� �����T2n8
����q!6�w�ڷȮJX�k�cl�����l:��U�X��?��3?�Eť��06>�~l�+�v�xI�w�/Y.X!�'�!���S2�R@o���T�Nv��9uEi�bZ��P'�O)�+�Ru4c���6�]uq�;=sQ�yx�C�"|L~ͻH$r�'M�Za)�%v�Z#�AK�d
Ǹ�.9B-�2�8�A&���T�m߃��]��W��)��������f�Mĺ����� �������-���G�0N��-8�K��|� #V'R���;�;.�էzQ�Em��+�Vޣ��J5����7ْ�8�������;��f�MF�B@H�Bf��E�3pE�p��]��W���E�}��E.;^����;��{�T%%	�p�vm��o�Qc��yū��)�E�����~���c�\\�L]��0����%tf}�.4�S�թK��v���e�2�idT!z<,C�W�f���Ǩ	1l�YIs�ҁ}������bמ�;=y����}��yx�l�z��f�4��(i8! â$��Һ����kjٝ�G�] ~�ǷG+�_~�!�5o��l�N��j0}x.ab��X0t�bA2�#'�WkH���"����qa�\#�&@lxUF������S5H��
��U��v�qXg.m�|��Mݑ�[�^�$�+<V��D�Eh��9g*R�};�F���G��4���L6֟�vpZ|�aY�]]�̙l�b�S'��B��L-�ᧇ����46��i�|S_�.��aۮsatX��j:���_�:ϛ���u��&�i�,	֓�@#M��M���K��tX�#��WڵM2F#�M4U	UL��C���65)�'�a�u��փ��1�Z�cY�����A��S��/#�%�����c��K�4���Y�wͼz?'Ň�^=:wqI�=��Z�!؈$I҈�ibpX>\$-ق�Up%M�\�Wsi�M+���`���lտ�8 �e��\:��w�gxsB7�6�f����p3��R��+��$Wp�m�k���!�J���-��ϲ�EG���f��VV��Ҳ���)0�\K���ۊ�R�s�ߺ��,H8Q�r�����f�}hQ�e��`��Z0��-�t����Vr��c~v�_S�w�;_�E��$P�	�uM�5Ƅ����y�����U}ٝ2O�jm���z�!���2�$���s	��+l���oD�
�؜%=�?E�x���(_&d��:��Nф�'<Zt���AB�:�7��Rf�pa�0$�,J� �g$�<���+���с����٩�32j����
b���M��\Ø:I�-�ߐ�������O	�6�x�m������v�}X�j?vx�M��xl�p}�*��T�E*��"��r�mT��ϋ��eA?�d,�|�����o�f3$�HC+�G���x���8�����`)���p��:��Bv��o��&��t����U��Κ=6^P�n�DrrjCO�t@�e?�N�;��� ����yFF+��8A��b��4�-�����MYd�Z���]TV(��Z|o��ξ��uk����|��\�8�R	��Pϛ��eh�upzAƻ��҃�vR������b.�q7U���6���G���:x
���?kf�.�W���讻�n���㵃Ic��1m���#�kA˛�Cx��)���Ej�C(yrݘ!?(�mSCQ6�{J�"J3!��L�l�U@�G�@����lJlá�]��Xʁ�`�=�yf����[��f@3u2bD��~������8�┰lJ�����
�Tr���_�z]��J){�³(J�ς/:�zJ���w�'d<Om}��-ꊳ1���n�wѥ���v�=������ݤ5�Z]�t-@Q�ϳ�?��~7�T4��{��TBd����~}�]gt��� �ȉ�!�Չ�����>�Z�2pB=D"DF��d|v���Ts^�"�V�!<b=�z�|71(��4�?1D�S�o�3��uh6��DG���I�٤�\;U������@���.�ˤ[�O���|�f���[�8�z�!J���
��8QD)y����K�f��6ikO�@O��w�g�ٶ�U�Q 5M�v�/�u��P��+R
�Ns�J�X #ؕd�����3����1��V��>g!�.Ń���������/���e������&y��\�����2���>�R��"�PE�!�0�:�k�������a�*?�]Y�e�1?�f>]}j�8��D��X��$�2�қ�ޣ�f���յ}}��陊}��mBa�6tlPV�ɰ��5ڡ�)݅W8��4Sf�N�]��<�}s�vVe�Ko(    'b�y����O�"+T�xb��tg�%�9j:�]����E/�����SO65'4�	\;��@���eڳn�Ź�����{��������G�L�h0~�T�]�l�V��O�Y^�l���X�C��Kx����~��������j8'&�6x��É������W�i�+S9�1@�L�cO����g�l�ۥOF'-1w���;���#�*\D���Z�����d��m��΄K~���)z�����mۭ.���;����n�����~��Y�MD&Z+p�+6�v��N5��i�:#��Wh���.W6�1�p �w�Ͼm?��g�_v�����M3}��j9a����n��ro�u�2_���ЈaG=�i�ߙ�$b���(M�e	�GPnm�"����(��R�Ds���(��nZ��ٗ\�ُU�s��DI�"Q2��ӘìI�(���z(�U�p_j���\���sa{b��t�]�X��i��0�E;H�sP�&~��g~�D��A_XC=�-��c�fI�°*�al�I"a���ih/M�H����G�Q�_�1�� ���n�i��ǐ���4� |X��t����R�^m̜Sy# ��uW��8�KP+5$/���p���T6g�tˋO<]p	R�b+sV��Z|f���]޵?��������@Q�kWN`�"��go�~9���Ō
9{���"6z����A�v�A��P��&d�!ϲ��7��!!q)u��Rt����0R׮צw f�4����a�ج?��3Y�����z\?fÝe�z[�!=Mp�|f�Ӂ��d��3}���>�i�n$�5HN�#y�َ�8�2�!\���l������P��N��y��P*C~O)-���U��&�C�\Ze�߃�y�5��|�^�ny�`@���29%��s�r3�hF [0�\������.6�Pd���3n�4�x(߃.I� �//�� �� [���+�i�N��b�o 	�~�<���9B��db����
� ��m�|$�G<D��b����HV/q��D���{��25-l{��9�@?�oq]��e-ߖ}��a���4��@����\���_m�F��@z̘B�'�r�y/�tR�w.jMY7��N��BD�k����A�V�tk"�6��� ��DY��
�k/{p��ɏ�~X����z���c�RY�G挆�A֛��Msl��Ek7ʴ��G�b�3������ni�LL^5��a�I4\�IC�;�n�u�m��=��}�j�z���v���׏uKC$�7�mK�cD���$I�!_�}���ڇ}��*�9��Ҹ�g��`���T-�\��*sn������v��
ޏە�*c��y�(��������D�kf3�	�"I����	P��_����|�@oŠ�G��q>e�¯��#�RaD�օ����G�ld<�hپ�OQM�k�Ù<�J�YX�d}����tEˣ *������,�F���:���0�KZ�����{�����na���Xj���B��;Tp� vE�'t�s���M���4u�*�W(Ԉ�,��7�/�7�Y�M�tD���_�\�2�޿U�P6��Fk����i��+5�h:W�'8����3T���^��,p;����B�h�Vbr:a4v0=d` �Z�&7Y�:J,�_Q�^3i:s���2�����;���|�I���R�Ob�%9;)�Kz�p��'Wʫ��#^7���}�t��0sNu���,�m�Y�@=��A�>�=X#������@z��h���|��v���0m���8+ԙmg���f��R�w����n���bv7Q�Fӂ�Q��ǻ^A,��`�Y��������B��]�!^o�uI��jx��7���[n[,��������ɝHM����U����E�'�%��I�l���#�����,j(���pk���U+g?�����H�:"�
���s�4�J.��%ͷA�Q�J�9�eD&�,������Y�V�6�4��Ŕ�p��f��;䜟��I�8v�Btڰϳ���&t�:���.�����{r�"�+"
�o
K��.Qy\�?nr3zs���[x�%�b��q�� �B��\d�O��~u��\�eӜ��]���fRթ�2�1�U~_����XY���&AIDN�l�@U��F8�i�2(�Ep|�P��Gn���"S6�͜
S9�Tz �����$
��#:j�ˁ�$���A��x�
R��N��3]Ói��� ���H(�yR��-�*�V�S�,�s�D� �� UO�����^;<�?n��㰊nτ��AnY4����C���C�iT/~z��z7��Q�?������̗s�& ���F�`�L�~�?fX���h-�"���r�G(
j?G���,��^�\��`;���&̀���l߯��Ε�ڏ�ˢ�f������?n�|6�?�[��Y�Vp������}ޥ�#Y��i,�g��s�~�����q�Q����ڣdN�*�y�d�����-�ks"�+��-`A��M�M� ��G1P��֐t�1y����gώ�z��W9�Y��P��6��6gO�x��	^-TČ.�*3���i��Ǫ/I��=%�5�*���,��uZzx��j�p��~Y��wX����x�;�ނ3XB����k�fRCh�_6���d���>�W�~%;:����#9 ��(��<���G�yL�|L���SJ˝y�1��#��8$^i����!A���+�i��3b��c�7j���Q��r{��f�`�]��q�ĝ4�5���{�|%M�89��oz`_۩rA��Êv�������j츐���Y�"Z��ڄ*8$N��.|�o�z�
$����¶p!�h`��E���ɾ���8O��o	ɣ�0ko @���W���	�}͝�0�<���(2'�I����fY�}��?�������ۑfD/[��zfJ��5!_�c�Ԙ��ZXB߮�֛vgw�[��1�`�¹��7�Y��5�_��,0�G�u�����_5ݝj�Y����O��8iW
�(*e1cyӾ�p$�k�ḭ���c"z�l�3��l*�L}9&�M�[�Kb��I������v��������o	�7i�p>�<����>B�^.}&M���'SdT��v�m���-��<���џ�+�R��f=վ[.8X��_X�%���!�M�ʘTzm�6	�fY�>yq��mW+��uf��'\��>zV���c�� ���Q4)��XzsxA�9E_֓�3ɿL��2h45���P�ŵ�Cq�E���ǃ�<���2�o6�RA���;����S�������g� �n/������-���s��7$Qe��Q�31QH������.�������3��N�����vؘ�����-d����(�IO���(�`tnp=,Z���Q&�BK��A�I�Γ���+RV��
��m��"�:�hC�rm̳��>����/X*��������h
?ϲjU�.x)�0��]!@��
CT���1�G���k�]��n/�{����U�4�xnx�Z�h���┴W�9;)Gp@m���̻n�������>YM�r[J%P������������e�jn�������x	���l��1ڴrb�����s�6dhF��5�3�!��bj�~Q�~����k�7�'���L}�UgI4���-�S��J5�j"S�,!�B�	[n���q�:���ed�3X�z���E����H���pV�G	�h&�����[��Hj�Q��j�#DS9������
wiD#�~5UC���MӋ��F��ƽ(=�'�E|����$ tM�1=��u޼�'e�c�����F�����*e,O1$�cl�i���\u�Ќ-��`�����l�My�a�
�=��13.n�R���؋S�p��!��ۚ^�7��z�VK͐xѹ�YeRq W�P���tB�I�GrBx�>_;{G��]͚��B��l����i,���!Ct���/��n��/b��4Ն�X~&~@�������M�R���x�f?�qq��    ����uܳ�hڣV��U>�3BjR�\7~Fڪ�K8�V�>�\��j�]x̤,D�i���h�H�5%͔4����*���<C$̐�c�_B�{g��qMߴ��@��J^�j񧄞z9Ed���u�?�e㴦��zBƺ�g�i���˷�R���gB>��FEr�o��#p+C�%��"�lJ<�������fx�-�Y��D$��|h77��箇nЊُ���y���X�ߛ�;X3����κ���0L5d�6y9�E�%������H@�mf^ڦ��G�+���7�DL*��� g����1��r�Ս'pZ��iMn�<�f��XaM���Ez���8�@}��iK�3����+8t����{��}�詌���P��e1p%�y��R/�����[H�`���e�M"}H���B�$�9m�ј��!�|�����X;�g�yF��ݸp5D�y8F�t 9�����8:�����b��샸���ru,�v��F�ɥ<��El�������Sy_>���@�s`���ǳλ�Tu�>2I�9�v	.�,u|s�'���%f�?�� -c%�2ۙ�G�R#��U�\�,ij��4_&�p�ٓ5�݈� �m���Q��ȍZ�l������D^��?C�Bx��d64�	�t�xQ�i>,~6���	���p��i�HO�Sn�{Ʉ��k���l��`����y�P=jB��@@/IS7ə�ܒ>�W�=��=>u���:���4T����X�=-��(��&f��O���aE����4;�f߶��ɤ����:�
Z(N�'���b��`�>(���k��HρVʊ����	�uTM�:D��-X�2��*��܈��ȔA��c�k�9�=,�Z�bG�2�3ώE$D�I
 r5v+�Y��2M˿�Wh�p7�������~���=߫���K�3�X:L�z!��S�����	i��t֠�)�M��2��v�v>�4�f`�]�;e����<ö&x�v��X<�����&z�N���I3,N�$4�츤�3ZlD�o=�2��r gź��,�J��c�r��ę뚡� t�^���#F����
O���39Uc�������D��E�PldPH��4�b�������>��/���g��A�<Ł,�礲,EW�ĜTѥ�!V%���L�p�?�����1��r��%��5�jg�����k�a����ݶxz�9�01�����痟��-j��&o��"�Y(nl7����}�~�1�Cŝ��Տ�v��]u?��}ό��Q�f���sn]i2�#����4�����dl[��.�㦉�p@�Ů��W
����lhPV�i���)g`��}���<��[4��P�;�L�3E�PS:�C��ڻ�ٌ���£5������hf?60�����\uۭ��L�|?B@扷Ji9fǛe?�,n�$7#�jWN��A�ihlΌd���q��@v{\ p1Y��n�f~_3w��������&!�$�8��PĘ��N6���@�9طh�b���\��Z7?���q��$;ش"W��Ҏ��\*�h�|Xg�secbKM��H���~z��p�=_���Gka�/\AY�[D�H��O?ET!\���
�����F{�}����~:��8��`��ma��`��(�][���b�^}X[W�?nvpY�{@JD�˹PNH�Q|��q���嶆�
�R,�QښLR������n���֟���n%�I���-�_`4<�!]�5����� I�4#�O�L�d9�Y�%�(��S���z�y#��`�4�i췷8�g&��T�"e��X�e����7�#�,3�'���K���Ъ()�Mӽ�����)w��hh�I�sỏ���;/[�c^j(�(�xz>8���|���s�oDŴo�\c�6�{�����iBb��PU�Ǭ:��!ƥ�^��d��_��P�z�=�����oÄ��M�)�po-�rC;B'��H���%���I�gL�}q���:'UU*B"�A�qP���JO�B�$|My^����Q�s��),��(d'n<�QW�K�G
 ��X���ϘcD�kDB��H��r�����aP��ܐ��^�,�����ș��K�(�hߓ6zZ+�ҟ��xP��iw!�k~�[38�?@�a��v{��Pvbu�۫N۷M���o��t_|��㝍�sf�0��b�6��~�]�J�!y�{���c����/A��S��<��ay;�Ot{�����z���ͧ�G8��^>����n�H�+�a�}}��B��hsy�CH�g���u�x���:��C����V���s�׎���_��Y�$�<�׮�s@��`V�����E��؇��G��3LR~�_���K[:k]e�[�����z���w|YTS$=�笔�/b4}#0�@��#re����Y��f�~��󫝖���R�a$)�{|4Y��-�ֲ�i�!�P���(w*ش%�t���D֙�A��	$�sR�4�`.�/���<�P�ԬH�/%&ئ�`ǹ��&�MN34��~��'M9Ҙ9G�����"����&��;+,7j��i_�o�(���sT9hHr��%@�l���Ԯ�,ap�0�{�`v5J�<uY��M�N4�˕J��|�2m ������������,����{tړ���W��?�k�MZ�e��}��
wu�U���1��g���
Eؒ�ё|	����.��L�ezh$��A猏���ϐ5� g�q�� �ǹ�m7������ߨ�2���5�XA��AB���_�5'2���o��O}P��к��Cd�����˭��n�Jl�X�l--B��j՝�$5��W����'l֐���2���[�9\^�=q1�)H���`��%Dqw���`�#��媴��;Q-uy�'���,��.`ӧ<7�� �� �%64z�r�F�l Q�I�iɒ�ۛ=\�#�H�fv1��`J/P%�>b4B)�V� Bd��/��P�p��n�����^���+߀��9B�-]h�n�a�z��N���sJ����"��2�X�R2a�ܣ��-N���� �ܓn}�m�`�7);��Ԋ啕pj������v��&n��T��i/��3�
��μ�K�6�������o	|��-��)4��⤓o�A4zA	��V*&����x��&�"!a���=��^�?�<3-�&o�[�d
��9�Pz0�~�CK�'ˏ��Dj>�_��x���^�K]%w�D:�un=�^�R�붻�ߥﵣ`Z����W�`�(�L@���R!c$i2g;�:�8�2y�/���0�!������'^�#����kv����ƅ �����.G�mzӏc�6s��9*y8��E6��8�5C�cnGIb�O蹡�2c�7c)*�Hw7Aޏ�y:x0��͑���Lshi%�AK�m�c��蹚"G�9ZTћ���������-kejﲊ8L�v�}�t�L��uV)�X.q+g�v��D��0d�^_A��$\d�J�/T�k��Z���u�z�h�(�4�k^��W��Z:2����Ya���~zt��<�7��2CS3�k�9��������܆uc=��g�׍Ij�F�Vo����?����XN�.8���9m���D���r�$��쑿H�2欌�����=�= SI��l����<V5�qA�ވ�
`�<���ڏMIVMs�AA�7�Ky�E��4pH{P>j?-�?W���MX�^9.���T�3����-7C��z�g ��7�'�� Bk�aV74���av��=�2�摶�$qKP$G�!o+pt�MH+x�^���U�j�w�O����'�O"k�+L��Q`<3��uM=����墤 ���=����M#��)���rJ�C\�]��PB`R0N�=E|8�����<9{B��m�R!�p�	=˱� �P�!^լzG�y_	��ݜrk��p
,�To�vW֫x��j�xi���!�w�a?�T�#e���M����4t���:k�����D���՘�|�l�P`�YE�J    ��?5�	�V��gyÎW���qf�g���:��L!�z��q|0�
����H,��E4=:%1�)��7�nāTzr���D����c8���1/��k��/K:��dva<_�+8�X,�<�����f{>��j̄���*Rv����'�H���L�\@��JăTB:��|8I�"��p��6�ng�~����4��x�/U�L^�Mf���#q'd�[j�G��,���a�<��}�	Ű��v��+Hʐ"M���O���(,5S]/()��| 9%�{�ǮHZL���3X��H�[�C�
�9|�]��K�1bS��Wq���}{�~�Er�*��%�0|1QP���`_%Kt��2��x����(k��+���V�=���"� i�l����=b��a�[�ַ˽ߧ�ʤ�9M�IT&Q򶈞�;-��O���xM��D�3�"�
�_`X������У����\� K�M�Uw�:����6���H��.�u�sW5��@�s����~&�� ���`c[_��� i h���%}�0��`���Y�v�_���:��Ե ��1�H4�yp ��ƲTt���ۅ�]��la�F/���!jH���xy�fP_(��93
�AT��@:���7��lt��E�����2r'�����4��L��(���R�4��|Ԉ|٭Lz����8"������l��P4�K<�I�� �z�~עA�`:���A�h I��A�@��R	�q"Q�\��8�xN��л�j�9;��<�����iN��0G��_"����M6�'�VIBy@zM$�������4��)X���Q�*��9���1��G���(��Ŏ�s]_��Ժ��[R��}��p�k���5��	1C��v1��M�C�ē��ӭkXniu��ȊSb���n��@�m���[6Јuטv|ɓ���-3��E�:g羯Q�^wx˺A��@��j��%*�oZ6�$YZ���	ǴEn��|6�HV���A}��|^th��K�G��I���
Ϗ�	���	L��j�]�I�>
~˵]�&��22�U��6}�_uX5]�6\\��e�Fm��n^�QA9��p�n�ܻ�
�-rx�҇ �� �X� �T	�~�	`���N1י&z�`۰,?/4�B��ig	�'�W\.��1���e�s�-�	��旫.���H���R��F��E�e�T�>@���E�|��L�����yF��R�F�E�o�:{�߻�e��e�9��	_���VM��ZC�h��QD��:���7�()���k^��=��=��z�T�D�9�v�o ��üvw��?����]ݶ'��X��>�����b��)�!����5�Us`{��Z&��b�����ε0�æUDo~�����i��T,BA���s��ܺ38�o��*�,9��Dخ�6�O��"i�N#�JCR:������3H��/�9+1�[��c��֤���[��x�h�g:V���P��գi� �x���|�æ�����XP�"}t���Z`3D�MI0'E;k����u��{�Yq�L6C�����o7X��X����9�'Ca���ڭGYIlS��eB�J��R�0Y1���]j4�~�=(�e�b#�x������)��lz��be�ϡ�E�T�p�����;s�_"D��r:�G�g9B�Ć:��{s�4� ����/���g�ak��JZ�3@���ص5,�Jr���3^���c��Q<A`�J��~�Ո��q�L$���J5&h� ��Z���<|u��5�w6_������=��C�F�p�+�h��m$�S �(%Me#�F,�"k�e�uF��~�Lw��!��@�J�>H�s�()�i%�$����|B���N@�ϗ�$z�d��NH�҉��W��5R�6��8WLg�'Ra9қ��L�9��;�<"C��H��PiGO��)�B���Y�#�Y}��f}u�˝+���o?���:��9�G��	�p0�C�(/��g}XK>����F���b�t~�2��l�ւ��'
�Q�*�����yҫܹ(7Ax4��kx�X{_l\�j���jnYyj���g8�7�\Ry���������C�s�"ͱ6Sui��b/�l�5�a������{�LH�$��By�޶����=Z�Q�,��V��"W���0�N��a��e\��$�/��/:H?�Խ�S�]?��KGf_b\.߯��.\���V�Z߾�M�Y����\I�e�I�
ı�gU���{��<��=߷���LO ����wU�L�M�ꊱ�P1Z
.��,�&Ђδ��;��&?�E���CVE@b�5o*�@M��KO�U��^��qR�"��Q{=�_ue���5�e.�wY�5��hG$��p�ڷ.�>V@��,3W���oՈ/�fqnX���س\�Ԝɨ[��q�|�J�XY&�(x�`dV�p�H���D��Tp�̝PZ� 3f�U� �Q�.Ez|qʘ���B��zL�+�)�)�:că_�Z�%�*��2bpDJRX�hC`��;����jw&a�»'��KN~ �9M\��H�
 M��c�nb|820�;ѕ.p�I��f��T{ʬ�X���L��Ү��I�$��sQ��򉢭!���ƥ�nl�ڣ`�v��7���ϣ�ds-x���C,�oQw���v����;��{,]4f�M�g:8��f:";�Eja����\�2}�{ɂ,�*����O��'���c�;6m	_zqmq/�{kc���`P��T��dN�����O9j�����*���i0>�¥�@@\�?$���R�	��| ���;E�Զ);�Z���(�9��]ʥ{�Xs�!~{���s�Lq�����?A�����lj����ɠ����%�hMxS�ϑ�$U2��C�R�|��EW��s��97E�yyNc�(Ev��=3u���}��k	�Ƀ����d�\�)o5^6��%�"�D^v����D3n����z��cd�O�s�ӹ8��Y�o,�����s{��?���$�1�t�9�`#b-id�jjd��n����4��A��Y��$�Ġ+�T�D���R�����5�vm*�D�������ئC���c!�z﭂�#�z�Vl����`d
�&ŵ�/o�Ʈ6l��
.��W������C���k���`َ��p�g2=�|��̊�p��__��ǐ�F��-�[8��a�`7�"��|�����P1�U�m<�U/̡)��H^:��йID������°A�@ 	��6�4M�`C�BQ��	��`3�$-��T��#9C[�pߧ���[�l���f�����Q�<y��38n!Xx�צ &��|i�D���߶k��X7Q8�n�2��Έ�X��	2{��pI��@�h�P�JpƕW�,��M���[&�(����0��+��'��<��æ1�o�q�A�� �P�-xWT���>�=�1���아�� ��ٗ�
Y�
�GiS�������X���Ơ��o�m��΃��	TAho����'�;#�9�zwn1.Jby�~N�_D�&���p3HL�U ���[�����ӪM��K��,Fr���G�3LF���R9��Ʉ�{���.���M�9o��7�#�9��M�L�=�߽{/k]�����ۛ�
"ECm�A�߰B�&�
��;���W�����_n?t���ls�Θ&��ɫ� ����k�J���r?�"�\fC~ofa;�=T/�IJ4LI�-����X������B2gd�/������~��yo�>���9�]�t<���
���U°2.&�ܭ|�T֩�gT���C�9
��@�b:���3��~����;k����O�s �JK��I5yG��>gnz)���`E���j��Ժ��CF���m�������ڜ���'!Z&���w�����h;t9��u��E�/xD��G�=�~��V���|I��O��(x��Ô��<�p��(@���!�2M�A|����٫��~3���[�yJ�v��f[U�����I�3-�]�d�2�y߹�JF24/�eI	9    ��B��c��,�4�Y���{\��1/U�>�l���S VsѲP�8��~z9)Î��X��*$����:L��Bj��*��W&M�ICɡ-*,ߵ��rr��P*�_����q�~���)�R���43�^1�.�jw������[�xC!�}N)���g��L�,f6~X�נ�k��-�ാ>�ޙ0��\�T���m�S��9-�-\Nl9�q�$��ۘ�-j?v�&î�~��2�
rC��(HTܻV(׆ɉ/neMK��/�qw��"����9"���8�̍�d��Yj��Q��31�ρ������� a�����*��Wsb���h��r`�)��hiq�>TB`�������\�W�;ie��1����tS۔��q"�|�������g�\Ғ3�� �c��<���^�b��{�On�ܠ�``�¿3����~��[aU�ɡx*��Q�2��EV��E�`h����x��[���(��K�xOT��N�Ś`���"��LX��t���W��_�^3g���	x(7��|��̞��fO�l����2���lm>1**1��m=j��!/�E��qI��9�R���)":�X�I*ץ5L��x�>� 26�� .��A\�(���N�k��ى�=���3�KU��+J+�L��/�$�c��w�]F�8UP�DץK=�\z1�/�h��M��
7~����f���
����9�M�X��IM<W�&e��5��W�3��'XG�B[/o�㍈b��Ey��C{@���a��x���� �C[N���J����'���>9��<��)u�T�c���F��S#�\���0A�����^��,z�uڭ���oΌk~��gO�o�P�踧B��ʨ<������PV��PBU7�vs`���wRw�~Mc9.��uǛq�\w4A�ICE�n��خ���z:5˽��� ʭ3\Ƶ�X<%%�t�����n:Ē_w��w���ENc�V：�.�n�x�kt��g?6�qK�r ~MP��o�εq���o�)852ׂ���5X���%G#��;��B�SC�ty������ �6�r'�o�1i�հ9�egP�D_�m�y��ۮ�
��3�(y�	�}T�k��9g�Ԏ�L�kA̻-�9,�Yy�N��g����3����Q�;]4��F��!���~r3����4��W���j%���)q�K֮d7��Qv����T�6�k�^��z�;��ڞ� Gx7|�;��`UR������oU�F��y,%�Ma"�bz�|p�#��=oWq?�辋0s���1�)��q���X����[\ڀ�o��45�t�4�WZ�`�ܕ,�(��T[������K��D4��0����9�c�XB���eC�@^��F��٧�o�J	=�	��|vlh��NY��W�A������yP�3�qw"d�~]!��ǹ0�.���(�q��X���l^wH�=����&�JU%`��u���s�:F-oZ`�p*:e�E�Y��I,;���>}�ѥ�sy*l��!Y��T����R]�U|a�P��")rf���ڤ&>ڑ�y�;9��p!m?x�f^������=��f�z�#l��Y���и�� %�Lm?G���$�bR*�J�`�E,��ى���s�硻�eW�dN��g����I>� D!�Si+<3�Rs��ᄤIz/�a�s�I�
�y���KUY�q��ZtO���@��:�r��~�^}���m����|N�H�y���I4[`��y�(��#���UU��j�p�FQD3Jq��mx�w7�+BZ���8��4dZђ��/cҟ�QRc#���c?�B���ʵ0C��bc�&s�AFjf��+R��TxЄ�<�������;/Gg��J�xVz�3)���ފ��t?c��:�*�NU�E��s�$���ϡ�˥�#A��H{W�C`ڵ�rݶa�t!"�{�?VeY��Cl v�]���ɚU�ZL�ǾN>�v��p6F?�-Zee��b��q������H��&��	�`�ņA��e 
���Se�W:�s������x&N������`~�F�d�:�<4�D�a�~��K�ae�ǵ������#� )���L!~��ȁ�&՘(䞲L&G��1�I;� :jy��MBd�]s>���1��*=����}�Z��~�ȁW���6���>�.ɻ��CŢ\V���u�D!-}���љ�"��&*!�3�g�$�V� ��?v�����d�n���Ͼ�����]�֌�r��V�s���_C'��v��'����L�N��+��,o�J�&���y��y�U��R�X�wO�f����6�\o��D��T�#@�̍�f�'Փ�Z�lT��w����v��3HSL%�����x;����b�	�)��6�7�=@�'S6�O�M�x5A�:����İ�������7]o�rw��ʚ=���'p���v�����|��U$z�md�\_ͣ����0�r_�QO�b�nk�s'$r�����ݦ[���܊��)�hx�ih��k
<8H�:]@���3rCU�C+��R?9�Ԃ�(�9�6*����e6���P�z���v��p���?�I�И��� �2d e��4{��[���	x�I*�Z5�3��A%�U��}����M��5�(ȧww^�y�~�^�c�'�	$�ٜ�����S����Hdח�x��=P�U|�7'P4v����mw��c)c|�`B�s����M,�D�����ˆ�5�����ǕU�O*>�5��׹r�0R&CF�iPBȑ}l":�Y𿱧�V�5�J����"B4����2.~�}���u>�dؾ���F�&jp����X3�TY�^I9�XW�����:9V"Ėy�񘱵���!U��<'ш��`�|�����P�:Ԝ��B��1�+WvM�>�au���}�+�l�uż�┆����]�V`X�\����3wDWJ>�z����+���D>W���,�*f����JS�RT�$���c��@�th�?b�����܂uh��2��X���ݽ����z��n��	Gwı|�z�
�K�I�;�u��DZ��6���Ft�&#U3��)L<[��q���H?���v���=�*s�ﱊ���@��%�P��3�-���tN����9Z�A�&���<�"Q�k��,�"�L[ꭅ�|�]C�����jw$�*"�_/2�n�;�e�f��oUw ~.���U5�6"��j�"%͜IR�f`1�X��6�����9�����J���g�|K�������BٔC�7���D�l"BQ�s�8�J�~�y�:0�V�PD��a255��!ٓ�!�Zp&M���ef˲�f$�r��CQ��wy��6}��]��(6W�?��j�,RfR��,mR�:�:P9���
�IbX��3;/�c7j�C���|���N����?��#*�kͶ&�6�P��)�G��8�����] ��'*8�j+ݜ�F%�}NtM�BJ��|}m������݄�z�����+S��8G�C4;�1�MrFn�����"h��Lۃ�1
4q��<��-/�����g�{�1cM>�wp*A<-,�����hum�!��l�A�a7/�`r�n5R	Ѳ<eÔ2_�B���(]]e"N÷ݍ�X�r��	�g�U�  y�i����b^�F�]>T:%���H�&�)������,���5���b�����{�_w�����.�A%6I1�C��p���E"e�H��t���;ha��0␲�򝀈&��IB��m�S|.=����^�)�u6�v�~Bd�Sތ�m�&�1��b,��ܨ�z����-"�g��
��d�Y��q�u��%��o,�E.a.��,�tJڵ����t�^o�m�[�g�l	)�
���Y4��SѪ/����
���	�6�r���,..%�Ù|��c�ܪ1�RM��[�\� �`*:xؔ�����.���A;�?%��7q�w�W
����Qa�gt�C��DM!�h����Sm�b    De���8��������א��>��3)���[�Kf/����Ρп��3�Os��.KZf�/9���[�/֕_k�^r�5�h})%��'��}�G7e��-m����z��؂���k��|j��w�X0;�R}��9�g_]��p�'����}�F�`FB�hP��5b���� �u��R U�pE����-/=��D������z�0KոJ�l+���\������;k;�
Ӫ�U��������ǘɜ锴m}���Y~^:���4��j�R��7���8+J\M(hgE�f4b�hI	QV>gO��w���~�j3Y�����P��hT8�؋����S��
\A�9�ȣj��"CT��&B������],Շ�����UQ>�R��M�\^���V�� ��Yaɮ=�"{������"����M%�wXHR�Qa��$U� ���P�y���?e�}'5�$]nE*����g��>�_׺i�����M��FiE��<���Kї�P���2�=5�	��`��\�*oXea翮!��^������mp��@3�w������,o<�޲�i�xi%�9QA%�Z�l}4Z-�"��1��Y�k�8gL\�Op�*��X� �L�����d�$�'#ҏ]����I~'%��w��)X�qH��w�q�~��z�ơ��g����!��[�t�_�����02G�{�@*"O���4��S� U4��O��TR2���������a�yG�~3�Y�O��z��W@jt	W�:)�er�4Z���sG�:畣�4~��#?�����n��V�!P�I�A��o���#51f��ҳ��G��� ��V+�AQ-�X��ݔ�|��������P�l������똇M�kN�`�E�T'cI��gv�q�.H����wg����f���S�wZ�WE�L�gp�E���iPX۩��c����Z����������n��~��4 �����a�xs����й���"0�3�ƥ_�w�aO�,{���7K{���Ŷ�q��Vy����~�/�{9Q;ZJ:��g���u7��P}=��_��"��������<;C�g;̴��z6l�ء0��6ׁ����B����i�΂/����^'�g����&��kt����s�wT�H�cZBB�D.�Dۈ�fA�Y ��qհu��j���y��D�$��A���}~d��m42	~S�^V��Ӡr�I;��vϓM���F���:�b�}>���j�$+�x�(��[������sLS�� ��+���j�td��\.W�^��YֵĆ���G���w����	�::(d8)��/��㄄�j�Bq�*vs��b�ZNr��y8A1�c�P�ԐKv^�f䶹�!�g��y��T�z�~\o�{��q�Z�25�R��a��/V+����~hԐ#��!d�A����c�h`�� ᡵ�D�]�Ua?�<��;����bT�����9N��aU�d����+�b_��:��V=fz��YN����a�����,l_��KPƷ�!���G�x5���F�rbt�,�c>m7�N�Sp#�3�C���e�Lm2< |4��;#�hc�\8=L�G�<��0=���gi3�����0i�ի��ע]۔\��>Y���8*4���kH�ҝ���Ġ~B�.���nQ�
�ް0���j�7���_����fG�;'M^��~�H��W��Tէ`5��cUQL ��v�["�U\��W��E&���kBχZ�V����0�{�wcI�WG3���[ �#T���1R�.{��&^�0H�\��<�^-J��@	��g���S&T�(��˷�Q�ybQ&��-C�;cm��Z�U�D\�}�Z�AiA�2 k�y����/MJ|c{�s]AOcwB̓g�X&o>�ah*��Ô�� ��H�n��Ÿ�~��).}A�%��!�e��$�s��D�־�K��ȚV�:�����m�	x��_��?{��qH��C%�f�9@�K���0��8�J�$��j� 8!�j���ͦ�����f��+��T�H@�]��t�`��طw����Ư?�	Oe�T�X�g�_H>��POmj�K��p}TE'�P���]:�0>*E����ř v&��6���GW��}�L9~N,N�c���!69����"i����?�[[9��oغu�$���_���rչ�����GԽ�ќ�+a;���A� �0QɍQ�7���KI^��9č
����������#��������;�<�d!�EO��lo5���c��.����C�kHm�SB�]�1m���A��ckM�,27��X7s��e�@?)z#���j�r4����b=����.�)g�W�2=M�,bN�l�S���(��<����}IeM/�*��]�XY�L9����N�=}lT��>�>�́"�5��$E�.wYM�a9��`����#�4JF%��Zҍ�8��rf>,#M����5�,�f9�����̞c�wA*��[�-���d�[�K�Qs�HD�Ғ��������c�m��]{��4t`=�y�nGR��&����rV*��~I� ».~w���z���ɩ�N+B&7 6g�EM(q���9�V�L$4%yIE�D&"h�6�~��������E�����h/=��ըպÑ���i���C�%1x��S��>�4ژ��8�.��υ����)��ˏ�G!�4�`B�9��r�`Bw��OP3Д�� (���p�n��5%Q A����3n�q@ۗ�*vؓJ-��f%�W��]�A6�\��ı��&3[��a�`�{S)1hU��z��NW�N���*��Ɩ�TS☆Ac���D�d��_�2b�1R�P�l��,��T]߭ �Y}x�}+
0z,�#�ˣԸ�58:B����8y�����.o�I2�9V���$����uy596O ��3?xϥ�lEb6kQ.�>sum���ބ� ����,�X�,����Gh0�z����x�F�E&�+��FVnC�������\Y��v��+�{\�Fy&9���C ��*�U��<r4���,H�GPJNl���l����(�4��u	�7��7�����|���C����^K�."������e�FS,~�j�@��䡉5�I$����� 97��3#�;�s��y,�G��
U(r�OXI�Q��g�fƖo2ST-��f#ѷl$�؉��$�����61�3?3�d��?���;߷7�#�qӿO'!c:I�5�A�_n�yu��6;*�mK�m��!��W�6�a6PJ*�agG	A;!����8nD�t�@4}٭�E�?�����I�{b<-���9l�C�V�7�,$���ܡ������3@�����l�ϳw�-:ٴ�+tv@�]� }3���4�6�WO��g�"�������F9��n���q��9c!О �2�u�.���!GK+|� �;"��t�1L6�8Q9�T����lw�YYƆU����5�Y0��ř�%Xa~��G&M9��^����3���&�-�Ѹ6��:�R�]a?�/�0��qC�	�W�aMX$�Ba �gϻ-��Z�O����Y��J!|h�0���7�@���!ɋ@��I�"'�V�T2$��k�"��O�S��O����/I�7ӗV�Q.�`y�̂�����L���Eag��wxA�n�F�_X3�t'yG-��(_��4U��I�`�D����UG��۟��d�;�Q�6ː���«QZ\��#���Y7M-�.�2(KZ��A��$
�i>����`q2��QJ�^�Ԛ���+��A��5�Y�z���8>�'w�'�8ƞ�þtNƯg��m$�������B���HMs�3������Qa�UĦ^���\g@���� ��� ��I���R}3<,g( �q��j�#�3�=���}��8M糫�ݏ���r�Y���'3��m����r�i1�c�R��Ĥ��M[Qfx(������{�猑!��t��ŨNq�!#�C��6Z��7<G�p5�R��#'�Ej9EC>��H����>N[�౾e_��0&�&9i�+'�����21}    �y*�'j���n��7�/��M:�S��aBʰ	d�I����b
�S!:ґ�*��bC�h������n��<�{�X��j�_�J\bPC��I�m?Qck(քg�$(y-�:?I�;D=��$<?�D��z�B+WI�������{��I(&E�����n>�ӹ?{q�I��@t~�fl�W�s2u�}i�Rs�y���6xޯ��I����������g���٦�B��u���dZԙ�|[̂sؓ��ZD�����$��ԑ���$�'�� �B�ǜx�����)Q���t��q�����y8pR�x�{F0���Ze_�D�:i�4�[d���Ũ����̘��U����vu�^��*� ��eb��IX*�[0�x�����^X�2Sʡz�\�%�Z*c!�q���v�C
�c|aw�(��F
F��ޞI�ʩ|���D�#��P�ۼLM\�|�A�����΍b���)DNo;���f�E���&�v s%a7�*>f=V��p%`�hs֐�ĪGd�M�������Q9(�}���(T|X�ھė5��X�q���
��8D޵۝u.ʠd����˚���Fsd��x.���pd����1$tс(����@�|�ct�cre8�����h��������n�!��Mv��g����%�![y�L�a�Q�P��Eh�~����>j��x$c�z��������gDi������`�����)�n�[�\GP��T�戈T�����vւ�f�1W�__I��~�X�<���?t��K�R�%�V��OEu�Hu���䧈���v�槨}��B�g��!�L�
,��c��cC&_�5�嗬rE���d�a?���_.��W�/�Q2�l6t��b�ǣD�e0k����ˇ]�^��g/��`��(t�CQv2�H��)��g~B
��+����M]x�zq�m��׸9�`/3R*��1�&W�`�UEQ+le3�tz �r����P�9�~���T=&
����fhb������G��6*
�g6V�2����\�RD���3vy幊��6�Q�#\���m�"��N�fD��M�9)��Hӓ�� �� �J�{��zH�1�����^�C5%�V�G��N����4g`UQ�9̄�{�y��eA��C[����.�b������I:�CK�[�r���&���2<Gt:�)�C�����/�8���R,�I2h�xew��:��D?6�{^r?����Y� &ԷL}���
U��C��Wc�~��2>w\-��=S��w�c�ﾫ�?1�pSlD���jS�=a�1]m$`r�^�S�� ��c+�sf�!x	��]�v2�sS�#x�Q'dD����Xե�x6ႜV]����Vg��6�����34����=�W���.kǦVʊ�:������
$5U�*@�Ȩ�:��遦2�n�1��=f~y��!���X$�������a/���\��Sh�b�jR��h��Ng�u�˵=�Q�Y8�#�6���.���SoQ$<?6�\�ۂ�xsT������`x��,yVhѪ>3b83O� ��<�h�6t�<���Fz����(��B��&����fRv��0w�"���}�H��f���J�c�}t0��fIX89m;e��:�v�i��-��w��{?M}7��!ܼ~
�᪈5�1�f����h���@�O4A��=u�q���y��"�4�#Q���[�%��a���3&�w1�):�E��.��߁�-Fk;�]�M3d_/���k�����g��K��Z֫��\���uĀ�˨[I��=�	�xC��:?����|���'{"6�� �<��n��PR���Cd���M��E�9�"
VvQZ�����p���ztU5*d����a�s>|̗덍�ܭ��!�i�� 2�h�L֤�5^<ъ�t�(H�M-���{�~�=�V�C�<�Ə�Қ$�bj�xE��`�����LC�VN�A�<�R�b�1>Ǔ��P�=}��@��F��n�	u�X�$��3\�,}=�?�q�NE���[������GT��#��D�t✲!�ˀ�e���b��[.23hFx�G�p���2L(����R/�j.�.�}�0cm�BΖ�Z�b�ė�垇�=b�f±�� 9�|��z1���[�s���9����(1F��?u�&hV�
G	�8���&�tQ56ǽb&�g�vb��J�b���'��W�d��o����z�� Z+6o�}1���,�"�h������ط���ow�]^��W�Ε�	�
ĝ���lS��4�K���!%���
~e�J�I�w�)7�AgD�q2+�_�x�(��ܭ)3i���D������c7NDt�����X9�%}�Bx��^h��Q�^�X�L� �B�$*�E��yz��bˇ��SO��cO���8y��jZ�>6��ì��ڝh/��n,���n�O�훫�{�$��0��;i����1>V�%���M����j:����
o1�w��%��ȅ:�pAq��z#��j�X���љ�+J����i\���&L�3V
���1Jw5��^a^��M���Y��`���
�9m���������Ű�S�E�^�װL&kt���
�����`����L�o�8�z�h�МK?d�D��b6�GP7�H$9�V�e9�}��S����fߠ�2��Mv��eOPd(X������r?�N���gX7�g�O�����c�䋚Bٍ�h��h�I����
�T�b������1�:F��(�=�0��s�$<��C�xFO0B�n��8�k2���	K�2��EV�@��v�B���=r�l�V�yQAL�vy[ɆQ��:���%K��|�O�\%������@�	f-�����.$�u�e�S��̏Bd5�S�O��8�r4�ZY1��8�\|��a��`z����0���bF��d1��Z'W�(Y䴜�+���K�"��ͪ��x�F�K�T����r�~6�! L������!��xR�Ø�{N��h1��g��y�'W��흠co�Ѕ��D���V�j��Lx{Y +.t��u�^��������q0Ӷ�qڃ���c!Ka�o%�/�� |�Y!K��N�q�~3�	[L��|6��e�6�^~��f�r��E��Bc<�XZ��w=��;K{�&��w�t�Z5��5O=�s����c9�Ө���59�IDSz?��RDk��m;�f,��s���Q��ב�=&�ܛ�h���h�d@QK�i��2�/�ޜ�N�sݥd��1L-Ч�=��[�%���s���2�y:��y�d��S闣s���>J�`o��h ���@<�d�.U�rs]�+���l#C��9g��(R����E��+���i��/3�܀jm@��R5>˹A͑J�
�n�b|�A�h鬜��},բ�4=�6�j�|��$$�x��)nă$�m��6�k�d�>*j$JEV�4ᦪ��	��{�3��4�1
{�|����!��Bp���7�����Y����b�����d�s��!�R�ADL��,����&IȜQ����W>c?��N;7\�������`�Pcz1{4y�
��o]���Nʬhl�>�����nů�c^b^BK��iI���p���S�P�?���3Лi8�u�}���ٵ��`�况��Nm��x��O�'U�ð������-�yX�xo��T�>�ȥ�o;���_�8J�Q�4	65d|���l��������X��,��5"��:��L�G�-N�	����햳?��7����Lb�3��߲�خ��H.��i���ȣ�
��ẌEG�7��=���}@��3E�o��}��r�������E �x�M<r�5���h���"0[�}ͣ( �iEM�'�Id�]��1=W"v�+�%��$�\~X�b|]�c���V|�ro҂Cge�ʗ 䒗�p����-7�f���t$iҡ��@�BiQ����C�/#�$��I�����<�C�9�H�����}��`2+�<S��~;q�q�>�UC37��MGꨑl�6N�����茬�d��ǌ'�'��b�^��sm�k󅦪    #6��KXT� �	O�mPQ!�j:�b?y���ڍ�H��wv��8����I��I�����^0 󔒤����d���EYm}\n��г�͐��'�΢�2V�)�p�ಂ��
'*V�"�g�����N͇y��<u�G�������U����F��[Ly�u@�Wh2h�
��Z�('��z�����?�O��=#��\�lJ888#�/I����p�'�p��Ǳ�{Q�<��X/�S�Q�Ŋ��iA��٣���|imΙZ�Ʈ=��ln��Wy��O��C�	���<�1���������*��AO�ٱv���L��C�L�S�cN�ʅm֟gO�!���Gہ��8cx��X���1�9�>���gB�~ޠ�)��V��9���O��8(�Q�&č�BU�EU�f�N�-
�J���9`c��Z'�CҺ+��J�|	������7��ȷ��Mw{�?r��f��5�����ש9jX��ӈ�i܋��� w��)Z�����s�"��y�����`���|��^��T�΢{���n,s�E����F	x��ַy������8��f�-&a�ߔ­�5$愉��6��:��ܲ��B�x?:��R��\�b�SVh�����͌jws�埤��AiC�<;�BYŦ���Ew4G)n*/W��������B��y&8�i�(-5C۝Ϲ
JU;�V�p8����Ը��u\d�}A8+O��S����>ܼVT�Q��8�}�ʁ�4�����}E�������۠�I�U�zJ<�alT����K�E�0]�N��Ҡ`�s�p]m?�]g=l\��m�q�p�jf3}�38b�3Q�\D�痎R��H8V��
� t�v��C��P�!	P�;�g#��ߪ��s�չL��p pZ���΢�4��g�Ûv����j}�n���~v���(� ;���4�����x�'qۙ����v�]��<�bjH�|���~\߭��uw�����]�^��{��S;���&(�à ��������f��_v�V�\n\C5�֝=q�+-��G�>��W���^�V�}(��ٷ-,G��+w�t����?�uV�u��T-pr��Z�g3g<W�դx�wң%<N�9uʱ�1��
���&\u�\>Є"������C�͍>B�̈́���n��V�l"�c6(��<3�����1 ���X��d����y�y|��rب{�����b����ͱ>_������ݔ&���<3HP�0�E;/6o��g��g~�ݵ7���J�^�1��@�Z���(,'(z���Q�TY�'�8h�KU�J�+<	�:���<���{�&9�,M�����dI���OX	& "$��n�G�3=�Q������q}�9�iX="#�"<e������=�LmQu�l��4�X�TMM�-�`<5v��]Dxa����vpo3x�h�ͅ{h��P^	��U`b����90��T����>�B�H�l�.��*dҮ����ˋc����Dql��=Bl�qdG��Â��DeQZّ1(�+M71���j(�/F���c�v������b����C����&�_m�����'G��$��M���E��X/�C]Bx�/�',w�Q:2��e��z���_8�B���͈C`N�! �tA�-�~9��(`d�-9^��̷���q�S�l�^�����eF����~��H��;�5�u�|6�٢3��W)E�GSI�\B(Fq*m�k�ݑ�.��Q}�Q��j���1%�./sgU�Qn$+���jV76%MQ�2օ�Y������s�~�y�Rѩ~��5D���q"'�?�sXf�ܰ�>t�ic�bk,��ܬB�L�`.	H�(
�C�M�']u�4uED����8å��\	2�
��(�ƫ؂�N��85X�p�&��Dɱ�s�a�?o�ǭ޻9��?ϓ�7��?cY�)�h���r�%�D�-�"�Nj�N6�/�����&�f�6�	��	��hSy��h��t.�L{�:3mU�����i3�Sp�#[mt��zZ9��F�U�Q�Ir��Q�#�ab\��-PϷ��r���!��H��������Ɉ� '�l�fm��Քݶ��m�@R@���8G�7G5k��Xs�?�"�"�E��0��>��]O�>�%���)5�C5cZ	�U�V��Sĭ��={����0N����e~FC�b:�I Y?qC�Xa2�s��WY*g�J�ho����;i��V�W6��'C�G���/��n!��:Hk+�����0xx��f��9*��S�K�5���#�h���{eT�Fc�_U��p�������m���a({�����.�ms/Zx�H���~�&l��>��QVĨ�+%º�ɴY�0��0O9�(o�(*�A���h�L�`*P$a���Y��H���~�Yo�ˇC�7o���ˀ������7�S�s�����zʴ����)���t�do1㲜��~@���{�T��|�L�Ù^d*v2�Yg�$3I)9��>F�zp���Hy�%�:��UoT�Tb:6x�����a�yo�U�����AկWw�~Z�`������2�㢤�d�FS��%L��?��$ �7:�M�&$ވ�v&��<��������]�?�ӹ�o"�~$�S]�Bec*K]��G��vZ!۫H����I �q]I�g����D���_В��s:��簔92�=��d�'/��|��=��q~��tX]c���@���Ak�i�-���	��؄�T[RU�-��`�|�P��\n�������B��?l�Y�_ń�Gs��ڙ4~W�������?���w��pg|�����ڱ���R؛C��`/��'�^)M/�4$�
=g�ΩD��aj�C�	��s[
��Z�����V�z	:|��z2��4�z.��xP���vDt���<6�v��n��>� �ߢ�Z6����VJ�*�E�a��p<N�!w���%	i�<�3?iK���ד{�Ҏ��kj92lm}j�&u"���a( Qழ�C���������0=��ʺo�QT���]z��w�x��,&P�y�9A��� ��8{׮B����4��~Z.��:	%��?���<8��Ҥc�u �C�A���eFݺcE(wMVG�ə:���&!i��6���<��a�h,�
�N��C�;3S%�$���Q���3آ�Q��}'�_a���"��:��=3ڣK};�)��{8G�����o���=��:�� E/,�OL���/�̍�s�]#kZ�n[O��\G�Ƣ�CV�gBh��VRU��n�8�r0��-Ɯ$����T�9b�]C)�����#��-�1G#/�0�N�����P��O��+���9����^EtZ�a9]e�k6@�`�5Gu(Ё�+�eig�㦨&׉0"+�hJ�ubS��}u9�G���<�6{�3;�]~�C�Q7��91l��+�|N+CBn��a?��6,˛�CBI�S8%4��T�*���bT�W�����Ƣ��ʬ/�}�|��j�b$��f{�y���+�nb��*鮌�/3���f��%��6�ZQ�A��e:�Q��s%d)�a�Uih�w��@�͋
,��Z�"�)Ie�F?W�׸���y�-�mPJgFg�sЊ�n3���w�H<E{��Ò.�x�����ϔ��P�,xV%�m��3��>�iq��B�o;9�N��^�,�q�8��\�Q��	��+�&�#�{�4�����R�����s��y�.<�B;�)���N�����dl^*��$�\�1������)��Eɇ��W8Ҽ�T�r��Ǳ;M��µ5��D����2���xݗ1�K�9/-��(/<U��_���~�S4�N�p0��aQ�㴝��ߜ��~l�[�7�=�Ja�"r)�ƞ:�z������ �G�����Lϯ�������3��������#�^X�Fx�˻_.qm%4w�F�L��*n���A�3�TXx���N��"\v�w����T�9���ܖ��r3��iH�DD'@0�!�{�SX?���ácIB敨N��0�v�9PQ��_ї�w�l��t
�<l�Gx�    ^��_,�Ȫ�(�;�W�H�(���P�5)	�(��u�y��ᣇ%Jz�o���#���v���ʤw#��ӊ;@Rp{�̶�/e�ΦI��p�f�'&"��V��8�|.~�6�(�a ����oh�~#��ו΢����}6�oW"�$Q�Ol�}�Q�$B���=
ū޲F�P�����Z�%3�e�K�Q�t8<�벧Y	F�Tp,I�Q�W)r�'eEM4E����������8U�]�p��J�ڹf}
�1c�a�/<viӼ9��u�l�/B$����FYC}�<˖�PwU^���|���!���u�"��=o��~�Š��=�l��nwX6K/ϰ�_h���:�4p�n��w�� �w�GfR�����3b�g��� '�N��n7[o���'�Qt=9�F�>|j/wD��KB�a��)��&"��l��(YCa���6|xq�x�r���%z<چr�3C�����������K����(PX�\�Tʔ�^.:(����'$qB�.�$J;&C���4Ř��b�ހ����H�<q�D�Y9(y�醅u�a(SY7�ٹ�l�!����4EW4�����	E9�tI��d��7_�P���К6��>EEӾ�;R*�m��ۿ��b�e�2vt"�;j`�P�*wXT�v1�LLg+�&0R�=��IÓ.x��⤩�W��ti	��D���o���Mmv8�#��&���v�g�O�o����4���ž�(w�)[�j,�L�F��?��KV1��V�-�}��5�ϛ(�� HL:�<�!�\%5U	�EhRL�f{$u!��qk��?I&����4��s�h�%*��y����G��(Y��sm��]��7k�;�����R�/s� (��ݺ?u�;�U��d�F�l�T��2Ў�.Cd��^t՛�h�k�����q���f$���r��IS��ɢ~| ���6�^_Т?��)Ꝅ��	uE���W�i�pҗ�B��zB�C��4�$Bt�otO�:��d�P:���F�>�Ǆ�63%gR��W1��MZ��ڵ��ҧ��x���������]-�K����-9j>�4�]}�i��-z+���D:�<!8�Xb-'�Z�_�װ>�7�[�7g�NCL������
��G�������	��r`_���b 0fW1l�1%�є˯qT�A
�Â	�7�Ϗ���pgȒ(�^mzK#��R|��������H&�i�|!3�����3��d�=HD8��"i#�J�3q���L���ɴ�Ɍ��h;0�=���&��d������+�(��K!��b�]���
]���������7W�S���X�n��|yu�?�U�`�zv��?1���@K�5�� 7R;�������׮����p$Sk��ҰwR�r}'�%�]�L�My�=jòIJ�(.�=��YP��<t6�\I�V{�`W&�@�T��DKC�!:�C�=#bz�Z�1����Z�J�Kwꎛ@��RRYl1v�$��>�����/ƵX�����T�y݇�`�LV�s��Z��)s/soW�)m��ҙf�bo8;XY���N�&zև�[�2ޛ����/�K���J�a?�@h:����x�_$!�del�2Ln��|M	;�t�K�>=�.7�+��u����-��0�T��L�a��r��d��q/�-��e���5ꐡ�z8�5'�'CU5�ޙQ�c���I�1����j���h��6��N�c�B�v��'�oa�Y��]c6}**�l�*��u�y��ZS&���w��eF"B���-�.M��-/��h���S�Y/?Xzxc�(R��̬3IE�.YF�&aK���+b[>��f���|�"�MWf�s���=_`�S;���{��8��Jln�(RQY���a���v����HY���+e��oHn�i��Sh􏂝�ˏͦ��ڶ��.�I,����9Gͣ�G�)!n�Rء�̵�sQ��Fu���	��ü7����1������3�z�k���_����ˋ����gͣ��ͳ��.:8�(�fB�)��HD�h������̓�Ϟ�������?6�\8x^�9�fu���Q��kr	�Q+e��i��D�p`�HCn��𐺤��À�\ ����	��!��I���(�TxA�
����n����<��UxE�d�^�(o��g�Z@a�ZS�Z�tQO�G�-y']Qy�1��ru�v�[�,,M���^���3G�}5.���t�h�Z��K(U��e�Z׺�DC�{�dp�v|W��Ԡ�F��l �i�y�^��[��\���8�d>ĕtƋ�0$K�(���v��$f�l�#Mf"Be��dE���7�b�Lp�)�
gg��9�;'A���)�b�SM���q�^9�[8(R��[e���q"�gX���d���]�EE
)3�.*H�����q�k1w�Č�U��X�Xw`3et9Ѷ!�^����Eڕ+鴽j����㊢tH�}�^���)��@���R�.��;���4�*�g��=js�1p�W��U��Օy�'�4W�#}�[{��x�L�z�rrGVGf�� 8~���s:&���Bhf�=Ҏz�u�(_#E	J�U�E���=�Jw�@��r���t&vp0���l�cGŧ��=�LC���2�D�m�:�^�E35�x}� m!F�$��c���.�h ���x8�`�m�%�����X�7����|c�m�����qxf��(�`��}��03IXr�,�K�Ͽnrɪ=}�cr᳥e-_�,���\lo�j��>��T�<<v���n�3���:��$j�!�?Jg�b-mq�����^nn8c>�32!�����q��#@	t�e'�~��e̩`K���r_q?���/n�W}j��T<��a�j�s/y�F?n�w�mP�¡����e��-��� �|�@�_G�w��>m}�6��}�{Z��C���4�Õ��͛Bv�(ҟl�b*9�/�Ļy�K>�b�m������:w�Ea݋���8W?�_=yԔ&�}�&������r=��r�fb�T6��0�P��G�ӈ����dp�rX��%�	�4��]\/ְK�-���A&;�����R
��R��`7cҞ�I���$�/qis�7Y�X�dXe���?�~���C�Et�V�گC1%�nᨿ�ҙ��1�7M��oC'0�NV�k��_gq�Õ�+�(�Y�֛/!�2�~�c�؛�eк�9bL�b`t�&��%����ȷ��Q� 126�E��E�|g�+'���QB�Z`��`�
l�Q�a��ā\Q��
��I��0Y�ō�8�:�q�M�n�����}[�)S'
��H���C8=8a��Q�W��a|��ä�|��ށԢŮ�Ago�Hc�%΄Gp��{ޗ='� aw��<'"�ϩ�/QC��Qh�0��$�1���"�s;�g�A��b&��Ӊ~Ȅ�D�bY,?�#�g��:��n�vL�����p$�N�T!����*k��-^�]���`�'�Uc�Jr�	QQ�G�^�G��5y�9)����A�Uo� �};O��n�=X��HEҕ�o��-N>L	�qVDC���S>u�)1��>���fAs]�xL�Og�������1��@���3G�d`�Bd�ٮh� ѩ���g����2�iS��V_�;��|�7�כ�67��|��?l�n�o�b�RYT��p�����a��y�q��A�����)��zY5L'V~�Ѝm0A�������&<�SY+l�a��ZIAT}�p�k�C��G��e���~}�߮;�H�~�)x�#���mCɹ��2�ۻ_q�qإ�EӁBϛ?=j�:o���@��Z'A`�te�z:b��+�����@��g��qU��!I.�U��a����N�7�b<<�=}�BЬ�������E]��$��)�ATCș��F35�V�-����y58��99�s����4/*���8�w��ļ�8o}S��r��A��*��^�g4&ZF���/�5w�������3�������AM�"�O����_���ړ���n�%��șƃ�^�jZC8��/&D��o�����7U�!g(+cC�������x�+��P?��J��q3�y%�!    �1��:q�_6$&h���̽b�����B�ə�Z��8#6�H�wZ}����ܲ>rg��%��"Ĉ�F����M�C��O��C��G)�k�э���Y��y�۶��P�a�Y��]��$ɦ����Q�d�����$L��M�h�!AŰ>A%]7a+#�q�/�v鑳S�#�gh�v���΄-[�Z���F�u9:v
I����b�#������m�A�����!]�g �¥�9�f�y1DG��sB�r�j�ȃ7�2Hw��	�(p�3��ݡ"���͛q�"��ׄ����U��u�>�Ef��0��ʇ6�l��!��Љ�V�+}�r/l�c���7~�Q�4�'���&f:Su�j�S�۬>x�r�F@$��2h%�,,1y���D������x�ۑ ��i;G6���L�J��*k�(�ѧx�7�D+r�<��c ��b������FE
Gw�ڇ�+O�{��k<���֢(�KLb%��R��l���"��&<!�������:� �WB��i>�y��o�;�T�$��T��Z��(zJ{�-��r����[���%��3�_�:f��Oх/��q�*b���P֚
�,*���sH-H� �gd!������<p>a��܅��
=r����D���7���3'g1�zB;�Ε��(��	���Jx���.F����`.����w��Z�����v��$7���k�7T*���pu���2-�T��k!PD����$C1֨3�zZgό��LO�7=�ݔ�gA�"����#��OkО/����`�q@��:!��r�PF��l�Z��uq�B[!Ѓ�.Q^sۼY��8g!�a<W�������aR���M#KO�X	ټ$�]����%w��Zq� V�]���gTN? ?�?\|Z���Q_~u�'��@�	���`��|���G�D4��~ɞ��̱`�UeoL(C��ؗ�w��G`��� P�J�̞��X�P;S�m�4+��4���:�o>H�FFŶ��J�(���!���������ȫ�'&�aR�P1��p���B��QS�'t���(���#Og)R	F�v�s�����ܕ��vu�������]�a#3Ag.��K�L}>�ۑ.!�T�߮�=LO���S$Ӣ��8'�C�!��æ�C0�+|�Q�3�t�	Ig(R�d2�}V���Ԧ�LF�K��i&��A~l�@�7�F��o�ې+��dL��F��Y�K�e�d�{�����6�~Tk�W�2�(lfVT�AXz���'x��������RSR�؇fG�r{@u8����;�,�8��gV[�F��/
M�(�V#D�:H�M��3�E�ƃ��1D�Ye�`�����%ry�m��yh�ze���0�^��#uX�w��ڰ\�%.�He�,��s�-/��;�7��r�Q!d�N���4���������M��v�Ϧ���@qp�Ҍ35�1�l��&%�C����(:�c!5�L�}������M�[|J��ׇe`�32��:�8Gm��1#���J�e��w�:� w��V�������� ���b�ެ��2�]����̷�Y>�&�8��:�Hj?��\�_ ��f��2!G����F����`C���dɓ&� �N���SJ�<1��#EJo �G8S�K��6Y�\��a�}�u������h	�u
b����$�4��Mr! (��)�RU06�?ᄀ�s?4���ͬ>�	v���$�`���g<�Ɉi �|ڐ�rW�??46\r�I7*R`�ˡuFnEb�yLf����3�� 	5҄V5�B��8�Fz	�$�b+m.�� DG�+3��o!HH����E�~��`�D��LIir�2�o��1������h)����c��~_g�wfL�fJu���9�*�1��R.'�b����bG�e��v�������R�\**�⠊���w���ӊGK0�(u�v�� �w޸K[��퍬�*Xӱ洫IVh,��4�%���+�)f�o�8b9c��w��`6���fル3�)|���ʫe�o�j�G�]m�UL�X��s�1El'�oL����]xo ?�,7�]%�,HC&LM�h�H�7��醲�0�4OH~�����r�}��׏w7���/�`-}�u�����(�~�Z�Q�a��	����zw���q���_nn��S\�T�("Y.��e�m�V-�TA�%tR��kw���X;�
y���\,���"��I��?nH��ܙ�\8�'5������!�~akƇ�z =������E�1'�Ã��;K�?�s{����/���hk����Y�f=Qʥ�aL,Rh�c3�����zm �wߏ-������@�t?���P�� �3.��KD&�=b�I�̔C0�*�F4�S��y����p��3c�����Cuh��������L�`J0��j�~;H��X'�8=jG��udm�O=��%M�az:色�G13i�]�`b��K�:��i��>�,F�_�$)��|P����?g|�����4�OF9Ԭ[��0�D'�T6#��P�
r���?��=�co������DZ~_!/F;X"�U9䁸�e����9�T��y<���Rx�5���}�0�T�,��Q��4nf�]{_=dG���U�l�<��eދ�TV&�y�s�m�jLo�O�S�ʃ�x��+��kȴ9¥��%��	U�d77�S�r n�Y�i�>qZ��x�c�^LD��~Wl�I��n���֑��}��[��]�S�Z:�G3�h�D�9�oԢ�fW�l���D�������2�zr������y�B0a�N�%��/�� ����~ٻ+
���܆WCsa&�5
�C���E.i������P��ٗ����̘��g*�^.������_���6��\�kՙ��0.kXYT1�R&��S��R5g�Ε�3�jA1s����\Z�V��Kz,��J&!M(h��/�:{������k�0��8��Ac?�g��}��3w^ ��0�����"����o��f�qUА�+�[	Dfb^��PaI���2�.!����ߏ���հI/���/���_��d[{'�����0(7�$g\Lj�A�97V�|Z�7IG[dLT�S�%�!�38�`sT�
�Hq�S� ��a�qRܹ�������͊VH
'����[Q�T��G1A��҆9߉Ҋ9�$-գ�ѽ��zZ^I��nw������@�o����j8M����������e!�pDh������.� k���/l�pl=��$��[���HQܤS�웯�~8'+1<X��������s �+.�l6W���]��Ádn�+�?��o_ �icp�̐/�(�'�� �cHQ�Χ�,�p�\S��N�>�[qn��Wq� ��݇�6`��dtL�Q�����n�?C̀X�Lm��<�	(�$��J9'a��S�|��K��6���xS��IN6��u����	fq�;����jq��G��j�q���6�Ԭ��5����R�'�]�����=]�����n��b�ȕ'VĀ�����#-s�G�~�z�0)�cq���ϰ�wk���s)��&�,O���NJ�<��*G�%���+1�*��#6 ���;ȆEC������{>��+�~B��W��:0����tl	�Ի������cT����0^6Yz��3�~� ��[aGs� Km�Z�� I+?�����b���L<��������hs��4;�A���{���IW�o(^�mp�w�vJ(�������ɇcA�2��@��xȗ�3~��^즞`/ɘ�t�h����n21���^��V�M]��b�M{u%^��)�8�g�Bb:���n��FD����ɚ(6f'��""g-�D�`rM$����K�Iάp��T�Dć�,��^|���{DV|-.V(��9���.��C&L��\&D��93|.6�&�����(��@�>3'�k�
��ʆh+��
��v����D�耛��Et��	�z    �L�;�ޡ�;�2�L(Q�SobT����E�l���!��h���]_��_�����e���bP�/yƨ��l��$i�]�T��"bl��un�S��`�3tk⑚�jhg�&�L
��g���roL�W��s,xS��ňDgfF(M�C8�FMU��Dkx}�L�ӵ������u�����\ć�T� �==}"M_F�ڶ��Xf�f(�I�/����l�w��ף41K4@.Њk�HJ�9��� �.] e�u���@�$�q���S��0�oq�d7m�Ț��7������˕�����}��R��uV�y�}^킚���%u*���׽�4������~p��1�V�!��~����g7�������	�i6��"Md�L4��돬Lz��:0}��~��S(��p�rnV��:��#H���3��A�A~򌘋�n�;7IS���h_G

�"�hi8;G:R�P��B���42��SVb��{���}M�\UEF`)�����Ě3���3&_j2X��EfSl�O��}��2i���X���:B�9�D��s�.�β�.@5���b��i���{'$�
����P�O؝��`�T���7�����Bs����@��'E1�1}��!���+ѻә�db�y�ZRGL��ni����v?/���m1k'J/)��+D!J�-�8��zqOA3��b�i�t3.�t�A�8��z�|`P�$�!2j�Ӧ�}U[9Ӣ��ѦC ����#��0�=��'��4c0)�h?Rm����D��`Z#!��^�������FY2H�(�Z�+�2N�vs�vFn�v?�s3__�]���½��J�¬<���f�y��mY�rz#��|�7��d�8d�L��*�;d�e�a�F]?߼o���lPf�(��H.��M$��(@�(�6U7���U<_��-���$a�%��nq�q���� ;3T���J��o~�t��#L����7r�uEj�8�z�����#�3�����H��K�]ļ���c�(�z��=H܋Ah��磇^?��
Ky���0�NI���O�R��"��`j�R��By���ɒJd��{p-O�S�5�RG�X��Xҋ ��!}��:�^�.�:]q^����1t���׋�N�>}x)vN_O_~��v�ǻ�\!A߅3�u�ӷzy�߹��i(����f�m��d�Ʊ����	n��An.�e@;o�\�{��&�����t!c,�:���L$^�(���g�E����~��#}��?.�v�خ��k<���E���/n�*h�����~A���ꀔذ�|��Ց���cc���X�v��b�E�L�?���b(���p/w�v�������r����o�:s�u���$J�ɀљ��;]=��%�I��d�����M)m^R���=�g���y�]��+X@ۘ����O��aq��s�m�C����؝3�h*����l7-�ȋ@��f�0��)�~�h���-bj�c����tpH�!�Ѳ�_�g�\�(�� ���ũ�.z���\$A+�I��d�gFU�991]{��v}��.G�_yOa��F�2���ؐ���d���V];F�$�!֖���ln8j�	H��D��ur(	C)�3]��!YewE�7Y�95���,���K��3��9�[tb4S���Q@��	���S۳!Όo�;�7}�|�%r)©���/vl�N`�&sԢ;�8�.O~#��mV+2}�B�껃NB"s�B.�ϭ��rL��#Gi����x��Bǝ��~d_����<�B�B�L��lؤ�����@H�����O���������{_O�ʡPH���� Tщ�>���Ql ����4���Zᒓ1�&���O�-����-�n7�-w�\����b�+$}��.��p	0�}�m����C]c'w=����S����nݣ� �`T��:��w�t:}X
�nPW���q,;��:R,8��.�r�~��tX]{#�Tq(�����ө?D)�($b`�$�l����!ү��Y�7�\VP
�5���J�<�*Nόt�A��c�����C�������dM=K�{&��ѥT(T< ֜-$�ne�{Ȁ Y|�"��*�$M:�<�6��K hTW���)�T��w��ڵ��%�{�y�L�E�d��)�v�"F��d���=mWW!9,����m����h���y��I�ȴFc�ZJȹqWe:�u1(ڊ�逢�a�"�j�?��q����L�
��L�
���hʗ�}T�9��\�f��پ�^ܓ�G��U[�dȭ�ey�b ��e��=D�V�>T�ί-��$Z�������|���������tU�x7�9��(>8f�z}��^����H5m%ADf�l�� b�c�K��-��v+�Ӵ��X�� ����^�E���s"��8bi�G��$y)�d���nq`��Y;]SM����1�����|c���p�\�J_`�5��Z�Z��}���o�Cv �+_|}��E��nq�]�q�c�rf1�m��iO�.gڊ��B�8/3m)B!�<ݪPzyX9X����+��h]�;���$@d�^c8��Ua�>��ܐ9"	ԯc��O!y��
���J�\��SR�wY���Xj�љ��~l\|/3�]�E�4b<���ݽG�k�v#Y��prY��
�W�	����P��/T�*fS�Ӥb�]�EnOy/�������-W	t��+I�Q�?㑽Y�:uW)~i�Ճ=���^��,zR�"sf�ќ;kx�-Qքs������$E��W�dilNՠ�3AI�򽞣��_Q���氂���'iI۹&I��b�CXw�*�ߩp].�7�����Yw���wi�Vi��Ɗ���O��1����ʳ1��߷(��zsy�āb̋l �+'T���6��O�w�N�_�X�HC���a��؄{�����t0s�W�����p���!^Y.�HiY�ޢ���y0ϑ��
 �y�\�nL�2c:V��?n�9�9�n�K8�|��]��(̼��C93 	��3�bE!��5�d�.�[�L�X�|�',��0�3�����lࠅw��w�gx=���7J y�q�r4�#���ód=c[;M��w��.W7�J��kx _�8�`r_�'���{4�Q�[h47]w�Q%a���'휢a�Ư����]n��]�g+^c5]W���	��m��7���.jVW�,�0oo����k�RnQ�j
�E�o��0=xo��@���ӳ���T�X-��ƈ�<�M5s����ۺN��
=A:��D�t&Q�?�HA �g��ιRs��:�-�,1���b �D�\�&Q���g����p��gC���47J�"k�y�=���|&�P�I��8]]�g1��8D3C���TǤS}G[͘Ҫ��wS�9(�#2��ϗ��E7/N%��Ӄ�k�6����x������� )���M\(�-iБ3�I����K������%�kr1U+���P[/�p�͌�$��fF��ABu`:�fB03�����&���-F�[�Z�o�T��� �N��,PLdSuA�YZ�S_�� �6hWߏ��B
=`\W$�-ϸ�f|�1���%?�L�.�כ$�`$�فzH3���� ⨷ݏ�Ǩ���p��V ]\������+�D6�Q���9�tw�>cv=Q_����ۻ"*C���C{�y�}1���\�N�#KA�h�Nْb�d[�v|�5�Q#�d��MbjG7S�'%�|1�	�<؅��VE��� ct��jA�iZ�\Ba%G��F�V�;G�P�y��zaVzz��z�w������c��aKg=2Жt���d?ev\C����0Ƨ�=m�K5;@ ���������@����~iϗ��J@&h7�����UZ�����z��b�qn����5>����+^#�7����gh`TH��Q��'�G��%�t���~*
@�W2	-��q�g4���-%��BB�L�L��QbQ��O�|���;�����&������(uw�=&8���    �N��Š��=��<��A|�O��ʉ�>��ٷ��h�Qu1Af6�[!we4���`v��@�݄���"-`����Dg�z8�)��.Og�-�mñ��K�o����$Y�G�D�^`�j[���y�*�{;)M�XfenZ����+A�H!^���X�SS�MT��oZ4�J��#�4"Wt2f,*[8C��J ���4��3Í�}4?��}׼�����v�t��l�h���>5����#|�p���f�,�6w���[��xħ����!������uw�g�l/�˴+��x���W�#81��%�kn��p���!��Ǯ�oЌ>�fkp+��-Q6~�~���a�������]`q�5���Ň�W(�涝Os�CJ�W�͙38��哢��넯&�p��zX�{D�m��q��W����/;8Z�	�ѩGqʹ�x �RZ�j;|�u�~��w&SĎ�J2�U�nu��I�q<h!o��2�\�:8�8R�4�h����
����aQ��IB ��8�]�s�~��u:}y_MO�QL+���Dm;z�},��M+��0�ї>�=XU?be���چW�'}�m��o�=���3gvi��������s���JD��.����0��Ni�琤�h_��xY/��z����3H���	������j�70,3�a��F���hd��r�	Ff�V+�����$�,[�43O��Gǿ@L���J��Zv�H�RQ�C> 5��O�)z�iH���Q8���F+eH)Ґ}1�/�7�j�+�Q��
�J��t�K�.55숔i1D~��>OA��hou��c�D��C
�X%g{�E�v BE���/�/ęND��e;��t����7L�#����P}�6����L@�w˝�xۜc?W�� �N�U{?]��OjԋzU�n������Dw�{ �%��WA�-��x������h�(4cXu��R��j"��jn�#jԣ�(�(�U��X�S�iW����6'�!���4O�0ht6p%��k��>8�3���~o�S�7H،sF�J�ؕ��ನӚ�����b��ڬ���SY'����ł��;�x�M�mh}�cDNf ����F(Ԃt�c�_�ULޟ���CGE�;*��m��
#�[�#��r����3:Nr�ob&��xD��2q�;�8y��a�������*"�6�B��S� ���&?�`@��fs�	ү!�s�D�������^��,��=�����^���]W&6#A���7�����"�T����>�pX �����<uxR�m�����'YR���~Ǣ:gTjx�h����`�\3>(�F�(gc�d�2=�kw,R�o�B�`]�������ͺ�y� |����S2>�X��q�K��^�{�7���NH#�庨��+�
��z�����΃����'��N��%��M�@>a%PS]Z�N�E2��)q�5�w�3�N��<�Kȼq�K�l��n7c3T7M�oZ��)$ �[xq�`���ú7e�jf�o��:Y���j���TZ�J��@>s���j�؟n\
�("$:!_d��:sI�O}�E���o�a���[O������y���3{m�'���'%��:G_:�i��k��W�;�3�J���*��O$#$q#3ciajr
C�a�GՉm�F���o�>{83����߅��;Z�A�55��T.�7x�xw��-�I�����ㆀ|�~��bv�(��t�s�!�SAL�D��Q���ɔtl0ώ�Mo����9L�$���?�b���Κ�h�����=9?��V�
2�$vJN�qS��$���U�_-�c�~���v�+��D7 ��5p H锓�)(5�K�+Q0�sA�#`P~BV������t"YJ$+�@�ʕ�;��)�O}�׺p��1v�Q�\F���Qf*GY�?�����P��6T�!V����tZ�Xd��[�l�����^�>[�0�.O�-PT�ASއ�m`�&
EZ�	�`Y:%!��^�� ���2�障�j��F��q J�8���J�H�뛰MmZoQ-f����^�|��/��a�Ҷ��O�eHy?>E��(8�5 �xQ�V��(>s?Y��f�c��{����g�R��fв�#���ҡ�(l^�B�S�	�/d's)�\r'��aF�N�]vQX��f�ةnH��d�>L(�$��%B��?i�!,�����7띳�LΉt>�s�h�8��{z�rfZ�՞�LO���߷�r5�]�['����o����J��2
�\����-�X|�]D�J/09�B��^$=��6�/�KiN��={���l3���E�r�!X5�q+V�澃�Z�5���veX�"i�fqp��$��������M ���x^ۙV��&������Os֋k�qdg����g�f\q}�3Uq��[���kKj�ߨZ���gM�<|@;�Ͷ�����l�m�&=��y�u���v�D���ˤ�A�19Ln�84Q��� �M� ��M�3g���������R�ӽ�~}̷�0�gY��r�f�s�M�%�<�2�HM��/>��^�54�ݰko����:�� C�������ʆ�&dP��ɚJ�9X�#�����_ ����W��z?L&U�YW�9E��CY�n���O�`����G�t��kOo�2W��ɻ�G�e�#��������o�˛J���Ed;������r��6���F��ʐ��1%KF���	�Eeؙ���{�t�z�����\���,w����Q�K	�v�#�hQ�~^I���+��y*jF������$��$=��Q��w�۪/���Q��5^�ٝ�~�X|<X�5��լr���ioQ5��f��0�֭#l}b���y��R<���N�Ҽ���gTg�-�R(YT�w���=,���h���r�n����-
��g5p_��z����#�@r9U$K�T���g`�����8�o�ۼ\�����k�Yb���³�O/2)����ZN�UV�Y�1��#;�pi��e��`t�

�L��E�|���b�8��3n��M�6Z�.�E�?�↴i^>|��ǘT�dmv�v\��X+�43�g��u�f|���#��=��R���t�8A�*X�o�t���`-��3�f��+��N��~�*��`'1�g��2�U�g�+�.�;tաn��Y���?n[DE���=���8�I���	>Ec3�-n�tP'�zD��
XB���tD��������T���`���+�m����?fD!�_|����72��^n�~v�_/7>��$�i(U�K�4R�pi��L�xw{$I1�rVgO)����~��cR����pk���!��~�;x���Mb��;8�6�����D�@���)Al^��rwaN] 5
m�kLfR׺@�����v�j���I����ړ�:�n�U��G�	������{'��
��~���]�*��s�}1A���m�����~�ыnHm���D�@�.��Mt�J�pW����[��Y/�)��|��a������B��x���4�OZ a�kWJ8J�? L�m������y�q
�</2��&�Sry��7����~{��D�Ⱦ'[T����\� ��G.{_����z�g`��{�8�c���:�j�9��{�V�x���X���$�CY��; �^�w���r�D:�,y�	�����'�`?d�r<�*�k�դ3ZKģ�h0DRr�(��5� N'�~�J�G��q��@L|@M܋u����@��Y0<: "�6�&9�&��XN���!�(�(y����$K/ERD�EO�#�k�:�rT��/��ն��Z�_->.֡tR+O� M��+>y c�b�e�'E��Y��w�d��r�4�K�O�K��(	Γ{������U���!��|F����I�xOg����4��y���u{��#Z�S���ߚi�+�6�ˡ	�Dtߍ�o�}Bb���^���>*���<�sz�Yb#�ٳj���5��@�'8�{�!��A�    t�y�����N���x7���Ȉ��P�?Wu�\8)�Sʁ��A�ޖ5vflg�V�b!SJ1���5<M��+m9�v�5���ڀ�����HM�a�P���w�@4���_sޠp���\/?;p�Ğ2e���^܆3�����+_Z�}�VI��<fIQӎ�L<�z�a��y���c2eJ��Wٛ���;A�g��|�z�3F��cNSF�y�L7sI�l�Cd?�ܠA·����|�����g��ǅ�+�:ºˣ�<�2�py>e����������.;f����B3M9�لE�g׌��텛�W�3���Aa��7�M��>mq{-����.�kD.=n8�=A�����ܺ\�;tH@~�ۇ��='5%<>�QP'+='8�9�~Uc�$��2��ú3�f�z�r��vl�BPi��g@8�A���F���N89.g�s���d��>�2������!�zӁ۞�K��EW���U�0O��&O���
.�0��o��oGK"r�h�H��@m,5S�fW����V:C,ː�C*�#ϐ>s���%a��1��|�ǺC)�v|Ԯ?/����H� JHr��G \	+��0��db������7	�}񸭍X�;a���]�����r�Uy���=�W;����vgK�|Պ�+i��S�Ȋ�W�14y��{(�1GKÏW��!v�cq:�����HΏ���Q�5l����c���D���w��h;U�o�	F�hT�L��1�F�YQ'0���3�	�V���\�i��dV��{�4�A|hA0[��	���bȌYaSGI��d���;�No;� ���Q�bk/�u.AɃ _1�����{�I*�Q5i�`4�1�&Kx����@┌RlJ�
9a�pt���`�0V`I�u�"���Ӎ��N:�x������$"���PąR���LّT�\AV ������k\�����r�����'����<\z��ԣ�o�SG��D޿I����j��T��ByVHUB���ֶbS�L;�{�3Q2Ā���a�hM�X�Uc%f����|Ȋ�4�MIN�b��?�<��齹m�K�y�~\�Vxm�_�6O/�ɽ,l����QXO�B�����ٽ��6I5Z��j�Uo�X[��g�FAo6���\AJ�_���u�=�HJ@U95�w�+�;Iy�\@�'�19#ճX:˷�lA���ʽS�������$'�n��t��a��9�h��7�)�>����9ǃ,��T3ͣ���Qy\�&��Ӏ�n�	=�.{䴎��`��]-~�k؋��%�/6����=��aZ��6�{�b��j�G��79@<�j�Q^ ��oP�ݾ��\>�i�����&�&/��)�Yx=����=~D
^L���n�D�}�J_��Q���2�
��a�.����Ŷ]9�6e�nu�ct���H�BYp������d:Q� �œ�:Y��b��b�zl�"��uu7Q�{'��1%w��ʜ�8�O�z�|1۸�G
��_�B����r���͈t�	��n��c9�R@���+�ξ�mU��Q��1G�eCz�VHw��Mp�d���n�a�Y�xJ�~$�g�ݞ�I����>f�O[:�1G�/��%b����'ݟd�,����l�o�Q�c������H
R���$��P[�#����uX��%�-�]-&�&���ڕ�1;�ϰ�꙲�CN���Q���6�F��B���YoC����*�4�ݕI��y/���m�k_\mz%�׋�W���]���]-�85�#S����vʓ���g�]z��ën^l7����ő�d�p�l[3M*2v(�f�̺�&4j�� (�mR��f�$2`��:�f.`%�dFɮ���M���'�L����R��\�#!�
ҋ�e��K�Z�i��@D��8)B��
�� *�Oi�)$�B~r�nC��>�H���E��J�A�O'�P��(
3fq�`����J�Y_�V�V ��S�v�0d��hf�)Z��˭�$l�SBx�_*���;&3�C�A�{ག�-��x��|V��ȋ��6��iW�k�عs�]���1���_�hR��@Җ����g����ᕁl��� IR?�5�U�]	����Z4�ru	X���3"��j���ȅ}��g���ׄ��>����z���:T@��5��s"�uwW��s�M��Ѯ�Q"6�ܶj4."�����5,	kdɾ�9avC��v�M�=l8!����bE>?�����0=��L�p���-��0����e�V7���U� ����̣��S�T����)�NYC��TӒ�wa��<'��U8�%5w������j�~N�����h��N�#*S���,!%�Q��^��ۢ� bx&ӧ�c�����1h�`g��҉�aD�_N���T�Y`����YL7R�0
�H&1�D���/��i"QO�A������a�w��U�ڬu�D�'��>�`����'����!f�(��VV���2�6�߰�W��ƈד3���M����eE���Iyd6����||�8��i
	CY�΅����R9�=㥖��PZ��B�#v}�^UhD
W7z��.#��z��)C<�ł/�퐘S
��rv`��Oct����:E�g�ad}�24B�����m��x�����O�?&=�.���X'VZͨa@-'S����T��Z�j�u�۬7)F�}�����?j�Ų'ʟ`��6*O�dO����y�}���}4RuW��k�$e�7���H��3C看��f�Fqw=��!�}GtB���I�h�r�3��ٺI��7&v0�-�Ib*���>�c�?0"q�>�ÞJ⠒��[^��b^J������94Nt��)
���.W2IG2W׬Bཉ�
I����\��k��/N������j����r}��k�p��Z���ёH_7�B}H�%҃M��s���~\-�-|Ls��Aȃ�<1tsx��3������V�0�`=pC�f���@d�&��H����K���)M
��S��E����F��h�][�<������Q'ԑ��3�C�>k��ܿ��R<���j��vӕ;9Y"�Hz��@��e�᪖	�����6H]�h5OU�o�g��3��J%�̼ɤ�����H�a/�����x˗��#����r}��.����DrC=c�:��A�b�z���=��8�J��KO�� rؠC��¬U���Z_V��:����/8���]�����U�
b�v�Ԓ�l،
BR�Wr�[Bn�"���Et�v+ɱ��̔�o�0�����ǻ���3r�E䣫�&s��.j�����q��0�v���1�������揾o�l�����9�#��,�9�����#|�w��l�HO�t��"�Oœ0]n���@ާ�S7�L��k+O\�'���v�[6/������� gBe����u�#7힟��t��L�(�7F5C��KF�J�9�<��B߅�@u\�g}��S�aL��>e�Pt��2��v&��˳e�l�iWW.��
NS�M�R��,4}��ϻ�l�=�-8e�Z�V8U$I�[M��ɿ������,>�z�̎��W���[,ϔ3�����t1�_$�?@��wȭ�<l�)����I���3�<��ŷ�부p�y;�J-���1t�THj���t�#!Hc��yȻ��e��*��py��@�!���|�եk?�,�T��T$���g�wV�>�1H&PܴSn����?�<%,����CZ=p�<I*�2L�����|�wZb,������pt�<>9Jwx9`X������zі��ΈB��������� A�ތl�����/�k:������	%���*ެ~nܩ�_q��d��y���+E-~T������/�����U(W�Fb��Ć����w����8���b&��T:�cS͠��JS��-Ԣ'���D/W�3�{�C<-D�:�
n/�v��Q�m��,��`�)P��g���u ����39�0��Q�8�È��@��0ݳ)TT��'�2٩AY�q�*f���j�    �7�7��}|����*d�BY'Q�TZ��8cDz�~7���^�ޠ���FLI�����1��y��员 �.`R��3@�G��p�� �0d�$�p�V��)�A� �����P-~� mwa��j�az�մa9�\6x|�_-����`��c|�5@ڇAcu���u��@ϸ�烃0��^H��j���\���YD��3�Q��tp�� %�h��v��d�ɘ��g��R���ͭ��b�q�;���;1��T(���)��l���e��W?�L�S����U s&�B�9M�4)�ewZ�/{v�t)R!ʩ���,h��e�+��Ҩ"���LJ�z،�N����wq�y�׺/�63Ty�v��G<V֋K�qYf�6�A$����y��߾��M����z���]���㗏.�o.���͋���_��@�V"?��x��G���3|��XF5�#b��S�;	SUF�;AXLSr�=�2n6:AW���㇟B~���/��I�9�q��/o6m"eɞ<��F'=wj��/7f��9�\��l ߒF���
`�}av�X�U�'N�w�c���姶y~���n9�)YǂTi����92b�x��j���r�Y'������b�6����gr:�gU~�����-L�L",-��Ҕ"�.���W'��wb��Yx��4��F��y��Y燔�G�L�����,�b�p(��{E���eR4�sc��*M�L��
�^~����`�{���*=I�"�������i�QNY�+������WF8U����*�p�lؑ�j��S�,I��uu91�]S��,1Pv-���R���h��2eb�NOi i|�h�����^�]]-����B��r������Y���t�&X��$Q�Ǖ�$�/sW��,��N�ɿ��c�w�n$[C�#�����aϣ�(�o-ΝĹ[���.oC95��b�өy)�L<w2z�����ÎR5�Qr7(Ȼę�SQ�Yh�\g�t�D.hI/�sd�����||P顇RŢsȌQ]��b4�r��D��L)E�9
��{��G�(��3.�Qs��{p��)k��r*�՚���G�I�؃������݋O9E���Q�OI<�#գ˕����r�������;M�-�ur�B��v���
ΡyS�@�jT��/��ɸr#�����l�	�t���۶��ף�/4�@V@��H� ���daiW�{�n�r�K6��L���|��+��*�`��8&���1���bhr �%z� �U	)B����=�Z��L�~�&��q@mѣ��_r����{(急..C�y���q��E�����U���u�:[yQ�-�����?^�=��}N������4e||o��g�������`�,,'�<b(D����D�C����F�%�-��h�'�Y4Ўǁ#��Z�/�2Ga�Ϗ�=�9����K<I���7���b��C�J��O�7/[���ܿ��ޒ��s���e�y�f�:Gp�C �B
��ϔ
~�?���}�Ï�A4���艑����z�hWI� *>�݃��r��_oJ�b�js{�+f_Ax��~��~y�����<'T����Y��xM$XD4�D���Vq���K;��'u�����a��þ=�2"�]d~F���QY@X=�wܬ���������#�N���[�ۖ����&�$Dp?f����j(���F,r��,	�B&$i-p=�c�$z��F�z3G�8	�ۻ_w����5�]W@H��G�H�<�v(�N�LZ)��8|����вI���i}v�)!e\:&#V��k�y}�m�0��U��V/y�����go�$`���s�� ��F'�X�S?G
�W�KT1�݇`XHU>�˒-��@5��)l��hEiKMgDՂ!���a�l^nڛȃ�9 Ej�:P�tzH�D�gE)C �Ѻ*k9ƥ3�ax��Hu����!S?��Z�ur�Z��A$s�3~|��	T�Ir*���`[)�VM!�F3��;櫂��Lp+�r�23�L���$C�
2k�&��#,�W�@:c���AJyie����u(>�7d��� sVpiI�[����]��LZ�GQ^1�E��H�;-����N��{6o�nw��k���03�v�f�wG������PF��<L��az�����囲b!��)�I|�J1����T/�TJ��
��C�6`�ח�NFcd����C	Iu�L�Lp%�Z^�$�BH���Y�g�[+?s�`���G�3@|4ITg��ȡ�'�1T����{��*Nt�N-}j��C	�j�g�����bô�����]81�h�S&���O�>���ڜ8�񯩝1M�������	4�1��)cl�Z���d������O�J$O�4U������f՟���t%뇛�n�h��άG\��1����v��$��/����9�si���*8;���`�C�o3 =d����NN�����q�r����S� w�yw��*[�4��+tl�Y:-���?O��Ji�ͻ<��嶉=8�8��n	X�=dX/1~���6�qm�(L��&	-)]�]�b����pqy���k�*�}AR���r�p`�`,~>/>ad� �sX��迆�AxwDK�,r��1�
�E��t�>��"q��ř����v�mװ �,�o�=���وy5#�w.a�Bz	S�K��H�gn7�VZ��d���.���*�Y_�wl.��,��35�*{��F�	GM���U0�T�Q�i�y+�E�D������{�Z�F�0�`���L
g�_΄&�q� �/�t����t�mn�����T��h�T���:�d���<Y?O(ի8z�1�8��>gA���b�G��
��jc����;��E��tK�@9��HN	�)s���8���yx�/�y.�;���s�p��o� ��*!\`��Mw2ɩ5�ʼ�O�-����^�n�o.���C�c�`��<pN�:,2��6Ә��%Zaf� �j���&b�\Q�T��%��4��ځB��ȢEAwk��Y{���>�4�(/�� S������]���� o��W�1H�Am��[χmu��CB�c62�K,�k.�D���c�hkN�/��l����-6��p�젓�����e��~�5W63ۇ_���7{t��ߨ���&��Z�_�|t-������jC�}�d�Gf��燜��("�'�����9P}6�,S�n��й<����_!*��햻~4��&�s��kش� 2=ϛ7x�i�_�c)&5p�'#1zn��C,;�
VX��u������.cg�p=0Oh�;�(�@�BLY�$�+l�1�eR{\'PN���3�%�v}uJ�u|�3�<)��s��氼g�F�S�ca�H1���*�.捏�J	"�J����(��-�eAV�kx1��"��|�J� ĝ4$g��~V�A��lۺ���;�-wJ0�I��R�7ZF�iD���[�Gk�g֨�ga�����]/NT��l�6�51�Qe!�`l�<��$���X�}oͭX�U�W�Ʉ`>��"�����eq��$ı���ɀ5]�a�z��d�{*M��g�v���f����-�c^��,fg�~Z����ߞ4����=�? ��������T*��Q�Z��Q�?}�����:�̛7�;F��\��7� ߵ�[T�p��O��&p��r��
�&N�̠m�����=Ym\��7���^��OG�}r�|��7ap��+�bs�':���Y�<$�xj<�	���O���0w�s��E� �?�I�DǗ?�`D�k�i�Q��:�p�d������έ��+��C�r�� )XF�7w�����{��WC�����?7砖��!�Y��8�g��4(2�X�C�ny9-��æ�������b{�0�v�Y���Ů $SI�Zݟ@^���(�#��/Ųд,���E���4@4�����V���<4ݙh)�<*���v-�k�k�G$+fu
�f��T���Aք�9#s����t���x��e��ps�$Bϸպ��j^d=x�$���D 
  �?�����a#��}�*gX�x^�1�u�m��<T�i8�~��qt3<:���آ�V��I��z��Ņ��4k�ě�'��r�q�^��MɅ��wo��ah���~��Ar�K�"��x��Mp�}\ rj3O�E/��N̶�?���b������+�����4,i/�8@9�?0�ܚ��]m�s��G�n�4u[�@����dx?F �J���Sx�<�e�񪐣.Bk]��E�ظy߾��;7L��w-�max��b�2 �r8�dU%mcN��AE7���j%ӕ� �*w�	�.
�)t����7/%���$�"mdj8����	��.4�Љ�3��ko�bK
s�M鳴DP�|:�/K�A]�rM!�Jx�G�|f�B+g9��#��\[�Tq3
�N�����Ļ�1�rza^����޵���ވ�x���<˲{��|��}`Ƞ��L)�H�zO�(r��8���T'��,���z����&�b:f{�5��0�<�u��M�cT�>4�=��F:�ˡҚ�7lL��0`7��6M�~S:�\�vD�v��H�Q��t��,[���^k�`�Q�vuw���H�t��tYУ���i4��
���;�O#&h�O���H$F%
Uo�@�w�s���=��6p��ړ�(zmEkȢ��^xZ~QƓ����_�m�i�:d�˯U�h�It�Z�M[v��рf|�'q�(x�c	ƴo�r��Q6�.�z��]f%S-��z�Z�V��%L�z��DD��3�Ѹ(��n��>�$m,lh�߬���cff�4�tR�VEa�/��>����;֝8iK���BV���;�\�^fG�@b��9FWr�fs��t8&u�WLD�L��T顶U8.1�{}��7Cg�3f��᭝l��b�v� ���Z���mu�oГ4q��� \�i���.l������AAp����K֯k GI���E�_)Ż]�5P�Z��Gi�� k�̖��ѻ��q� �d?ʽp�륏QG�i�ŪK%�J��f�{Tu^�r�cH�t칡�y��)��-�[�k;e__.���xV-��m�h}H!������~S- �xB���5�X�)���K�I��S��E>���@�Zb�z�j���ؓY�3V�u_}��(�[�?�-x̨3�8�R�(#�Eg\P�x`o�o
X9NLș?��q!S��s-��7�zy�������`G���b&J�l�lJA�؂����ju.�ޢ9��̼W4�����tkN��J(0T͙����O9=j�ju�=�-,ը:E@ǻ�\u����HEzPN��T����	�r#j�b<OC��rW��-r{��Vv��1?��Z�ݜL��D,�l��XϮ�O��r1b����;�|STm����,�]�)��s�3���J=�ȵ��m-��j��Z�|��hcC��b^��3C���ӆȂ�83�|ô·N����t4�sZ�~W�毊i	���"�᳻���:��,+��n~��B��]#\'cڭWK��i��L�2��)�]m>� �S�.r�*i��ɸ�X��g�3J�28ɶ�to�@�[��d1Ck�9[A����81η�����4.�~1��;��iO��2��3_���9���8��6��3:�iʻ�14/Pz����v%�
W+C9T�k��Za���k�ل�.�/��
1���V&�n����A���ʈ����Mґe@y1��2V�Kȏ67��z��E7h.�lU'K�"����,�^����n�n�\�T9�y�qO��z</�����q�X����,f@�B�)*�����Ц��5�\��m�^��)�)�e��w�*.�q�cF�1oS��:y&��U��iԫ]�Ȇ�^�")Ng�R=��� "l�_�M��^�����W�����ő̬&S��wB�F&f�2��ǣa�m�q��~�Z4_�&�ܔ�������)�Ӛ�{��^!l��ᛏ�+��EɫJ#v/���uG�G!��M��J�oK�w�^�I�F��|��}� �6��څ��sR�Q!z�8 �Ϋ�s]#��1�����������j$�}��F��Q )�6dz�t��P(1��JL�����ߨV���uw�Y2zk���u��Ԓ��̟6M���>�m0i����E�%�6=���|B�>m`J���-��N����mP�AỘ���l�ΪWS�[G� ^�q�`�`�Y��1xǽ�H+[PD΁�Z�\n�^�z1�
3�1��N�̻MOX��Fl1G7�Ρ���Q�IADZ'x�*KXu��,<4��8S�C)��u#h�m�SU� ������M�8��a$�X�����Z9�$�����y�3���K<�tad��#��E�7���~Ro�t�9h�E�D�4%)7-E��6 0��O����$� �I�~����E�a�i�Զ�$�����m0����#���m$�JZ$�P��{�|�|�fW��DwR��@�a�\��h��F,i�R-"O�K~ơ�?�|���pb��Sj��5B$���y�=���<�^��      �      xڋ���� � �      �      xڋ���� � �         �   x�e�AN�0еs
�ff��]�	�E�@�F�AiqK��p Nыa�j��W�5O�A��cLr������]���o�/��'��4����H��յ�-������O�x��T�)�c��[�^��N����5�
�����b��?��(D���SUv��PF�Bz�c:~��>�6n�B�1g�X�ϭg�o-�L7N��klLS�QUU���gX         �   x��;�0@kr
z�l�����6k�Hv��G�b�3o^�ͮ,��(����I�-���Ӗ�Vd�0,�Ԏ��܆�H���1��Z��"'n�GA�g'!E���M��כ�^�渒�S]����Ε�vƨ�VJ� ��3�     