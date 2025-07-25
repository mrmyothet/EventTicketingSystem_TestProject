create table public.tbl_eventcategory
(
    eventcategoryid   varchar   not null
        constraint tbl_eventcategory_pk
            primary key,
    eventcategorycode varchar   not null,
    categoryname      varchar   not null,
    createdby         varchar   not null,
    createdat         timestamp not null,
    modifiedby        varchar,
    modifiedat        timestamp,
    deleteflag        boolean   not null
);

alter table public.tbl_eventcategory
    owner to postgres;

create table public.tbl_businessowner
(
    businessownerid   varchar   not null
        constraint tbl_businessowner_pk
            primary key,
    businessownercode varchar   not null,
    name              varchar   not null,
    email             varchar   not null,
    phonenumber       varchar   not null,
    createdby         varchar   not null,
    createdat         timestamp not null,
    modifiedby        varchar,
    modifiedat        timestamp,
    deleteflag        boolean   not null
);

alter table public.tbl_businessowner
    owner to postgres;

create table public.tbl_businessemail
(
    businessemailid   varchar   not null
        constraint tbl_businessemail_pk
            primary key,
    businessemailcode varchar   not null,
    fullname          varchar   not null,
    phone             varchar   not null,
    email             varchar   not null,
    createdby         varchar   not null,
    createdat         timestamp not null,
    modifiedby        varchar,
    modifiedat        timestamp,
    deleteflag        boolean   not null
);

alter table public.tbl_businessemail
    owner to postgres;

create table public.tbl_ticket
(
    ticketid        varchar   not null
        constraint tbl_ticket_pk
            primary key,
    ticketcode      varchar   not null,
    ticketpricecode varchar   not null,
    isused          boolean   not null,
    createdby       varchar   not null,
    createdat       timestamp not null,
    modifiedby      varchar,
    modifiedat      timestamp,
    deleteflag      boolean   not null
);

alter table public.tbl_ticket
    owner to postgres;

create table public.tbl_ticketprice
(
    ticketpriceid   varchar        not null
        constraint tbl_ticketprice_pk
            primary key,
    ticketpricecode varchar        not null,
    eventcode       varchar        not null,
    tickettypecode  varchar        not null,
    ticketprice     numeric(20, 2) not null,
    ticketquantity  integer        not null,
    createdby       varchar        not null,
    createdat       timestamp      not null,
    modifiedby      varchar,
    modifiedat      timestamp,
    deleteflag      boolean        not null
);

alter table public.tbl_ticketprice
    owner to postgres;

create table public.tbl_tickettype
(
    tickettypeid   varchar   not null
        constraint tbl_tickettype_pk
            primary key,
    tickettypecode varchar   not null,
    tickettypename varchar   not null,
    createdby      varchar   not null,
    createdat      timestamp not null,
    modifiedby     varchar,
    modifiedat     timestamp,
    deleteflag     boolean   not null
);

alter table public.tbl_tickettype
    owner to postgres;

create table public.tbl_transaction
(
    transactionid   varchar        not null
        constraint tbl_transaction_pk
            primary key,
    transactioncode varchar        not null,
    email           varchar        not null,
    eventcode       varchar        not null,
    status          varchar        not null,
    paymenttype     varchar        not null,
    transactiondate timestamp      not null,
    totalamount     numeric(20, 2) not null,
    createdby       varchar        not null,
    createdat       timestamp      not null,
    modifiedby      varchar,
    modifiedat      timestamp,
    deleteflag      boolean        not null
);

alter table public.tbl_transaction
    owner to postgres;

create table public.tbl_venuetype
(
    venuetypeid   varchar   not null
        constraint tbl_venuetype_pk
            primary key,
    venuetypecode varchar   not null,
    venuetypename varchar   not null,
    createdby     varchar   not null,
    createdat     timestamp not null,
    modifiedby    varchar,
    modifiedat    timestamp,
    deleteflag    boolean   not null
);

alter table public.tbl_venuetype
    owner to postgres;

create table public.tbl_event
(
    eventid             varchar   not null
        constraint tbl_event_pk
            primary key,
    eventcode           varchar   not null,
    venuecode           varchar   not null,
    eventname           varchar   not null,
    eventcategorycode   varchar   not null,
    description         text,
    address             varchar   not null,
    startdate           timestamp not null,
    enddate             timestamp not null,
    eventimage          varchar   not null,
    isactive            boolean   not null,
    eventstatus         varchar   not null,
    businessownercode   varchar   not null,
    totalticketquantity integer   not null,
    soldoutcount        integer   not null,
    uniquename          varchar   not null,
    createdby           varchar   not null,
    createdat           timestamp not null,
    modifiedby          varchar,
    modifiedat          timestamp,
    deleteflag          boolean   not null
);

alter table public.tbl_event
    owner to postgres;

create table public.tbl_transactionticket
(
    transactionticketid   varchar        not null
        constraint tbl_transactionticket_pk
            primary key,
    transactionticketcode varchar        not null,
    transactioncode       varchar        not null,
    ticketcode            varchar        not null,
    qrimage               varchar        not null,
    price                 numeric(20, 2) not null,
    createdby             varchar        not null,
    createdat             timestamp      not null,
    modifiedby            varchar,
    modifiedat            timestamp,
    deleteflag            boolean        not null
);

alter table public.tbl_transactionticket
    owner to postgres;

create table public.tbl_verification
(
    verificationid   varchar   not null
        constraint tbl_verification_pk
            primary key,
    verificationcode varchar   not null,
    email            varchar   not null,
    expiredtime      timestamp not null,
    isused           boolean   not null,
    createdby        varchar   not null,
    createdat        timestamp not null,
    modifiedby       varchar,
    modifiedat       timestamp,
    deleteflag       boolean   not null
);

alter table public.tbl_verification
    owner to postgres;

create table public.tbl_sequence
(
    sequenceid   integer generated by default as identity
        constraint tbl_sequence_pk
            primary key,
    uniquename   varchar   not null,
    sequenceno   varchar   not null,
    sequencedate timestamp not null,
    sequencetype varchar   not null,
    eventcode    varchar,
    deleteflag   boolean   not null
);

alter table public.tbl_sequence
    owner to postgres;

create table public.tbl_venue
(
    venueid       varchar   not null
        constraint tbl_venue_pk
            primary key,
    venuecode     varchar   not null,
    venuetypecode varchar   not null,
    venuename     varchar   not null,
    description   text,
    address       varchar   not null,
    capacity      integer   not null,
    facilities    text,
    addons        text,
    venueimage    varchar   not null,
    createdby     varchar   not null,
    createdat     timestamp not null,
    modifiedby    varchar,
    modifiedat    timestamp,
    deleteflag    boolean   not null
);

alter table public.tbl_venue
    owner to postgres;

create table public.tbl_admin
(
    adminid      varchar   not null
        constraint tbl_admin_pk
            primary key,
    admincode    varchar   not null,
    username     varchar   not null,
    email        varchar   not null,
    phoneno      varchar   not null,
    password     varchar   not null,
    profileimage varchar   not null,
    createdby    varchar   not null,
    createdat    timestamp not null,
    modifiedby   varchar,
    modifiedat   timestamp,
    deleteflag   boolean   not null
);

alter table public.tbl_admin
    owner to postgres;

create function public.sp_sequencecode(id integer) returns character varying
    language plpgsql
as
$$
DECLARE
    value int;
    incremented_value varchar(6);
BEGIN
    SELECT sequenceno::int + 1 INTO value
    FROM tbl_sequence
    WHERE sequenceid = id
    AND deleteflag = false;

    incremented_value := LPAD(value::text, 6, '0');

    UPDATE tbl_sequence
    SET sequenceno = incremented_value,
        sequencedate = now()
    WHERE sequenceid = id
    AND deleteflag = false;

    RETURN incremented_value;
END;
$$;

alter function public.sp_sequencecode(integer) owner to postgres;


INSERT INTO public.tbl_sequence (uniquename, sequenceno, sequencedate, sequencetype, eventcode, deleteflag) VALUES ('EC', '000000', '2025-07-17 03:34:58.000000', 'Table', null, false);
INSERT INTO public.tbl_sequence (uniquename, sequenceno, sequencedate, sequencetype, eventcode, deleteflag) VALUES ('BO', '000000', '2025-07-17 03:34:58.000000', 'Table', null, false);
INSERT INTO public.tbl_sequence (uniquename, sequenceno, sequencedate, sequencetype, eventcode, deleteflag) VALUES ('AD', '000000', '2025-07-17 03:34:58.000000', 'Table', null, false);
INSERT INTO public.tbl_sequence (uniquename, sequenceno, sequencedate, sequencetype, eventcode, deleteflag) VALUES ('TT', '000000', '2025-07-17 03:34:58.000000', 'Table', null, false);
INSERT INTO public.tbl_sequence (uniquename, sequenceno, sequencedate, sequencetype, eventcode, deleteflag) VALUES ('VT', '000000', '2025-07-17 03:34:58.000000', 'Table', null, false);
INSERT INTO public.tbl_sequence (uniquename, sequenceno, sequencedate, sequencetype, eventcode, deleteflag) VALUES ('TC', '000000', '2025-07-17 03:34:58.000000', 'Table', null, false);
INSERT INTO public.tbl_sequence (uniquename, sequenceno, sequencedate, sequencetype, eventcode, deleteflag) VALUES ('TI', '000000', '2025-07-17 03:34:58.000000', 'Table', null, false);
INSERT INTO public.tbl_sequence (uniquename, sequenceno, sequencedate, sequencetype, eventcode, deleteflag) VALUES ('TR', '000000', '2025-07-17 03:34:58.000000', 'Table', null, false);
INSERT INTO public.tbl_sequence (uniquename, sequenceno, sequencedate, sequencetype, eventcode, deleteflag) VALUES ('VE', '000000', '2025-07-17 03:34:58.000000', 'Table', null, false);
INSERT INTO public.tbl_sequence (uniquename, sequenceno, sequencedate, sequencetype, eventcode, deleteflag) VALUES ('EV', '000000', '2025-07-17 03:34:58.000000', 'Table', null, false);
INSERT INTO public.tbl_sequence (uniquename, sequenceno, sequencedate, sequencetype, eventcode, deleteflag) VALUES ('VC', '000000', '2025-07-17 03:34:58.000000', 'Table', null, false);
INSERT INTO public.tbl_sequence (uniquename, sequenceno, sequencedate, sequencetype, eventcode, deleteflag) VALUES ('TP', '000000', '2025-07-17 03:34:58.000000', 'Table', null, false);
INSERT INTO public.tbl_sequence (uniquename, sequenceno, sequencedate, sequencetype, eventcode, deleteflag) VALUES ('BE', '000000', '2025-07-17 03:34:58.000000', 'Table', null, false);
