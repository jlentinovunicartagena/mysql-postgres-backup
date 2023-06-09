PGDMP         %                {            db_juan_lentino_app_cine    14.7    14.7 4    3           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            4           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            5           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            6           1262    16860    db_juan_lentino_app_cine    DATABASE     w   CREATE DATABASE db_juan_lentino_app_cine WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Colombia.1252';
 (   DROP DATABASE db_juan_lentino_app_cine;
                postgres    false            �            1259    16881    actores    TABLE     0  CREATE TABLE public.actores (
    nombre character varying(255) NOT NULL,
    nacionalidad character varying(255) NOT NULL,
    esdirector boolean NOT NULL,
    cantidadpeliculasdirigas integer DEFAULT 0 NOT NULL,
    esactor boolean NOT NULL,
    cantidadpeliculasactuadas integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.actores;
       public         heap    postgres    false            �            1259    16907    cines    TABLE     �   CREATE TABLE public.cines (
    nombre character varying(255) NOT NULL,
    direccion character varying(255) NOT NULL,
    telefono integer NOT NULL
);
    DROP TABLE public.cines;
       public         heap    postgres    false            �            1259    16953 	   funciones    TABLE       CREATE TABLE public.funciones (
    id integer NOT NULL,
    dia character varying(30) NOT NULL,
    hora time without time zone NOT NULL,
    pelicula_id integer NOT NULL,
    sala_id integer NOT NULL,
    promocion_id integer NOT NULL,
    CONSTRAINT funciones_dia_check CHECK (((dia)::text = ANY ((ARRAY['Lunes'::character varying, 'Martes'::character varying, 'Miercoles'::character varying, 'Jueves'::character varying, 'Viernes'::character varying, 'Sabado'::character varying, 'Domingo'::character varying])::text[])))
);
    DROP TABLE public.funciones;
       public         heap    postgres    false            �            1259    16952    funciones_id_seq    SEQUENCE     �   CREATE SEQUENCE public.funciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.funciones_id_seq;
       public          postgres    false    222            7           0    0    funciones_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.funciones_id_seq OWNED BY public.funciones.id;
          public          postgres    false    221            �            1259    16938 	   opiniones    TABLE       CREATE TABLE public.opiniones (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    edad integer NOT NULL,
    fecha timestamp without time zone NOT NULL,
    calificacion character varying(20) NOT NULL,
    comentario text NOT NULL,
    pelicula_id integer NOT NULL,
    CONSTRAINT opiniones_calificacion_check CHECK (((calificacion)::text = ANY ((ARRAY['Obra Maestra'::character varying, 'Muy Buena'::character varying, 'Buena'::character varying, 'Regular'::character varying, 'Mala'::character varying])::text[])))
);
    DROP TABLE public.opiniones;
       public         heap    postgres    false            �            1259    16937    opiniones_id_seq    SEQUENCE     �   CREATE SEQUENCE public.opiniones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.opiniones_id_seq;
       public          postgres    false    220            8           0    0    opiniones_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.opiniones_id_seq OWNED BY public.opiniones.id;
          public          postgres    false    219            �            1259    16872 	   peliculas    TABLE     K  CREATE TABLE public.peliculas (
    id integer NOT NULL,
    titulooriginal character varying(255) NOT NULL,
    titulodistribucion character varying(255) NOT NULL,
    genero character varying(255) NOT NULL,
    idioma character varying(255) NOT NULL,
    subtitulos boolean NOT NULL,
    url character varying(255) NOT NULL,
    duracion time without time zone NOT NULL,
    resumen text NOT NULL,
    clasificacion character varying(255) NOT NULL,
    "a¤oproduccion" integer NOT NULL,
    paisesorigen character varying(255) NOT NULL,
    fechaestrenosantiago timestamp without time zone NOT NULL,
    CONSTRAINT peliculas_clasificacion_check CHECK (((clasificacion)::text = ANY ((ARRAY['Apta todo p£blico'::character varying, '+9 a¤os'::character varying, '+15 a¤os'::character varying, '+18 a¤os'::character varying])::text[])))
);
    DROP TABLE public.peliculas;
       public         heap    postgres    false            �            1259    16891    peliculas_actores    TABLE     �   CREATE TABLE public.peliculas_actores (
    id integer NOT NULL,
    pelicula_id integer NOT NULL,
    actor_id character varying(255) NOT NULL
);
 %   DROP TABLE public.peliculas_actores;
       public         heap    postgres    false            �            1259    16890    peliculas_actores_id_seq    SEQUENCE     �   CREATE SEQUENCE public.peliculas_actores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.peliculas_actores_id_seq;
       public          postgres    false    213            9           0    0    peliculas_actores_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.peliculas_actores_id_seq OWNED BY public.peliculas_actores.id;
          public          postgres    false    212            �            1259    16871    peliculas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.peliculas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.peliculas_id_seq;
       public          postgres    false    210            :           0    0    peliculas_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.peliculas_id_seq OWNED BY public.peliculas.id;
          public          postgres    false    209            �            1259    16929    promociones    TABLE     |   CREATE TABLE public.promociones (
    id integer NOT NULL,
    descripcion text NOT NULL,
    descuento integer NOT NULL
);
    DROP TABLE public.promociones;
       public         heap    postgres    false            �            1259    16928    promociones_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promociones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.promociones_id_seq;
       public          postgres    false    218            ;           0    0    promociones_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.promociones_id_seq OWNED BY public.promociones.id;
          public          postgres    false    217            �            1259    16915    salas    TABLE     �   CREATE TABLE public.salas (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    cantidadbutacas integer NOT NULL,
    cine_id character varying(255) NOT NULL
);
    DROP TABLE public.salas;
       public         heap    postgres    false            �            1259    16914    salas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.salas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.salas_id_seq;
       public          postgres    false    216            <           0    0    salas_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.salas_id_seq OWNED BY public.salas.id;
          public          postgres    false    215            �           2604    16956    funciones id    DEFAULT     l   ALTER TABLE ONLY public.funciones ALTER COLUMN id SET DEFAULT nextval('public.funciones_id_seq'::regclass);
 ;   ALTER TABLE public.funciones ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    16941    opiniones id    DEFAULT     l   ALTER TABLE ONLY public.opiniones ALTER COLUMN id SET DEFAULT nextval('public.opiniones_id_seq'::regclass);
 ;   ALTER TABLE public.opiniones ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            }           2604    16875    peliculas id    DEFAULT     l   ALTER TABLE ONLY public.peliculas ALTER COLUMN id SET DEFAULT nextval('public.peliculas_id_seq'::regclass);
 ;   ALTER TABLE public.peliculas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    16894    peliculas_actores id    DEFAULT     |   ALTER TABLE ONLY public.peliculas_actores ALTER COLUMN id SET DEFAULT nextval('public.peliculas_actores_id_seq'::regclass);
 C   ALTER TABLE public.peliculas_actores ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            �           2604    16932    promociones id    DEFAULT     p   ALTER TABLE ONLY public.promociones ALTER COLUMN id SET DEFAULT nextval('public.promociones_id_seq'::regclass);
 =   ALTER TABLE public.promociones ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    16918    salas id    DEFAULT     d   ALTER TABLE ONLY public.salas ALTER COLUMN id SET DEFAULT nextval('public.salas_id_seq'::regclass);
 7   ALTER TABLE public.salas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2606    16889    actores actores_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.actores
    ADD CONSTRAINT actores_pkey PRIMARY KEY (nombre);
 >   ALTER TABLE ONLY public.actores DROP CONSTRAINT actores_pkey;
       public            postgres    false    211            �           2606    16913    cines cines_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cines
    ADD CONSTRAINT cines_pkey PRIMARY KEY (nombre);
 :   ALTER TABLE ONLY public.cines DROP CONSTRAINT cines_pkey;
       public            postgres    false    214            �           2606    16959    funciones funciones_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.funciones
    ADD CONSTRAINT funciones_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.funciones DROP CONSTRAINT funciones_pkey;
       public            postgres    false    222            �           2606    16946    opiniones opiniones_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.opiniones
    ADD CONSTRAINT opiniones_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.opiniones DROP CONSTRAINT opiniones_pkey;
       public            postgres    false    220            �           2606    16896 (   peliculas_actores peliculas_actores_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.peliculas_actores
    ADD CONSTRAINT peliculas_actores_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.peliculas_actores DROP CONSTRAINT peliculas_actores_pkey;
       public            postgres    false    213            �           2606    16880    peliculas peliculas_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.peliculas
    ADD CONSTRAINT peliculas_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.peliculas DROP CONSTRAINT peliculas_pkey;
       public            postgres    false    210            �           2606    16936    promociones promociones_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.promociones
    ADD CONSTRAINT promociones_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.promociones DROP CONSTRAINT promociones_pkey;
       public            postgres    false    218            �           2606    16922    salas salas_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.salas
    ADD CONSTRAINT salas_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.salas DROP CONSTRAINT salas_pkey;
       public            postgres    false    216            �           2606    16980    peliculas_actores fk_actor_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.peliculas_actores
    ADD CONSTRAINT fk_actor_id FOREIGN KEY (actor_id) REFERENCES public.actores(nombre) ON UPDATE CASCADE ON DELETE RESTRICT;
 G   ALTER TABLE ONLY public.peliculas_actores DROP CONSTRAINT fk_actor_id;
       public          postgres    false    213    211    3211            �           2606    16985    salas fk_cine_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.salas
    ADD CONSTRAINT fk_cine_id FOREIGN KEY (cine_id) REFERENCES public.cines(nombre) ON UPDATE CASCADE ON DELETE RESTRICT;
 :   ALTER TABLE ONLY public.salas DROP CONSTRAINT fk_cine_id;
       public          postgres    false    214    3215    216            �           2606    16975     peliculas_actores fk_pelicula_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.peliculas_actores
    ADD CONSTRAINT fk_pelicula_id FOREIGN KEY (pelicula_id) REFERENCES public.peliculas(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 J   ALTER TABLE ONLY public.peliculas_actores DROP CONSTRAINT fk_pelicula_id;
       public          postgres    false    3209    213    210            �           2606    16990    opiniones fk_pelicula_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.opiniones
    ADD CONSTRAINT fk_pelicula_id FOREIGN KEY (pelicula_id) REFERENCES public.peliculas(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 B   ALTER TABLE ONLY public.opiniones DROP CONSTRAINT fk_pelicula_id;
       public          postgres    false    210    3209    220            �           2606    16995    funciones fk_pelicula_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.funciones
    ADD CONSTRAINT fk_pelicula_id FOREIGN KEY (pelicula_id) REFERENCES public.peliculas(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 B   ALTER TABLE ONLY public.funciones DROP CONSTRAINT fk_pelicula_id;
       public          postgres    false    210    3209    222            �           2606    17005    funciones fk_promocion_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.funciones
    ADD CONSTRAINT fk_promocion_id FOREIGN KEY (promocion_id) REFERENCES public.promociones(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 C   ALTER TABLE ONLY public.funciones DROP CONSTRAINT fk_promocion_id;
       public          postgres    false    222    218    3219            �           2606    17000    funciones fk_sala_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.funciones
    ADD CONSTRAINT fk_sala_id FOREIGN KEY (sala_id) REFERENCES public.salas(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 >   ALTER TABLE ONLY public.funciones DROP CONSTRAINT fk_sala_id;
       public          postgres    false    222    3217    216            �           2606    16960 $   funciones funciones_pelicula_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.funciones
    ADD CONSTRAINT funciones_pelicula_id_fkey FOREIGN KEY (pelicula_id) REFERENCES public.peliculas(id);
 N   ALTER TABLE ONLY public.funciones DROP CONSTRAINT funciones_pelicula_id_fkey;
       public          postgres    false    3209    210    222            �           2606    16970 %   funciones funciones_promocion_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.funciones
    ADD CONSTRAINT funciones_promocion_id_fkey FOREIGN KEY (promocion_id) REFERENCES public.promociones(id);
 O   ALTER TABLE ONLY public.funciones DROP CONSTRAINT funciones_promocion_id_fkey;
       public          postgres    false    3219    222    218            �           2606    16965     funciones funciones_sala_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.funciones
    ADD CONSTRAINT funciones_sala_id_fkey FOREIGN KEY (sala_id) REFERENCES public.salas(id);
 J   ALTER TABLE ONLY public.funciones DROP CONSTRAINT funciones_sala_id_fkey;
       public          postgres    false    222    216    3217            �           2606    16947 $   opiniones opiniones_pelicula_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.opiniones
    ADD CONSTRAINT opiniones_pelicula_id_fkey FOREIGN KEY (pelicula_id) REFERENCES public.peliculas(id);
 N   ALTER TABLE ONLY public.opiniones DROP CONSTRAINT opiniones_pelicula_id_fkey;
       public          postgres    false    3209    210    220            �           2606    16902 1   peliculas_actores peliculas_actores_actor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.peliculas_actores
    ADD CONSTRAINT peliculas_actores_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actores(nombre);
 [   ALTER TABLE ONLY public.peliculas_actores DROP CONSTRAINT peliculas_actores_actor_id_fkey;
       public          postgres    false    213    3211    211            �           2606    16897 4   peliculas_actores peliculas_actores_pelicula_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.peliculas_actores
    ADD CONSTRAINT peliculas_actores_pelicula_id_fkey FOREIGN KEY (pelicula_id) REFERENCES public.peliculas(id);
 ^   ALTER TABLE ONLY public.peliculas_actores DROP CONSTRAINT peliculas_actores_pelicula_id_fkey;
       public          postgres    false    3209    213    210            �           2606    16923    salas salas_cine_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.salas
    ADD CONSTRAINT salas_cine_id_fkey FOREIGN KEY (cine_id) REFERENCES public.cines(nombre);
 B   ALTER TABLE ONLY public.salas DROP CONSTRAINT salas_cine_id_fkey;
       public          postgres    false    214    216    3215           