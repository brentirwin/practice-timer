/* Practice segments */

create table segment (
  piece_id integer not null,    -- fk: piece.rowid
  start_time text not null,     -- datetime
  end_time text not null,       -- datetime
  section_id integer not null,  -- fk: enum_section.id
    -- current value of piece.status at time of creation
  tempo integer,
  measure_first integer,
  measure_last integer,
  notes text
);

/* Pieces */

create table piece (
  title text not null,
  composer text,
  opus text,
  era_id integer,   -- fk: enum_era.id
  notes text,
  rcm text,
  status integer    -- fk: enum_section.id
);

/* Practice sections (enumerated table) */

create table enum_section (
  id integer primary key,
  name text not null
) without rowid;

insert into enum_section values (0, 'technique');
insert into enum_section values (1, 'étude');
insert into enum_section values (2, 'musicianship');
insert into enum_section values (3, 'learning');
insert into enum_section values (4, 'repertoire');
insert into enum_section values (5, 'free-play');

/* Eras (enumerated table) */

create table enum_era (
  id integer primary key,
  name text not null
) without rowid;

insert into enum_era values (0, 'baroque');
insert into enum_era values (1, 'classical');
insert into enum_era values (2, 'romantic');
insert into enum_era values (3, 'modern');
insert into enum_era values (4, 'pop');

/* Constant non-pieces in piece table */

insert into piece (title, status)
  values ('scales, chords, & arpeggios', 0);
insert into piece (title, status)
  values ('sight reading & ear training', 2);
insert into piece (title, status)
  values ('free play', 5);
