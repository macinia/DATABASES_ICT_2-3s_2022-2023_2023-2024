PGDMP                  
    {            Bank    16.1    16.1 A               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16607    Bank    DATABASE     z   CREATE DATABASE "Bank" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Bank";
                postgres    false                        2615    16608    Bank    SCHEMA        CREATE SCHEMA "Bank";
    DROP SCHEMA "Bank";
                postgres    false            �            1259    16609    Accruals    TABLE       CREATE TABLE "Bank"."Accruals" (
    payments integer NOT NULL,
    id_accruals integer NOT NULL,
    actual_date_payments date,
    planned_date_payments date NOT NULL,
    contarct_number integer NOT NULL,
    CONSTRAINT paymentscheck1 CHECK ((payments > 0))
);
    DROP TABLE "Bank"."Accruals";
       Bank         heap    postgres    false    6            �            1259    16613    Client    TABLE     p  CREATE TABLE "Bank"."Client" (
    paasport_number character varying(10) NOT NULL,
    address character varying(250) NOT NULL,
    phone_number character varying(20) NOT NULL,
    "Full_name" character varying(250) NOT NULL,
    email character varying(250),
    "ID_client" integer NOT NULL,
    age smallint NOT NULL,
    CONSTRAINT age_check CHECK ((age > 17))
);
    DROP TABLE "Bank"."Client";
       Bank         heap    postgres    false    6            �            1259    16619    Credit    TABLE        CREATE TABLE "Bank"."Credit" (
    contact_number integer NOT NULL,
    loan_date date NOT NULL,
    actual_loan_closing_date date,
    planned_loan_closing_date date NOT NULL,
    initial_loan_amount integer NOT NULL,
    current_debt integer NOT NULL,
    "ID_employee" integer NOT NULL,
    "ID_client" integer NOT NULL,
    currency_code integer NOT NULL,
    credit_code integer NOT NULL,
    status1 character varying NOT NULL,
    CONSTRAINT closing_date CHECK ((actual_loan_closing_date > loan_date))
);
    DROP TABLE "Bank"."Credit";
       Bank         heap    postgres    false    6            �            1259    16625    Currency    TABLE     �   CREATE TABLE "Bank"."Currency" (
    currency_code integer NOT NULL,
    country character varying(30) NOT NULL,
    name character varying(20) NOT NULL
);
    DROP TABLE "Bank"."Currency";
       Bank         heap    postgres    false    6            �            1259    16628    Deposit    TABLE     !  CREATE TABLE "Bank"."Deposit" (
    contarct_number integer NOT NULL,
    loan_date date NOT NULL,
    actual_date_of_closing_deposit date,
    planned_date_of_closing_deposit date NOT NULL,
    percent integer NOT NULL,
    initial_deposit_amount integer NOT NULL,
    deposit_amount integer NOT NULL,
    currency_code integer NOT NULL,
    "ID_client" integer NOT NULL,
    deposit_code integer NOT NULL,
    data_deposit_accrual integer NOT NULL,
    "ID_employee" integer NOT NULL,
    "ID_accruals" integer NOT NULL,
    status integer
);
    DROP TABLE "Bank"."Deposit";
       Bank         heap    postgres    false    6            �            1259    16631    Deposits_directory    TABLE       CREATE TABLE "Bank"."Deposits_directory" (
    "Deposit_code" integer NOT NULL,
    "Description" character varying NOT NULL,
    type character varying NOT NULL,
    percent integer NOT NULL,
    min_amount_deposit_ integer NOT NULL,
    min_deposit_period integer NOT NULL,
    CONSTRAINT min_amount_deposit_check1 CHECK ((min_amount_deposit_ > 0)),
    CONSTRAINT min_deposit_period CHECK ((min_deposit_period > 0)),
    CONSTRAINT "percent check1" CHECK ((percent > 0)),
    CONSTRAINT "percent check12" CHECK ((percent < 100))
);
 (   DROP TABLE "Bank"."Deposits_directory";
       Bank         heap    postgres    false    6            �            1259    16640    Employee    TABLE     C  CREATE TABLE "Bank"."Employee" (
    "ID_employee" integer NOT NULL,
    age smallint NOT NULL,
    code_job integer NOT NULL,
    paasport_number character varying(10) NOT NULL,
    phone_nimber character varying(20) NOT NULL,
    "Full_name" character varying(50) NOT NULL,
    address character varying(100) NOT NULL
);
    DROP TABLE "Bank"."Employee";
       Bank         heap    postgres    false    6            �            1259    16643    Job_directory    TABLE     �   CREATE TABLE "Bank"."Job_directory" (
    code_job integer NOT NULL,
    salary integer,
    name character varying(250) NOT NULL
);
 #   DROP TABLE "Bank"."Job_directory";
       Bank         heap    postgres    false    6            �            1259    16646    credit_directory    TABLE     �   CREATE TABLE "Bank".credit_directory (
    credit_code integer NOT NULL,
    percent integer NOT NULL,
    desription character varying NOT NULL,
    type character varying NOT NULL,
    min_amount_credit integer NOT NULL
);
 $   DROP TABLE "Bank".credit_directory;
       Bank         heap    postgres    false    6            �            1259    16651    payments_timetable    TABLE     �   CREATE TABLE "Bank".payments_timetable (
    "ID_payments_timetable" integer NOT NULL,
    payment_amount integer NOT NULL,
    actual_date_payments date NOT NULL,
    planned_data_payment date NOT NULL,
    contarct_number integer NOT NULL
);
 &   DROP TABLE "Bank".payments_timetable;
       Bank         heap    postgres    false    6                      0    16609    Accruals 
   TABLE DATA                 Bank          postgres    false    216   U                 0    16613    Client 
   TABLE DATA                 Bank          postgres    false    217   2V                 0    16619    Credit 
   TABLE DATA                 Bank          postgres    false    218   qX                 0    16625    Currency 
   TABLE DATA                 Bank          postgres    false    219   �Y                 0    16628    Deposit 
   TABLE DATA                 Bank          postgres    false    220   �Z                 0    16631    Deposits_directory 
   TABLE DATA                 Bank          postgres    false    221   �\                 0    16640    Employee 
   TABLE DATA                 Bank          postgres    false    222   �]                 0    16643    Job_directory 
   TABLE DATA                 Bank          postgres    false    223   �^                 0    16646    credit_directory 
   TABLE DATA                 Bank          postgres    false    224   �_                 0    16651    payments_timetable 
   TABLE DATA                 Bank          postgres    false    225   �`       O           2606    16654    Employee AGE_CHECK    CHECK CONSTRAINT     [   ALTER TABLE "Bank"."Employee"
    ADD CONSTRAINT "AGE_CHECK" CHECK ((age > 17)) NOT VALID;
 ;   ALTER TABLE "Bank"."Employee" DROP CONSTRAINT "AGE_CHECK";
       Bank          postgres    false    222    222            U           2606    16656    Client Client_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY "Bank"."Client"
    ADD CONSTRAINT "Client_pkey" PRIMARY KEY (paasport_number);
 @   ALTER TABLE ONLY "Bank"."Client" DROP CONSTRAINT "Client_pkey";
       Bank            postgres    false    217            ]           2606    16658    Currency Currency_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY "Bank"."Currency"
    ADD CONSTRAINT "Currency_pkey" PRIMARY KEY (currency_code);
 D   ALTER TABLE ONLY "Bank"."Currency" DROP CONSTRAINT "Currency_pkey";
       Bank            postgres    false    219            a           2606    16660    Deposit Deposit_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY "Bank"."Deposit"
    ADD CONSTRAINT "Deposit_pkey" PRIMARY KEY (contarct_number);
 B   ALTER TABLE ONLY "Bank"."Deposit" DROP CONSTRAINT "Deposit_pkey";
       Bank            postgres    false    220            e           2606    16662 *   Deposits_directory Deposits_directory_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY "Bank"."Deposits_directory"
    ADD CONSTRAINT "Deposits_directory_pkey" PRIMARY KEY ("Deposit_code");
 X   ALTER TABLE ONLY "Bank"."Deposits_directory" DROP CONSTRAINT "Deposits_directory_pkey";
       Bank            postgres    false    221            g           2606    16664    Employee Employee_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY "Bank"."Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY ("ID_employee");
 D   ALTER TABLE ONLY "Bank"."Employee" DROP CONSTRAINT "Employee_pkey";
       Bank            postgres    false    222            S           2606    16666    Accruals U_ID_accruals 
   CONSTRAINT     a   ALTER TABLE ONLY "Bank"."Accruals"
    ADD CONSTRAINT "U_ID_accruals" PRIMARY KEY (id_accruals);
 D   ALTER TABLE ONLY "Bank"."Accruals" DROP CONSTRAINT "U_ID_accruals";
       Bank            postgres    false    216            W           2606    16668    Client U_ID_client 
   CONSTRAINT     X   ALTER TABLE ONLY "Bank"."Client"
    ADD CONSTRAINT "U_ID_client" UNIQUE ("ID_client");
 @   ALTER TABLE ONLY "Bank"."Client" DROP CONSTRAINT "U_ID_client";
       Bank            postgres    false    217            i           2606    16670    Employee U_ID_emp 
   CONSTRAINT     Y   ALTER TABLE ONLY "Bank"."Employee"
    ADD CONSTRAINT "U_ID_emp" UNIQUE ("ID_employee");
 ?   ALTER TABLE ONLY "Bank"."Employee" DROP CONSTRAINT "U_ID_emp";
       Bank            postgres    false    222            _           2606    16672    Currency U_code_currency 
   CONSTRAINT     `   ALTER TABLE ONLY "Bank"."Currency"
    ADD CONSTRAINT "U_code_currency" UNIQUE (currency_code);
 F   ALTER TABLE ONLY "Bank"."Currency" DROP CONSTRAINT "U_code_currency";
       Bank            postgres    false    219            k           2606    16674    Job_directory U_code_job 
   CONSTRAINT     [   ALTER TABLE ONLY "Bank"."Job_directory"
    ADD CONSTRAINT "U_code_job" UNIQUE (code_job);
 F   ALTER TABLE ONLY "Bank"."Job_directory" DROP CONSTRAINT "U_code_job";
       Bank            postgres    false    223            Y           2606    16676    Credit U_contact_number 
   CONSTRAINT     `   ALTER TABLE ONLY "Bank"."Credit"
    ADD CONSTRAINT "U_contact_number" UNIQUE (contact_number);
 E   ALTER TABLE ONLY "Bank"."Credit" DROP CONSTRAINT "U_contact_number";
       Bank            postgres    false    218            c           2606    16678    Deposit U_contrant_number 
   CONSTRAINT     c   ALTER TABLE ONLY "Bank"."Deposit"
    ADD CONSTRAINT "U_contrant_number" UNIQUE (contarct_number);
 G   ALTER TABLE ONLY "Bank"."Deposit" DROP CONSTRAINT "U_contrant_number";
       Bank            postgres    false    220            Q           2606    16679 -   payments_timetable actual_date_payments_check    CHECK CONSTRAINT     �   ALTER TABLE "Bank".payments_timetable
    ADD CONSTRAINT actual_date_payments_check CHECK ((actual_date_payments >= planned_data_payment)) NOT VALID;
 R   ALTER TABLE "Bank".payments_timetable DROP CONSTRAINT actual_date_payments_check;
       Bank          postgres    false    225    225    225    225            P           2606    16680    Job_directory check_salary    CHECK CONSTRAINT     o   ALTER TABLE "Bank"."Job_directory"
    ADD CONSTRAINT check_salary CHECK ((salary > '-1'::integer)) NOT VALID;
 A   ALTER TABLE "Bank"."Job_directory" DROP CONSTRAINT check_salary;
       Bank          postgres    false    223    223            [           2606    16682    Credit contract_number 
   CONSTRAINT     b   ALTER TABLE ONLY "Bank"."Credit"
    ADD CONSTRAINT contract_number PRIMARY KEY (contact_number);
 B   ALTER TABLE ONLY "Bank"."Credit" DROP CONSTRAINT contract_number;
       Bank            postgres    false    218            o           2606    16684 &   credit_directory credit_directory_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY "Bank".credit_directory
    ADD CONSTRAINT credit_directory_pkey PRIMARY KEY (credit_code);
 P   ALTER TABLE ONLY "Bank".credit_directory DROP CONSTRAINT credit_directory_pkey;
       Bank            postgres    false    224            A           2606    16685    Credit current_debtcheck    CHECK CONSTRAINT     h   ALTER TABLE "Bank"."Credit"
    ADD CONSTRAINT current_debtcheck CHECK ((current_debt >= 0)) NOT VALID;
 ?   ALTER TABLE "Bank"."Credit" DROP CONSTRAINT current_debtcheck;
       Bank          postgres    false    218    218            D           2606    16686 #   Deposit data_deposit_accrual_check1    CHECK CONSTRAINT     z   ALTER TABLE "Bank"."Deposit"
    ADD CONSTRAINT data_deposit_accrual_check1 CHECK ((data_deposit_accrual > 0)) NOT VALID;
 J   ALTER TABLE "Bank"."Deposit" DROP CONSTRAINT data_deposit_accrual_check1;
       Bank          postgres    false    220    220            E           2606    16687 #   Deposit data_deposit_accrual_check2    CHECK CONSTRAINT     {   ALTER TABLE "Bank"."Deposit"
    ADD CONSTRAINT data_deposit_accrual_check2 CHECK ((data_deposit_accrual < 29)) NOT VALID;
 J   ALTER TABLE "Bank"."Deposit" DROP CONSTRAINT data_deposit_accrual_check2;
       Bank          postgres    false    220    220            F           2606    16688    Deposit deposit_amount_check    CHECK CONSTRAINT     n   ALTER TABLE "Bank"."Deposit"
    ADD CONSTRAINT deposit_amount_check CHECK ((deposit_amount >= 0)) NOT VALID;
 C   ALTER TABLE "Bank"."Deposit" DROP CONSTRAINT deposit_amount_check;
       Bank          postgres    false    220    220            G           2606    16689    Deposit initial_ammount_check    CHECK CONSTRAINT     v   ALTER TABLE "Bank"."Deposit"
    ADD CONSTRAINT initial_ammount_check CHECK ((initial_deposit_amount > 0)) NOT VALID;
 D   ALTER TABLE "Bank"."Deposit" DROP CONSTRAINT initial_ammount_check;
       Bank          postgres    false    220    220            B           2606    16690     Credit initial_loan_amountcheck1    CHECK CONSTRAINT     v   ALTER TABLE "Bank"."Credit"
    ADD CONSTRAINT initial_loan_amountcheck1 CHECK ((initial_loan_amount > 0)) NOT VALID;
 G   ALTER TABLE "Bank"."Credit" DROP CONSTRAINT initial_loan_amountcheck1;
       Bank          postgres    false    218    218            m           2606    16694     Job_directory job_directory_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY "Bank"."Job_directory"
    ADD CONSTRAINT job_directory_pkey PRIMARY KEY (code_job);
 L   ALTER TABLE ONLY "Bank"."Job_directory" DROP CONSTRAINT job_directory_pkey;
       Bank            postgres    false    223            q           2606    16698 *   payments_timetable payments_timetable_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY "Bank".payments_timetable
    ADD CONSTRAINT payments_timetable_pkey PRIMARY KEY ("ID_payments_timetable");
 T   ALTER TABLE ONLY "Bank".payments_timetable DROP CONSTRAINT payments_timetable_pkey;
       Bank            postgres    false    225            H           2606    16700    Deposit percent_check1    CHECK CONSTRAINT     `   ALTER TABLE "Bank"."Deposit"
    ADD CONSTRAINT percent_check1 CHECK ((0 < percent)) NOT VALID;
 =   ALTER TABLE "Bank"."Deposit" DROP CONSTRAINT percent_check1;
       Bank          postgres    false    220    220            I           2606    16701    Deposit percent_check2    CHECK CONSTRAINT     b   ALTER TABLE "Bank"."Deposit"
    ADD CONSTRAINT percent_check2 CHECK ((percent < 100)) NOT VALID;
 =   ALTER TABLE "Bank"."Deposit" DROP CONSTRAINT percent_check2;
       Bank          postgres    false    220    220            J           2606    16702    Deposit statuscheck    CHECK CONSTRAINT     o   ALTER TABLE "Bank"."Deposit"
    ADD CONSTRAINT statuscheck CHECK (((status < 5) AND (status > 0))) NOT VALID;
 :   ALTER TABLE "Bank"."Deposit" DROP CONSTRAINT statuscheck;
       Bank          postgres    false    220    220            C           2606    16703    Credit statuscheck1    CHECK CONSTRAINT     �   ALTER TABLE "Bank"."Credit"
    ADD CONSTRAINT statuscheck1 CHECK (((status1)::text = ANY (ARRAY[('Active'::character varying)::text, ('Finished'::character varying)::text]))) NOT VALID;
 :   ALTER TABLE "Bank"."Credit" DROP CONSTRAINT statuscheck1;
       Bank          postgres    false    218    218            {           2606    16704    Employee Employee_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank"."Employee"
    ADD CONSTRAINT "Employee_fkey" FOREIGN KEY (code_job) REFERENCES "Bank"."Job_directory"(code_job) NOT VALID;
 D   ALTER TABLE ONLY "Bank"."Employee" DROP CONSTRAINT "Employee_fkey";
       Bank          postgres    false    223    222    4715            w           2606    16709    Deposit ID_client_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank"."Deposit"
    ADD CONSTRAINT "ID_client_fkey" FOREIGN KEY ("ID_client") REFERENCES "Bank"."Client"("ID_client") NOT VALID;
 D   ALTER TABLE ONLY "Bank"."Deposit" DROP CONSTRAINT "ID_client_fkey";
       Bank          postgres    false    217    4695    220            s           2606    16714    Credit ID_client_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank"."Credit"
    ADD CONSTRAINT "ID_client_fkey" FOREIGN KEY ("ID_client") REFERENCES "Bank"."Client"("ID_client") NOT VALID;
 C   ALTER TABLE ONLY "Bank"."Credit" DROP CONSTRAINT "ID_client_fkey";
       Bank          postgres    false    217    4695    218            x           2606    16719    Deposit ID_employee    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank"."Deposit"
    ADD CONSTRAINT "ID_employee" FOREIGN KEY ("ID_employee") REFERENCES "Bank"."Employee"("ID_employee") NOT VALID;
 A   ALTER TABLE ONLY "Bank"."Deposit" DROP CONSTRAINT "ID_employee";
       Bank          postgres    false    220    4711    222            t           2606    16724    Credit ID_employee    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank"."Credit"
    ADD CONSTRAINT "ID_employee" FOREIGN KEY ("ID_employee") REFERENCES "Bank"."Employee"("ID_employee") NOT VALID;
 @   ALTER TABLE ONLY "Bank"."Credit" DROP CONSTRAINT "ID_employee";
       Bank          postgres    false    218    4711    222            r           2606    16734    Accruals contarct_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank"."Accruals"
    ADD CONSTRAINT contarct_number_fkey FOREIGN KEY (contarct_number) REFERENCES "Bank"."Deposit"(contarct_number) NOT VALID;
 I   ALTER TABLE ONLY "Bank"."Accruals" DROP CONSTRAINT contarct_number_fkey;
       Bank          postgres    false    4705    216    220            |           2606    16739 '   payments_timetable contract_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank".payments_timetable
    ADD CONSTRAINT contract_number_fkey FOREIGN KEY (contarct_number) REFERENCES "Bank"."Credit"(contact_number) NOT VALID;
 Q   ALTER TABLE ONLY "Bank".payments_timetable DROP CONSTRAINT contract_number_fkey;
       Bank          postgres    false    225    218    4697            u           2606    16744    Credit credit_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank"."Credit"
    ADD CONSTRAINT credit_code_fkey FOREIGN KEY (credit_code) REFERENCES "Bank".credit_directory(credit_code) NOT VALID;
 C   ALTER TABLE ONLY "Bank"."Credit" DROP CONSTRAINT credit_code_fkey;
       Bank          postgres    false    4719    218    224            v           2606    16749    Credit currence_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank"."Credit"
    ADD CONSTRAINT currence_code_fkey FOREIGN KEY (currency_code) REFERENCES "Bank"."Currency"(currency_code) NOT VALID;
 E   ALTER TABLE ONLY "Bank"."Credit" DROP CONSTRAINT currence_code_fkey;
       Bank          postgres    false    4701    219    218            y           2606    16754    Deposit currency_codefkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank"."Deposit"
    ADD CONSTRAINT currency_codefkey FOREIGN KEY (currency_code) REFERENCES "Bank"."Currency"(currency_code) NOT VALID;
 E   ALTER TABLE ONLY "Bank"."Deposit" DROP CONSTRAINT currency_codefkey;
       Bank          postgres    false    4701    219    220            z           2606    16759    Deposit deposit_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank"."Deposit"
    ADD CONSTRAINT deposit_code_fkey FOREIGN KEY (deposit_code) REFERENCES "Bank"."Deposits_directory"("Deposit_code") NOT VALID;
 E   ALTER TABLE ONLY "Bank"."Deposit" DROP CONSTRAINT deposit_code_fkey;
       Bank          postgres    false    220    4709    221                 x���͊�0�O1x�-��O�ԅqa�q�4z(m�Ŧ�}�Mc�/��C?����v󽃼�}�����]�k!���]X��ﵑ��é����.�>T5WM���v�R6��Z�H�[�*���v	�u��laAP/��EJB��A"�S��pr���(����H�M��L2}�� o��Hf�d�C�/����Å�q���C��A��R˸�࢞��A�yJh�ᤂ8�
2�cc&��=jp�gţ��1������qz��������         /  x�ŕ]o�0���G�i+eV>��n���J�
[/��X��G�)c�~�N�R�^G�E�� ~x�OVO���VO�x�|�7��ƃۊҺR��ˣ�ô4�5�k�B��{ߏB�K*�����V�}�|~������_�-�ބQ����t��`+XS^���p_��:�6O��}���P�Kn
[�"�����TV��LI\	}�һ��� P�l:�I�v��K!��,�c�%��b��I�X�'�!�q��� ʂ}�㙅�C^�L�uU+�,����C�5���,ׂX�O�:�Z0�"{��\�aA�ymKfK�۲���5���T]N����T�q�q��D9�p�:�H99��C�"�P+g�n���Y�{�ұ��-մ�Ŝ閭�	�mҡ#�P��^D�K;�)n2�6��gv��U�wh2bڬC8A¡�]�2uj�#�PQM�D��X��k���ixdnPf�;/�hq(���Lb���0�M�s`�ndn�]k��矍���l���2x=�nl`�F&�>��(��?�����*����P�&$�v_�v�59����v         5  x����J�0��>E�M7h$��x5uBA&��m�Ҡ�6m*���Z;�lp8���	�G��v���f�
����>6�T��0�ra��{�$�2\%�2��U�ODeZ�?O�Cŵ���HieU��k�i� �5�Զ(��%�?�>T�(%QT��a��8�6�y
��k�|�^��[0KSL)"�N%�1N�+��|�[v�m�d���R��^"��Gj)Ÿ�r{��ŵH�A*C$�L$�z��c1o�|�+aՏ�h):H�"|w�a��DC�� ���^���?�y�!�`��Q����8���         �   x����J1��>Ű�ma��]�nW�e�U<I�6�N$M���M���6����7�t��kh�����$��1H�!���7��Zb	�vd͡;��K�<0�Y	�@ʢn��}�}1�˚g����w!�q�J�p�=�>j�`��Of_xo!�x�zK_z�$�r]�+��{��[#�*�Ր���V��f+Hƿ?=$�o"�cߜ�����ig7�j����M��NCE����d�B*�         �  x���j�0��}���hR��]m� ��m�b6�j*����s�Tk�^ r�4������6���Zm>ސ�Jů��,��8e��&�-Y�����K��V�E�U5�U��)����a���9���q!�LdUv�
fRz(�K�_��,�`�{��j!7��N�,L����v���Ma?��̹e3w�婢U}��ϗ�n�E�1��yX�*�A�{��@��.��y����&6���z�!7������Lڀܷ��}M����H�a�7��260�k���M/� A�D+y���R6P4��Ǝ+ܘs�i��A�hEm�j�a��0��vga�j��0�xt����6�4��p��z~��~��t���Z�v�a����Dk�Wm���Ì9ј��I�_�Ҟ����?�,��f�s�s�7� �:���:F�?L��         �   x�͒Mj�0��>Š���릫6M�PR��n��f1$�Y����vJ|k�yO�z���~����A=wPw�=���R�.r�(X]ݶc�J���#�/5x���D�5'�v��S�h^��$�k�zz��6��4�M4Κ`az*��.4d��d�׏I��\(_�3�?C�RC52�傘��g�1�2P>2?,��8��"����dv"N%CT��`����x;��)"��.���I��0O         M  x�Œ�n�@��}�	7h�
�^i��OSm{IVٔ��.5��;��;g��͜t�O>�n;�\��'+)+eBX0��8���#8�\d���@�y]��5ӷ�(.8(������7�2����<�����|���a�;L�=�|�l<	#J�Mg��)4�Ky-�W�p���=z��0� Ƙ�%�M�p2f���e��p- 6�4����{O�p�SJb�d��1�KH�w=�4��<\(�3�F��!Qe��y�t�`��y����R��'�T���#@ZlQ���_`AD�+]�5
(d��HC>�w��Z4E¯�]b��#Y�         �   x����n�0E���Q6�dU���* *�� ��[48Ck0ve;���55�~�7��̽g�rWm5��z�
�5}J����C�iӧ0亡�E�X�hz
o4��b���`8�2yv?�U��^�2
}�`����L<���\��m��S��]��1Cϼ�@�jT�?���Ͻ��/�F�k��s/%�^�����t>?�ǐ%�v��(�ȅ_qh�**.PB�t���d0C����gˠme|�o����ɲ �         �   x����
�0 ���"x�B�&�'���p�UJ��џ�oo&:|����M�R���t�b>@o-��7T�	7m�@��oF�F5:�6�蝩�!+ �j>���Ɋ�廟�\W�K^B, ��y��	[�6�Kp<�,��#�D���v��]ޱ!��Y�$�,X����5��;Y����9����X������ti�	bVZ����%�:*�<�"%��f��         �   x�͓;k�0Fw���% �+��Щ�!�<��GC���T�8q�!���	�S�W����z�ٟ���cݟvߍq�����S?�1�˨�ٷ�q�ʵT�9s}�o�d�ٝf�f��::TN۶ٚ���g��
F�����D�8aCR㷨Q?�g��R	��!�P�3�={�)�>�n�O��P���iO'BflHI���ܳ��[��/�~��ʍ�#�]�     