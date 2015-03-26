--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: tracks; Type: TABLE; Schema: public; Owner: fypuser; Tablespace: 
--

CREATE TABLE tracks (
    id integer NOT NULL,
    artist character varying(200),
    title character varying(200),
    file_path character varying(100),
    positivity numeric,
    excitedness numeric,
    album_art_url character varying(100),
    duration numeric DEFAULT 1
);


ALTER TABLE public.tracks OWNER TO fypuser;

--
-- Name: tracks_id_seq; Type: SEQUENCE; Schema: public; Owner: fypuser
--

CREATE SEQUENCE tracks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracks_id_seq OWNER TO fypuser;

--
-- Name: tracks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fypuser
--

ALTER SEQUENCE tracks_id_seq OWNED BY tracks.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fypuser
--

ALTER TABLE ONLY tracks ALTER COLUMN id SET DEFAULT nextval('tracks_id_seq'::regclass);


--
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: fypuser
--

COPY tracks (id, artist, title, file_path, positivity, excitedness, album_art_url, duration) FROM stdin;
88	65daysofstatic	AOD	65daysofstatic/Retreat! Retreat!/02. AOD.mp3	0.00	12.21688	http://userserve-ak.last.fm/serve/300x300/94920835.png	374.9877551020408
90	65daysofstatic	A Failsafe	65daysofstatic/The Destruction of Small Ideas/02. A Failsafe.mp3	1.00	15.853530000000002	http://userserve-ak.last.fm/serve/300x300/9267227.jpg	268.5126530612245
92	65daysofstatic	Wax Futures	65daysofstatic/The Destruction of Small Ideas/04. Wax Futures.mp3	0.00	12.96416	http://userserve-ak.last.fm/serve/300x300/9267227.jpg	238.431125
94	65daysofstatic	Lyonesse	65daysofstatic/The Destruction of Small Ideas/06. Lyonesse.mp3	0.00	7.026640000000001	http://userserve-ak.last.fm/serve/300x300/9267227.jpg	273.1843125
96	65daysofstatic	Primer	65daysofstatic/The Destruction of Small Ideas/10. Primer.mp3	0.00	14.20489	http://userserve-ak.last.fm/serve/300x300/9267227.jpg	272.567
98	65daysofstatic	The Conspiracy of Seeds	65daysofstatic/The Destruction of Small Ideas/12. The Conspiracy of Seeds.mp3	0.00	13.485639999999999	http://userserve-ak.last.fm/serve/300x300/9267227.jpg	315.97025
185	Aphex Twin	produk 29	Aphex Twin/Syro/03. Produk 29.mp3	0.00	11.007169999999998	http://userserve-ak.last.fm/serve/300x300/101196567.png	304.6958
194	Atelecine	None	Atelecine/The Falcon And The Pod/05 Atelecine - None.mp3	0.00	13.26017	http://userserve-ak.last.fm/serve/300x300/70012912.jpg	113.087275
203	BABYMETAL	Catch me if you can	BABYMETAL/BABYMETAL/1-10 Catch me if you can.mp3	1.00	19.063719999999997	http://userserve-ak.last.fm/serve/300x300/101848547.png	237.589325
211	Ben Frost	Secant	Ben Frost/A U R O R A/04 Secant.mp3	1.00	12.41733	http://userserve-ak.last.fm/serve/300x300/97867001.png	295.235925
219	Ben Frost	We Love You Michael Gira	Ben Frost/Theory of Machines/03 We Love You Michael Gira.mp3	1.00	3.650879999999999	http://userserve-ak.last.fm/serve/300x300/98447919.png	469.0579
227	Ben Howard	The Fear	Ben Howard/Every Kingdom (Deluxe Edition)/06 - The Fear.mp3	1.00	11.5295	http://userserve-ak.last.fm/serve/300x300/90449179.jpg	260.47090625
235	Ben Howard	Bones	Ben Howard/Every Kingdom (Deluxe Edition)/04 - Bones.mp3	1.00	-0.7285300000000007	http://userserve-ak.last.fm/serve/300x300/90449179.jpg	345.8913125
243	Biffy Clyro	Machines	Biffy Clyro/Puzzle/Biffy Clyro - Machines.mp3	1.00	7.4095400000000005	http://userserve-ak.last.fm/serve/300x300/72269842.png	236.10565
251	Blanck Mass	Chernobyl	Blanck Mass/Blanck Mass/03 - Chernobyl.mp3	0.00	-1.507540000000001	http://userserve-ak.last.fm/serve/300x300/70593498.png	266.5012244897959
259	Boards of Canada	Sixtyniner	Boards of Canada/Twoism/05_Boards of Canada - Sixtyniner.mp3	0.00	13.786530000000002	http://userserve-ak.last.fm/serve/300x300/102554877.png	317.675125
267	Boards of Canada	Hi Scores	Boards of Canada/Hi Scores/02_Boards of Canada - 01 - Hi Scores.mp3	0.00	18.044630000000002	http://userserve-ak.last.fm/serve/300x300/100966783.png	297.40408333333335
275	Boards of Canada	Aquarius (Version 3)	Boards of Canada/Peel Session/Boards of Canada - 01 - Aquarius (Version 3).mp3	1.00	9.03471	http://userserve-ak.last.fm/serve/300x300/100966771.png	384.39183673469387
283	Boards of Canada	Skyliner	Boards of Canada/Trans Canada Highway/22_Boards of Canada - Skyliner.mp3	0.00	9.17071	http://userserve-ak.last.fm/serve/300x300/99915311.png	340.19266666666664
291	Boards of Canada	Sunshine Recorder	Boards of Canada/Geogaddi/Geogaddi-006-Boards of Canada-Sunshine Recorder.mp3	1.00	10.285649999999998	http://userserve-ak.last.fm/serve/300x300/100576167.png	372.793425
298	Boards of Canada	Opening The Mouth	Boards of Canada/Geogaddi/Geogaddi-013-Boards of Canada-Opening The Mouth.mp3	0.00	-1.5847799999999998	http://userserve-ak.last.fm/serve/300x300/100576167.png	71.627725
305	Boards of Canada	Diving Station	Boards of Canada/Geogaddi/Geogaddi-020-Boards of Canada-Diving Station.mp3	0.00	8.39675	http://userserve-ak.last.fm/serve/300x300/100576167.png	86.77875
186	Aphex Twin	4 bit 9d api+e+6	Aphex Twin/Syro/04. 4 Bit 9d Api+E+6.mp3	0.00	15.23098	http://userserve-ak.last.fm/serve/300x300/101196567.png	269.5874
117	A Winged Victory For The Sullen	Atomos I	A Winged Victory For The Sullen/Atomos/01_Atomos_I.mp3	1.00	-3.6076799999999995	http://userserve-ak.last.fm/serve/300x300/101805485.png	622.053875
123	A Winged Victory For The Sullen	Atomos VIII	A Winged Victory For The Sullen/Atomos/07_Atomos_VIII.mp3	0.00	2.6719200000000003	http://userserve-ak.last.fm/serve/300x300/101805485.png	314.331425
129	A Winged Victory For The Sullen	Atomos VII (Greenhouse Re-Interpretation)	A Winged Victory For The Sullen/Atomos VII/03_Atomos_VII_(Greenhouse_Re-Interpretation).mp3	1.00	-5.788429999999999	http://userserve-ak.last.fm/serve/300x300/100601513.png	788.8196
134	Adebisi Shank	Thundertruth	Adebisi Shank/This Is the Third Album of a Band Called Adebisi Shank/05 - Thundertruth.mp3	1.00	9.99421	http://userserve-ak.last.fm/serve/300x300/100510739.png	157.756625
139	Adebisi Shank	You Me	Adebisi Shank/This Is the Album of a Band Called Adebisi Shank/01 You Me.mp3	0.00	10.83731	http://userserve-ak.last.fm/serve/300x300/86719279.jpg	186.12244897959184
144	Adebisi Shank	Snakehips	Adebisi Shank/This Is the Album of a Band Called Adebisi Shank/08 Snakehips.mp3	0.00	12.68995	http://userserve-ak.last.fm/serve/300x300/86719279.jpg	157.6751020408163
149	Adebisi Shank	Logdrum	Adebisi Shank/This Is The Second Album Of A Band Called Adebisi Shank/06 Logdrum.mp3	1.00	10.37562	http://userserve-ak.last.fm/serve/300x300/60222025.jpg	364.85225
154	Alcest	Wings	Alcest/Shelter/01 - Wings.mp3	1.00	0.16282999999999896	http://userserve-ak.last.fm/serve/300x300/96248127.png	92.107725
159	Amiina	Boga	Amiina/Kurr/Amiina - Boga.mp3	0.00	-4.453130000000001	http://userserve-ak.last.fm/serve/300x300/39622263.png	551.5313125
164	Amiina	Seoul	Amiina/Kurr/Amiina - Seoul.mp3	1.00	7.990830000000003	http://userserve-ak.last.fm/serve/300x300/39622263.png	417.1051875
169	And So I Watch You From Afar	I Capture Castles	And So I Watch You From Afar/And So I Watch You From Afar/04 - I Capture Castles.mp3	0.00	9.413819999999998	http://userserve-ak.last.fm/serve/300x300/80704853.jpg	437.99510204081633
174	And So I Watch You From Afar	Eat the City, Eat it Whole	And So I Watch You From Afar/And So I Watch You From Afar/11 - Eat the City, Eat it Whole.mp3	1.00	2.3163399999999997	http://userserve-ak.last.fm/serve/300x300/80704853.jpg	465.78938775510204
179	Anoice	Cat In The Rain	Anoice/The Black Rain/Anoice_The Black Rain_05_Cat In The Rain.mp3	1.00	-3.824570000000001	http://userserve-ak.last.fm/serve/300x300/77157728.jpg	262.0604081632653
195	Atelecine	A New Future!	Atelecine/The Falcon And The Pod/06 Atelecine - A New Future!.mp3	1.00	5.35378	http://userserve-ak.last.fm/serve/300x300/70012912.jpg	164.0783
204	Ben Frost	Swarm	Ben Frost/Steel Wound/01 - Swarm.mp3	1.00	4.38611	http://userserve-ak.last.fm/serve/300x300/74702658.png	240.71836734693878
212	Ben Frost	Diphenyl Oxalate	Ben Frost/A U R O R A/05 Diphenyl Oxalate.mp3	1.00	4.646480000000001	http://userserve-ak.last.fm/serve/300x300/97867001.png	91.3241
220	Ben Frost	Coda	Ben Frost/Theory of Machines/04 Coda.mp3	1.00	11.33973	http://userserve-ak.last.fm/serve/300x300/98447919.png	99.790975
228	Ben Howard	Keep Your Head Up	Ben Howard/Every Kingdom (Deluxe Edition)/07 - Keep Your Head Up.mp3	0.00	13.129330000000002	http://userserve-ak.last.fm/serve/300x300/90449179.jpg	264.676625
236	Ben Howard	I Will Be Blessed	Ben Howard/Every Kingdom (Deluxe Edition)/05 - I Will Be Blessed.mp3	1.00	2.2827899999999993	http://userserve-ak.last.fm/serve/300x300/90449179.jpg	331.31496875
244	Biffy Clyro	Now I'm Everyone	Biffy Clyro/Puzzle/Biffy Clyro - Now I'm Everyone.mp3	1.00	14.953440000000001	http://userserve-ak.last.fm/serve/300x300/72269842.png	230.829
252	Blanck Mass	Raw Deal	Blanck Mass/Blanck Mass/04 - Raw Deal.mp3	1.00	6.44541	http://userserve-ak.last.fm/serve/300x300/70593498.png	596.2710204081633
260	Boards of Canada	Oirectine	Boards of Canada/Twoism/11_Boards of Canada - Oirectine.mp3	1.00	10.135469999999999	http://userserve-ak.last.fm/serve/300x300/102554877.png	311.19675
268	Boards of Canada	Turquoise Hexagon Sun	Boards of Canada/Hi Scores/12_Boards of Canada - 02 - Turquoise Hexagon Sun.mp3	1.00	7.208170000000001	http://userserve-ak.last.fm/serve/300x300/100966783.png	309.0024583333333
276	Boards of Canada	Happy Cycling	Boards of Canada/Peel Session/Boards of Canada - 02 - Happy Cycling.mp3	1.00	9.99375	http://userserve-ak.last.fm/serve/300x300/100966771.png	476.0816326530612
284	Boards of Canada	Under the Coke Sign	Boards of Canada/Trans Canada Highway/29_Boards of Canada - Under the Coke Sign.mp3	1.00	2.6463799999999987	http://userserve-ak.last.fm/serve/300x300/99915311.png	91.219625
292	Boards of Canada	In The Annexe	Boards of Canada/Geogaddi/Geogaddi-007-Boards of Canada-In The Annexe.mp3	1.00	5.126550000000001	http://userserve-ak.last.fm/serve/300x300/100576167.png	82.207325
299	Boards of Canada	Alpha And Omega	Boards of Canada/Geogaddi/Geogaddi-014-Boards of Canada-Alpha And Omega.mp3	0.00	20.368100000000003	http://userserve-ak.last.fm/serve/300x300/100576167.png	422.6612
306	Boards of Canada	You Could Feel The Sky	Boards of Canada/Geogaddi/Geogaddi-021-Boards of Canada-You Could Feel The Sky.mp3	0.00	5.658029999999998	http://userserve-ak.last.fm/serve/300x300/100576167.png	314.3314
311	Boards of Canada	White Cyclosa	Boards of Canada/Tomorrow's Harvest/01 white cyclosa.mp3	0.00	11.670020000000002	http://userserve-ak.last.fm/serve/300x300/90102967.png	194.559975
316	Boards of Canada	Transmisiones Ferox	Boards of Canada/Tomorrow's Harvest/07 transmisiones ferox.mp3	0.00	8.9346	http://userserve-ak.last.fm/serve/300x300/90102967.png	136.045675
321	Boards of Canada	Uritual	Boards of Canada/Tomorrow's Harvest/12 uritual.mp3	1.00	-3.19832	http://userserve-ak.last.fm/serve/300x300/90102967.png	120.267725
326	Boards of Canada	Semena Mertvykh	Boards of Canada/Tomorrow's Harvest/17 semena mertvykh.mp3	1.00	-3.38654	http://userserve-ak.last.fm/serve/300x300/90102967.png	196.2318
331	Bon Iver	Beth / Rest	Bon Iver/Bon Iver/Bon Iver - Beth  Rest.mp3	1.00	4.496379999999999	http://userserve-ak.last.fm/serve/300x300/92318031.png	316.868525
336	Bon Iver	Michicant	Bon Iver/Bon Iver/Bon Iver - Michicant.mp3	1.00	-0.9422899999999998	http://userserve-ak.last.fm/serve/300x300/92318031.png	221.73055
341	Bon Iver	Flume	Bon Iver/2008-02-19: Washington, DC, USA/Bon Iver - 02 Flume.mp3	1.00	5.575899999999999	fyp.matthewoneill.com/images/default.png	267.67675
346	Bon Iver	Creature Fear	Bon Iver/2008-02-19: Washington, DC, USA/Bon Iver - 07 Creature Fear.mp3	1.00	2.3123999999999996	fyp.matthewoneill.com/images/default.png	382.6235
351	Bon Iver	The Wolves (Act I And II)	Bon Iver/For Emma, Forever Ago/04 The Wolves (Act II and II).mp3	1.00	4.399630000000001	http://userserve-ak.last.fm/serve/300x300/93278287.png	322.0897959183674
356	Bon Iver	re: Stacks	Bon Iver/For Emma, Forever Ago/09 re Stacks.mp3	1.00	6.2694300000000005	http://userserve-ak.last.fm/serve/300x300/93278287.png	401.47591836734694
187	Aphex Twin	180db_	Aphex Twin/Syro/05. 180db_.mp3	1.00	14.60884	http://userserve-ak.last.fm/serve/300x300/101196567.png	192.2386
196	Atelecine	Light Through The Leaves	Atelecine/The Falcon And The Pod/07 Atelecine - Light Through The Leaves.mp3	1.00	7.450670000000001	http://userserve-ak.last.fm/serve/300x300/70012912.jpg	190.9583
205	Ben Frost	..I Lay My Ear To Furious Latin	Ben Frost/Steel Wound/02 - ..I Lay My Ear To Furious Latin.mp3	0.00	5.264569999999999	http://userserve-ak.last.fm/serve/300x300/74702658.png	552.2808163265306
213	Ben Frost	Venter	Ben Frost/A U R O R A/06 Venter.mp3	1.00	10.662050000000001	http://userserve-ak.last.fm/serve/300x300/97867001.png	405.211425
221	Ben Frost	Forgetting You Is Like Breathing	Ben Frost/Theory of Machines/05 Forgetting You Is Like Breathing.mp3	0.00	2.630719999999999	http://userserve-ak.last.fm/serve/300x300/98447919.png	675.80135
229	Ben Howard	Black Flies	Ben Howard/Every Kingdom (Deluxe Edition)/08 - Black Flies.mp3	1.00	9.27601	http://userserve-ak.last.fm/serve/300x300/90449179.jpg	381.6529375
237	Ben Howard	Move Like You Want (Live)	Ben Howard/Every Kingdom (Deluxe Edition)/06 - Move Like You Want (Live).mp3	0.00	11.42354	http://userserve-ak.last.fm/serve/300x300/90449179.jpg	501.267625
184	Anoice	Fall Asleep	Anoice/The Black Rain/Anoice_The Black Rain_10_Fall Asleep.mp3	1.00	-0.5097700000000007	http://userserve-ak.last.fm/serve/300x300/77157728.jpg	198.03428571428572
29	Max Richter	Last Days	Max Richter/Memoryhouse/17. Last Days.mp3	-1.00	6.441380000000001	http://userserve-ak.last.fm/serve/300x300/67161254.png	258.458675
30	Max Richter	Quartet Fragment (1908)	Max Richter/Memoryhouse/18. Quartet Fragment (1908).mp3	0.00	-5.49143	http://userserve-ak.last.fm/serve/300x300/67161254.png	182.285625
31	Max Richter	Infra 1	Max Richter/Infra/01. Infra 1.mp3	1.00	5.457029999999999	http://userserve-ak.last.fm/serve/300x300/51460697.png	244.901125
32	Max Richter	Journey 1	Max Richter/Infra/02. Journey 1.mp3	0.00	-0.55203	http://userserve-ak.last.fm/serve/300x300/51460697.png	130.092975
33	Max Richter	Infra 2	Max Richter/Infra/03. Infra 2.mp3	0.00	-2.84947	http://userserve-ak.last.fm/serve/300x300/51460697.png	267.366425
34	Max Richter	Infra 3	Max Richter/Infra/04. Infra 3.mp3	0.00	-2.8443499999999992	http://userserve-ak.last.fm/serve/300x300/51460697.png	181.658675
35	Max Richter	Journey 2	Max Richter/Infra/05. Journey 2.mp3	1.00	7.100559999999999	http://userserve-ak.last.fm/serve/300x300/51460697.png	133.1754
36	Max Richter	Infra 4	Max Richter/Infra/06. Infra 4.mp3	0.00	-0.9504099999999999	http://userserve-ak.last.fm/serve/300x300/51460697.png	166.14195
37	Max Richter	Journey 3	Max Richter/Infra/07. Journey 3.mp3	0.00	5.10846	http://userserve-ak.last.fm/serve/300x300/51460697.png	170.58275
38	Max Richter	Journey 4	Max Richter/Infra/08. Journey 4.mp3	1.00	-2.6313200000000003	http://userserve-ak.last.fm/serve/300x300/51460697.png	280.0097
39	Max Richter	Journey 5	Max Richter/Infra/09. Journey 5.mp3	0.00	-2.5032999999999996	http://userserve-ak.last.fm/serve/300x300/51460697.png	73.06765
3	Low	Cut	Low/I Could Live In Hope/03 Cut.mp3	0.00	8.86821	http://userserve-ak.last.fm/serve/300x300/84725893.png	348.141875
41	Max Richter	Infra 6	Max Richter/Infra/11. Infra 6.mp3	1.00	-5.1967	http://userserve-ak.last.fm/serve/300x300/51460697.png	173.2995
118	A Winged Victory For The Sullen	Atomos II	A Winged Victory For The Sullen/Atomos/02_Atomos_II.mp3	0.00	-1.0450300000000001	http://userserve-ak.last.fm/serve/300x300/101805485.png	259.056325
124	A Winged Victory For The Sullen	Atomos IX	A Winged Victory For The Sullen/Atomos/08_Atomos_IX.mp3	1.00	-3.4225700000000005	http://userserve-ak.last.fm/serve/300x300/101805485.png	256.05225
130	Adebisi Shank	World in Harmony	Adebisi Shank/This Is the Third Album of a Band Called Adebisi Shank/01 - World in Harmony.mp3	1.00	15.00951	http://userserve-ak.last.fm/serve/300x300/100510739.png	311.1999
135	Adebisi Shank	Sensation	Adebisi Shank/This Is the Third Album of a Band Called Adebisi Shank/06 - Sensation.mp3	0.00	17.180110000000003	http://userserve-ak.last.fm/serve/300x300/100510739.png	314.4652
140	Adebisi Shank	Colin Skehan	Adebisi Shank/This Is the Album of a Band Called Adebisi Shank/03 Colin Skehan.mp3	0.00	12.88314	http://userserve-ak.last.fm/serve/300x300/86719279.jpg	170.08326530612246
145	Adebisi Shank	Masa	Adebisi Shank/This Is The Second Album Of A Band Called Adebisi Shank/02 Masa.mp3	1.00	13.12429	http://userserve-ak.last.fm/serve/300x300/60222025.jpg	225.306125
150	Adebisi Shank	Bones	Adebisi Shank/This Is The Second Album Of A Band Called Adebisi Shank/07 Bones.mp3	1.00	13.908680000000001	http://userserve-ak.last.fm/serve/300x300/60222025.jpg	172.85225
155	Alcest	Opale	Alcest/Shelter/02 - Opale.mp3	1.00	5.00732	http://userserve-ak.last.fm/serve/300x300/96248127.png	296.4114
160	Amiina	Hilli	Amiina/Kurr/Amiina - Hilli.mp3	1.00	2.3643100000000004	http://userserve-ak.last.fm/serve/300x300/39622263.png	189.0823125
4	Low	Lazy	Low/I Could Live In Hope/05 Lazy.mp3	0.00	6.63192	http://userserve-ak.last.fm/serve/300x300/84725893.png	339.991625
165	Amiina	Sexfaldur	Amiina/Kurr/Amiina - Sexfaldur.mp3	1.00	-0.8572000000000001	http://userserve-ak.last.fm/serve/300x300/39622263.png	287.4594375
245	Biffy Clyro	Saturday Superhouse	Biffy Clyro/Puzzle/Biffy Clyro - Saturday Superhouse.mp3	0.00	11.31053	http://userserve-ak.last.fm/serve/300x300/72269842.png	199.50425
253	Blanck Mass	Sub Serious	Blanck Mass/Blanck Mass/05 - Sub Serious.mp3	0.00	3.3718600000000006	http://userserve-ak.last.fm/serve/300x300/70593498.png	409.0775510204082
261	Boards of Canada	Iced Cooly	Boards of Canada/Twoism/14_Boards of Canada - Iced Cooly.mp3	1.00	9.415979999999998	http://userserve-ak.last.fm/serve/300x300/102554877.png	142.1845
269	Boards of Canada	Nlogax	Boards of Canada/Hi Scores/16_Boards of Canada - 03 - Nlogax.mp3	1.00	8.23139	http://userserve-ak.last.fm/serve/300x300/100966783.png	414.04083333333335
277	Boards of Canada	Olson (Version 3)	Boards of Canada/Peel Session/Boards of Canada - 03 - Olson (Version 3).mp3	1.00	4.726350000000001	http://userserve-ak.last.fm/serve/300x300/100966771.png	151.4318367346939
285	Boards of Canada	Dayvan Cowboy (Odd Nosdam Remix)	Boards of Canada/Trans Canada Highway/31_Boards of Canada - Dayvan Cowboy.mp3	1.00	4.166779999999998	http://userserve-ak.last.fm/serve/300x300/99915311.png	559.3861666666667
293	Boards of Canada	Julie And Candy	Boards of Canada/Geogaddi/Geogaddi-008-Boards of Canada-Julie And Candy.mp3	1.00	14.69821	http://userserve-ak.last.fm/serve/300x300/100576167.png	330.422825
300	Boards of Canada	I Saw Drones	Boards of Canada/Geogaddi/Geogaddi-015-Boards of Canada-I Saw Drones.mp3	1.00	2.771409999999999	http://userserve-ak.last.fm/serve/300x300/100576167.png	27.2718
5	A Winged Victory For The Sullen	Steep Hills Of Vicodin Tears	A Winged Victory For The Sullen/A Winged Victory For The Sullen/05_Steep_Hills_Of_Vicodin_Tears.mp3	1.00	4.9180800000000005	http://userserve-ak.last.fm/serve/300x300/68742438.png	266.893075
170	And So I Watch You From Afar	Start a Band	And So I Watch You From Afar/And So I Watch You From Afar/05 - Start a Band.mp3	1.00	10.784169999999999	http://userserve-ak.last.fm/serve/300x300/80704853.jpg	293.8775510204082
175	Anoice	Self-Portrait	Anoice/The Black Rain/Anoice_The Black Rain_01_Self-Portrait.mp3	1.00	5.294290000000001	http://userserve-ak.last.fm/serve/300x300/77157728.jpg	298.9714285714286
180	Anoice	White Paper	Anoice/The Black Rain/Anoice_The Black Rain_06_White Paper.mp3	0.00	-3.5805600000000004	http://userserve-ak.last.fm/serve/300x300/77157728.jpg	452.62367346938777
119	A Winged Victory For The Sullen	Atomos III	A Winged Victory For The Sullen/Atomos/03_Atomos_III.mp3	0.00	-6.24732	http://userserve-ak.last.fm/serve/300x300/101805485.png	296.1241
125	A Winged Victory For The Sullen	Atomos X	A Winged Victory For The Sullen/Atomos/09_Atomos_X.mp3	0.00	1.254	http://userserve-ak.last.fm/serve/300x300/101805485.png	258.063675
131	Adebisi Shank	Big Unit	Adebisi Shank/This Is the Third Album of a Band Called Adebisi Shank/02 - Big Unit.mp3	1.00	8.45547	http://userserve-ak.last.fm/serve/300x300/100510739.png	275.64725
136	Adebisi Shank	Chaos Emeralds	Adebisi Shank/This Is the Third Album of a Band Called Adebisi Shank/07 - Chaos Emeralds.mp3	0.00	17.71437	http://userserve-ak.last.fm/serve/300x300/100510739.png	221.730525
141	Adebisi Shank	Shunk	Adebisi Shank/This Is the Album of a Band Called Adebisi Shank/04 Shunk.mp3	1.00	19.53465	http://userserve-ak.last.fm/serve/300x300/86719279.jpg	173.94938775510204
146	Adebisi Shank	Genki Shank	Adebisi Shank/This Is The Second Album Of A Band Called Adebisi Shank/03 Genki Shank.mp3	0.00	16.326060000000003	http://userserve-ak.last.fm/serve/300x300/60222025.jpg	287.373075
151	Adebisi Shank	Frunk	Adebisi Shank/This Is The Second Album Of A Band Called Adebisi Shank/08 Frunk.mp3	1.00	14.82173	http://userserve-ak.last.fm/serve/300x300/60222025.jpg	186.4098
156	Alcest	La nuit marche avec moi	Alcest/Shelter/03 - La nuit marche avec moi.mp3	0.00	12.87068	http://userserve-ak.last.fm/serve/300x300/96248127.png	298.135475
161	Amiina	Kolapot	Amiina/Kurr/Amiina - Kolapot.mp3	1.00	3.5989900000000004	http://userserve-ak.last.fm/serve/300x300/39622263.png	280.1713125
166	Amiina	Sogg	Amiina/Kurr/Amiina - Sogg.mp3	1.00	-3.37701	http://userserve-ak.last.fm/serve/300x300/39622263.png	170.666
171	And So I Watch You From Afar	Tip of the Hat, Punch in the Face	And So I Watch You From Afar/And So I Watch You From Afar/06 - Tip of the Hat, Punch in the Face.mp3	1.00	3.6410600000000007	http://userserve-ak.last.fm/serve/300x300/80704853.jpg	261.95591836734695
176	Anoice	Colder Than Thermite	Anoice/The Black Rain/Anoice_The Black Rain_02_Colder Than Thermite.mp3	1.00	-1.69657	http://userserve-ak.last.fm/serve/300x300/77157728.jpg	421.7730612244898
181	Anoice	Drops	Anoice/The Black Rain/Anoice_The Black Rain_07_Drops.mp3	0.00	13.952600000000001	http://userserve-ak.last.fm/serve/300x300/77157728.jpg	339.27836734693875
46	3epkano	Cesare's Theme	3epkano/EP/3epkano - EP - 04 Cesare's Theme.mp3	0.00	10.246880000000002	http://userserve-ak.last.fm/serve/300x300/71112982.jpg	194.22040816326532
49	65daysofstatic	Prisms	65daysofstatic/Wild Light/02 - 65Daysofstatic - Prisms.mp3	0.00	10.70237	http://userserve-ak.last.fm/serve/300x300/92480615.png	357.723975
52	65daysofstatic	Sleepwalk City	65daysofstatic/Wild Light/05 - 65Daysofstatic - Sleepwalk City.mp3	0.00	14.00897	http://userserve-ak.last.fm/serve/300x300/92480615.png	413.678275
55	65daysofstatic	Safe Passage	65daysofstatic/Wild Light/08 - 65Daysofstatic - Safe Passage.mp3	0.00	3.982940000000001	http://userserve-ak.last.fm/serve/300x300/92480615.png	357.6195
58	65daysofstatic	Wrong Side Of The Tracks	65daysofstatic/B-Sides & Rarities Volume 1: Then We Take Japan/07. Wrong Side Of The Tracks.mp3	0.00	15.40323	http://userserve-ak.last.fm/serve/300x300/27659881.jpg	72.99009375
61	65daysofstatic	Don't Go Down to Sorrow	65daysofstatic/Don't Go Down to Sorrow/01. Don't Go Down to Sorrow.mp3	0.00	13.66066	http://userserve-ak.last.fm/serve/300x300/94929703.png	421.88379166666664
64	65daysofstatic	Await Rescue	65daysofstatic/Escape From New York/04. Await Rescue.mp3	0.00	17.060870000000002	http://userserve-ak.last.fm/serve/300x300/94767023.png	301.92691666666667
67	65daysofstatic	Primer	65daysofstatic/Escape From New York/07. Primer.mp3	0.00	14.20489	http://userserve-ak.last.fm/serve/300x300/94767023.png	218.607525
188	Aphex Twin	fz pseudotimestretch+e+3	Aphex Twin/Syro/07. Fz Pseudotimestretch+E+3.mp3	1.00	7.979320000000002	http://userserve-ak.last.fm/serve/300x300/101196567.png	59.35415
197	Atelecine	No Other Way	Atelecine/The Falcon And The Pod/08 Atelecine - No Other Way.mp3	1.00	3.19529	http://userserve-ak.last.fm/serve/300x300/70012912.jpg	202.42605
206	Ben Frost	You, Me And The End Of Everything	Ben Frost/Steel Wound/03 - You, Me And The End Of Everything.mp3	1.00	-4.313430000000001	http://userserve-ak.last.fm/serve/300x300/74702658.png	636.5518367346939
214	Ben Frost	No Sorrowing	Ben Frost/A U R O R A/07 No Sorrowing.mp3	1.00	-4.60563	http://userserve-ak.last.fm/serve/300x300/97867001.png	267.467775
222	Ben Howard	Old Pine	Ben Howard/Every Kingdom (Deluxe Edition)/01 - Old Pine.mp3	1.00	7.525380000000001	http://userserve-ak.last.fm/serve/300x300/90449179.jpg	328.6505
230	Ben Howard	Gracious	Ben Howard/Every Kingdom (Deluxe Edition)/09 - Gracious.mp3	0.00	1.3734000000000002	http://userserve-ak.last.fm/serve/300x300/90449179.jpg	297.3035625
238	Biffy Clyro	9/15ths	Biffy Clyro/Puzzle/Biffy Clyro - 915ths.mp3	0.00	10.686189999999999	http://userserve-ak.last.fm/serve/300x300/72269842.png	166.22455
246	Biffy Clyro	The Conversation Is...	Biffy Clyro/Puzzle/Biffy Clyro - The Conversation is....mp3	0.00	15.77533	http://userserve-ak.last.fm/serve/300x300/72269842.png	220.81485
254	Blanck Mass	Land Disasters	Blanck Mass/Blanck Mass/06 - Land Disasters.mp3	1.00	-1.104520000000001	http://userserve-ak.last.fm/serve/300x300/70593498.png	438.2040816326531
262	Boards of Canada	Basefree	Boards of Canada/Twoism/19_Boards of Canada - Basefree.mp3	1.00	14.86976	http://userserve-ak.last.fm/serve/300x300/102554877.png	391.1575833333333
270	Boards of Canada	June 9th	Boards of Canada/Hi Scores/20_Boards of Canada - 04 - June 9th.mp3	1.00	14.93538	http://userserve-ak.last.fm/serve/300x300/100966783.png	318.30204166666664
278	Boards of Canada	Kid For Today	Boards of Canada/In A Beautiful Place Out In The Country/04_Boards of Canada - Kid For Today.mp3	1.00	16.60091	http://userserve-ak.last.fm/serve/300x300/100496329.png	383.7649166666667
286	Boards of Canada	Dayvan Cowboy	Boards of Canada/Trans Canada Highway/Dayvan Cowboy.mp3	1.00	12.922279999999998	http://userserve-ak.last.fm/serve/300x300/99915311.png	301.47920833333336
189	Aphex Twin	aisatsana	Aphex Twin/Syro/12. Aisatsana.mp3	0.00	-2.2304699999999997	http://userserve-ak.last.fm/serve/300x300/101196567.png	322.641925
198	Atelecine	Lost	Atelecine/The Falcon And The Pod/10 Atelecine - Lost.mp3	0.00	5.0652	http://userserve-ak.last.fm/serve/300x300/70012912.jpg	409.759925
207	Ben Frost	Steel Wound	Ben Frost/Steel Wound/04 - Steel Wound.mp3	-2.00	4.169829999999999	http://userserve-ak.last.fm/serve/300x300/74702658.png	561.5020408163265
215	Ben Frost	Sola Fide	Ben Frost/A U R O R A/08 Sola Fide.mp3	1.00	8.74597	http://userserve-ak.last.fm/serve/300x300/97867001.png	387.1347
223	Ben Howard	Diamonds	Ben Howard/Every Kingdom (Deluxe Edition)/02 - Diamonds.mp3	2.00	11.84983	http://userserve-ak.last.fm/serve/300x300/90449179.jpg	246.91334375
231	Ben Howard	Promise	Ben Howard/Every Kingdom (Deluxe Edition)/10 - Promise.mp3	1.00	7.160220000000001	http://userserve-ak.last.fm/serve/300x300/90449179.jpg	384.2129375
239	Biffy Clyro	A Whole Child Ago	Biffy Clyro/Puzzle/Biffy Clyro - A Whole Child Ago.mp3	1.00	16.99114	http://userserve-ak.last.fm/serve/300x300/72269842.png	187.89535
247	Biffy Clyro	Who's Got A Match?	Biffy Clyro/Puzzle/Biffy Clyro - Who's Got a Match.mp3	1.00	17.315850000000002	http://userserve-ak.last.fm/serve/300x300/72269842.png	143.058
255	Blanck Mass	Icke's Struggle	Blanck Mass/Blanck Mass/07 - Icke's Struggle.mp3	1.00	-2.77575	http://userserve-ak.last.fm/serve/300x300/70593498.png	194.03755102040816
263	Boards of Canada	Twoism	Boards of Canada/Twoism/28_Boards of Canada - Twoism.mp3	1.00	7.71354	http://userserve-ak.last.fm/serve/300x300/102554877.png	365.74041666666665
271	Boards of Canada	Seeya Later	Boards of Canada/Hi Scores/26_Boards of Canada - 05 - Seeya Later.mp3	0.00	7.64674	http://userserve-ak.last.fm/serve/300x300/100966783.png	252.70858333333334
279	Boards of Canada	Amo Bishop Roden	Boards of Canada/In A Beautiful Place Out In The Country/07_Boards of Canada - Amo Bishop Roden.mp3	0.00	12.049699999999999	http://userserve-ak.last.fm/serve/300x300/100496329.png	376.13716666666664
287	Boards of Canada	Music Is Math	Boards of Canada/Geogaddi/Geogaddi-002-Boards of Canada-Music Is Math.mp3	1.00	10.34992	http://userserve-ak.last.fm/serve/300x300/100576167.png	321.5412
294	Boards of Canada	The Smallest Weird Number	Boards of Canada/Geogaddi/Geogaddi-009-Boards of Canada-The Smallest Weird Number.mp3	1.00	-2.0221400000000004	http://userserve-ak.last.fm/serve/300x300/100576167.png	77.24405
301	Boards of Canada	The Devil Is In The Details	Boards of Canada/Geogaddi/Geogaddi-016-Boards of Canada-The Devil Is In The Details.mp3	0.00	9.09443	http://userserve-ak.last.fm/serve/300x300/100576167.png	233.4563
307	Boards of Canada	Corsair	Boards of Canada/Geogaddi/Geogaddi-022-Boards of Canada-Corsair.mp3	0.00	-3.9347900000000006	http://userserve-ak.last.fm/serve/300x300/100576167.png	172.09465
312	Boards of Canada	Reach For The Dead	Boards of Canada/Tomorrow's Harvest/02 reach for the dead.mp3	0.00	12.08864	http://userserve-ak.last.fm/serve/300x300/90102967.png	289.123225
317	Boards of Canada	Sick Times	Boards of Canada/Tomorrow's Harvest/08 sick times.mp3	3.00	9.7111	http://userserve-ak.last.fm/serve/300x300/90102967.png	262.008125
322	Boards of Canada	Nothing Is Real	Boards of Canada/Tomorrow's Harvest/13 nothing is real.mp3	0.00	7.627969999999998	http://userserve-ak.last.fm/serve/300x300/90102967.png	232.6465
327	Bon Iver	Babys	Bon Iver/Blood Bank EP/Babys.mp3	1.00	5.799409999999999	http://userserve-ak.last.fm/serve/300x300/88188085.png	277.6555102040816
332	Bon Iver	Calgary	Bon Iver/Bon Iver/Bon Iver - Calgary.mp3	1.00	7.036600000000001	http://userserve-ak.last.fm/serve/300x300/92318031.png	250.2824
337	Bon Iver	Minnesota, Wi	Bon Iver/Bon Iver/Bon Iver - Minnesota, Wi.mp3	0.00	3.93401	http://userserve-ak.last.fm/serve/300x300/92318031.png	232.519125
342	Bon Iver	Lump Sum	Bon Iver/2008-02-19: Washington, DC, USA/Bon Iver - 03 Lump Sum.mp3	1.00	8.76205	fyp.matthewoneill.com/images/default.png	260.5271875
347	Bon Iver	For Emma	Bon Iver/2008-02-19: Washington, DC, USA/Bon Iver - 08 For Emma.mp3	0.00	10.81299	fyp.matthewoneill.com/images/default.png	249.477375
352	Bon Iver	Blindsided	Bon Iver/For Emma, Forever Ago/05 Blindsided.mp3	1.00	5.945990000000001	http://userserve-ak.last.fm/serve/300x300/93278287.png	329.3257142857143
357	Bon Iver	Wisconsin	Bon Iver/For Emma, Forever Ago/10 - Wisconsin.mp3	1.00	-5.694909999999999	http://userserve-ak.last.fm/serve/300x300/93278287.png	325.828475
360	Bon Iver	Blindsided	Bon Iver/Myspace Transmissions/Blindsided.mp3	1.00	5.945990000000001	http://userserve-ak.last.fm/serve/300x300/65088256.jpg	423.94120833333335
363	Bon Iver	Lump Sum	Bon Iver/Myspace Transmissions/Lump Sum.mp3	1.00	8.76205	http://userserve-ak.last.fm/serve/300x300/65088256.jpg	246.831
366	Brian Eno	An Ending [Ascent]	Brian Eno/Apollo: Atmospheres and Soundtracks/Brian Eno - An Ending [Ascent].mp3	1.00	-4.870250000000001	http://userserve-ak.last.fm/serve/300x300/98540471.png	251.3340625
369	Burial	Distant lights	Burial/Burial/02 distant lights.mp3	0.00	10.87964	http://userserve-ak.last.fm/serve/300x300/74625220.png	326.6927083333333
372	Burial	Night Bus	Burial/Burial/05-burial-night_bus.mp3	0.00	1.6146899999999993	http://userserve-ak.last.fm/serve/300x300/74625220.png	140.24345833333334
375	Burial	Forgive	Burial/Burial/09-burial-forgive.mp3	1.00	-0.4055499999999996	http://userserve-ak.last.fm/serve/300x300/74625220.png	187.5675
378	Burial	Pirates	Burial/Burial/12-burial-pirates.mp3	1.00	16.999139999999998	http://userserve-ak.last.fm/serve/300x300/74625220.png	370.72183333333334
381	Burial	Near Dark	Burial/Untrue/03 Near Dark.mp3	1.00	16.608420000000003	http://userserve-ak.last.fm/serve/300x300/61586309.png	234.6057142857143
384	Burial	Etched Headplate	Burial/Untrue/06 Etched Headplate.mp3	1.00	3.895310000000001	http://userserve-ak.last.fm/serve/300x300/61586309.png	359.86285714285714
387	Burial	Shell of Light	Burial/Untrue/09 Shell of Light.mp3	0.00	11.847299999999998	http://userserve-ak.last.fm/serve/300x300/61586309.png	280.6334693877551
390	Burial	UK	Burial/Untrue/12 UK.mp3	0.00	16.27284	http://userserve-ak.last.fm/serve/300x300/61586309.png	100.31020408163265
392	bvdub	Embrace, Release	bvdub/I'll Only Break Your Heart/01 - bvdub - Embrace, Release.mp3	0.00	8.46067	http://userserve-ak.last.fm/serve/300x300/96065081.jpg	1055.898675
394	bvdub	Appear, Disappear	bvdub/I'll Only Break Your Heart/03 - bvdub - Appear, Disappear.mp3	0.00	0.6138399999999995	http://userserve-ak.last.fm/serve/300x300/96065081.jpg	1346.06685
396	Carly Comando	Everyday	Carly Comando/Every day/Carly Comando - Everyday.mp3	0.00	7.684679999999999	fyp.matthewoneill.com/images/default.png	345.12975
398	Caspian	Gone in Bloom and Bough	Caspian/Waking Season/03 Gone in Bloom and Bough.mp3	1.00	9.1384	http://userserve-ak.last.fm/serve/300x300/83871407.png	624.3004081632653
400	Caspian	Akiko	Caspian/Waking Season/05 Akiko.mp3	1.00	7.031659999999999	http://userserve-ak.last.fm/serve/300x300/83871407.png	213.08081632653062
190	Atelecine	A Secret Ratio	Atelecine/The Falcon And The Pod/01 Atelecine - A Secret Ratio.mp3	0.00	7.089700000000001	http://userserve-ak.last.fm/serve/300x300/70012912.jpg	559.337075
199	Atelecine	Magazine	Atelecine/The Falcon And The Pod/11 Atelecine - Magazine.mp3	0.00	13.387270000000002	http://userserve-ak.last.fm/serve/300x300/70012912.jpg	391.944425
208	Ben Frost	Last Exit To Brooklyn	Ben Frost/Steel Wound/05 - Last Exit To Brooklyn.mp3	1.00	-2.3626100000000007	http://userserve-ak.last.fm/serve/300x300/74702658.png	413.54448979591837
216	Ben Frost	A Single Point Of Blinding Light	Ben Frost/A U R O R A/09 A Single Point Of Blinding Light.mp3	1.00	9.794959999999999	http://userserve-ak.last.fm/serve/300x300/97867001.png	197.851425
224	Ben Howard	The Wolves	Ben Howard/Every Kingdom (Deluxe Edition)/03 - The Wolves.mp3	0.00	11.641139999999999	http://userserve-ak.last.fm/serve/300x300/90449179.jpg	309.476625
232	Ben Howard	These Waters	Ben Howard/Every Kingdom (Deluxe Edition)/01 - These Waters.mp3	0.00	10.77923	http://userserve-ak.last.fm/serve/300x300/90449179.jpg	248.14109375
240	Biffy Clyro	Folding Stars	Biffy Clyro/Puzzle/Biffy Clyro - Folding Stars.mp3	2.00	19.867500000000004	http://userserve-ak.last.fm/serve/300x300/72269842.png	255.2093
248	Black Sabbath	Paranoid	Black Sabbath/Dazed and Confused Soundtrack/Black Sabbath - Paranoid.mp3	0.00	10.81672	http://userserve-ak.last.fm/serve/300x300/29719805.jpg	170.5925625
256	Blanck Mass	Fuckers	Blanck Mass/Blanck Mass/08 - Fuckers.mp3	0.00	3.8941300000000004	http://userserve-ak.last.fm/serve/300x300/70593498.png	138.814693877551
264	Boards of Canada	Seeya Later	Boards of Canada/Twoism/33_Boards of Canada - Seeya Later.mp3	0.00	7.64674	http://userserve-ak.last.fm/serve/300x300/102554877.png	273.4237083333333
272	Boards of Canada	Everything You Do Is A Balloon	Boards of Canada/Hi Scores/32_Boards of Canada - 06 - Everything You Do Is A Balloon.mp3	0.00	3.74062	http://userserve-ak.last.fm/serve/300x300/100966783.png	423.9935
280	Boards of Canada	Zoetrope	Boards of Canada/In A Beautiful Place Out In The Country/24_Boards of Canada - Zoetrope.mp3	1.00	16.804509999999998	http://userserve-ak.last.fm/serve/300x300/100496329.png	318.955125
288	Boards of Canada	Beware The Friendly Stranger	Boards of Canada/Geogaddi/Geogaddi-003-Boards of Canada-Beware The Friendly Stranger.mp3	0.00	4.65496	http://userserve-ak.last.fm/serve/300x300/100576167.png	37.69465
295	Boards of Canada	1969	Boards of Canada/Geogaddi/Geogaddi-010-Boards of Canada-1969.mp3	0.00	15.295989999999999	http://userserve-ak.last.fm/serve/300x300/100576167.png	260.545275
302	Boards of Canada	A Is To B As B Is To C	Boards of Canada/Geogaddi/Geogaddi-017-Boards of Canada-A Is To B As B Is To C.mp3	0.00	2.2727800000000003	http://userserve-ak.last.fm/serve/300x300/100576167.png	100.8065
308	Boards of Canada	Peacock Tail	Boards of Canada/The Campfire Headphase/The Campfire Headphase-004-Boards of Canada-Peacock Tail.mp3	1.00	15.00258	http://userserve-ak.last.fm/serve/300x300/88552753.png	324.98935
313	Boards of Canada	Jacquard Causeway	Boards of Canada/Tomorrow's Harvest/04 jacquard causeway.mp3	0.00	-1.1550000000000002	http://userserve-ak.last.fm/serve/300x300/90102967.png	392.7771
318	Boards of Canada	Collapse	Boards of Canada/Tomorrow's Harvest/09 collapse.mp3	0.00	6.52944	http://userserve-ak.last.fm/serve/300x300/90102967.png	164.28405
323	Boards of Canada	Sundown	Boards of Canada/Tomorrow's Harvest/14 sundown.mp3	0.00	-4.84668	http://userserve-ak.last.fm/serve/300x300/90102967.png	136.045675
328	Bon Iver	Beach Baby	Bon Iver/Blood Bank EP/Beach Baby.mp3	1.00	5.10504	http://userserve-ak.last.fm/serve/300x300/88188085.png	155.16734693877552
333	Bon Iver	Hinnom, Tx	Bon Iver/Bon Iver/Bon Iver - Hinnom, Tx.mp3	0.00	6.95937	http://userserve-ak.last.fm/serve/300x300/92318031.png	165.070975
338	Bon Iver	Perth	Bon Iver/Bon Iver/Bon Iver - Perth.mp3	1.00	7.84481	http://userserve-ak.last.fm/serve/300x300/92318031.png	262.141975
343	Bon Iver	Skinny Love	Bon Iver/2008-02-19: Washington, DC, USA/Bon Iver - 04 Skinny Love.mp3	0.00	3.541419999999998	fyp.matthewoneill.com/images/default.png	346.73125
348	Bon Iver	Flume	Bon Iver/For Emma, Forever Ago/01 Flume.mp3	2.00	5.575899999999999	http://userserve-ak.last.fm/serve/300x300/93278287.png	218.857075
353	Bon Iver	Creature Fear	Bon Iver/For Emma, Forever Ago/06 Creature Fear.mp3	1.00	2.3123999999999996	http://userserve-ak.last.fm/serve/300x300/93278287.png	186.17469387755102
358	Bon Iver	Come Talk To Me	Bon Iver/2010/02 - Come Talk To Me.mp3	1.00	8.303150000000001	fyp.matthewoneill.com/images/default.png	380.16605
361	Bon Iver	Flume	Bon Iver/Myspace Transmissions/Flume.mp3	1.00	5.575899999999999	http://userserve-ak.last.fm/serve/300x300/65088256.jpg	271.69958333333335
364	Brian Eno	An Ending	Brian Eno/Apollo: Atmospheres and Soundtracks/Brian Eno - An Ending (Ascent).mp3	1.00	-0.6779999999999988	http://userserve-ak.last.fm/serve/300x300/98540471.png	251.3240625
367	Burial	Versus	Burial/Mary Anne Hobbs Presents: The Warrior Dubz [4x12" Vinyl LP - ZIQ159]/07 Versus.mp3	0.00	16.27284	http://userserve-ak.last.fm/serve/300x300/82669209.jpg	373.1591836734694
370	Burial	Spaceape	Burial/Burial/03-burial-spaceape.mp3	0.00	11.030029999999997	http://userserve-ak.last.fm/serve/300x300/74625220.png	241.67691666666667
373	Burial	Southern Comfort	Burial/Burial/06-burial-southern_comfort.mp3	1.00	14.40265	http://userserve-ak.last.fm/serve/300x300/74625220.png	301.3145
376	Burial	Broken Home	Burial/Burial/10-burial-broken_home.mp3	0.00	14.352080000000002	http://userserve-ak.last.fm/serve/300x300/74625220.png	304.4230416666667
379	Burial	Untitled	Burial/Untrue/01 Untitled.mp3	1.00	2.9380600000000004	http://userserve-ak.last.fm/serve/300x300/61586309.png	46.31510204081633
382	Burial	Ghost Hardware	Burial/Untrue/04 Ghost Hardware.mp3	1.00	13.10113	http://userserve-ak.last.fm/serve/300x300/61586309.png	293.17224489795916
385	Burial	In McDonalds	Burial/Untrue/07 In McDonalds.mp3	0.00	2.702389999999998	http://userserve-ak.last.fm/serve/300x300/61586309.png	127.08571428571429
388	Burial	Dog Shelter	Burial/Untrue/10 Dog Shelter.mp3	0.00	0.87649	http://userserve-ak.last.fm/serve/300x300/61586309.png	179.30448979591836
391	Burial	Raver	Burial/Untrue/13 Raver.mp3	1.00	13.628530000000002	http://userserve-ak.last.fm/serve/300x300/61586309.png	299.93795918367346
393	bvdub	Feel, Unfeel	bvdub/I'll Only Break Your Heart/02 - bvdub - Feel, Unfeel.mp3	0.00	5.76379	http://userserve-ak.last.fm/serve/300x300/96065081.jpg	1016.923975
395	bvdub	Broken, Whole	bvdub/I'll Only Break Your Heart/04 - bvdub - Broken, Whole.mp3	0.00	7.597589999999999	http://userserve-ak.last.fm/serve/300x300/96065081.jpg	1243.5101
397	Caspian	Waking Season	Caspian/Waking Season/01 Waking Season.mp3	1.00	17.284020000000002	http://userserve-ak.last.fm/serve/300x300/83871407.png	321.43673469387755
399	Caspian	Halls of the Summer	Caspian/Waking Season/04 Halls of the Summer.mp3	1.00	16.087979999999995	http://userserve-ak.last.fm/serve/300x300/83871407.png	315.3240816326531
191	Atelecine	Whisper	Atelecine/The Falcon And The Pod/02 Atelecine - Whisper.mp3	1.00	3.51517	http://userserve-ak.last.fm/serve/300x300/70012912.jpg	168.3885
200	Atelecine	Pathless	Atelecine/The Falcon And The Pod/12 Atelecine - Pathless.mp3	0.00	-4.051940000000001	http://userserve-ak.last.fm/serve/300x300/70012912.jpg	243.255425
209	Ben Frost	Flex	Ben Frost/A U R O R A/01 Flex.mp3	0.00	7.815910000000001	http://userserve-ak.last.fm/serve/300x300/97867001.png	170.840825
217	Ben Frost	Theory Of Machines	Ben Frost/Theory of Machines/01 Theory Of Machines.mp3	0.00	10.134230000000001	http://userserve-ak.last.fm/serve/300x300/98447919.png	573.18495
225	Ben Howard	Everything	Ben Howard/Every Kingdom (Deluxe Edition)/04 - Everything.mp3	1.00	8.206669999999998	http://userserve-ak.last.fm/serve/300x300/90449179.jpg	285.6529375
233	Ben Howard	Empty Corridors (Live)	Ben Howard/Every Kingdom (Deluxe Edition)/02 - Empty Corridors (Live).mp3	0.00	11.483379999999998	http://userserve-ak.last.fm/serve/300x300/90449179.jpg	326.19496875
241	Biffy Clyro	Living Is A Problem Because Everything Dies	Biffy Clyro/Puzzle/Biffy Clyro - Living is a Problem Because Everything Dies.mp3	0.00	15.605640000000002	http://userserve-ak.last.fm/serve/300x300/72269842.png	318.95505
249	Blanck Mass	Sifted Gold	Blanck Mass/Blanck Mass/01 - Sifted Gold.mp3	1.00	2.5325599999999986	http://userserve-ak.last.fm/serve/300x300/70593498.png	221.4661224489796
257	Blanck Mass	What You Know	Blanck Mass/Blanck Mass/09 - What You Know.mp3	0.00	10.306390000000001	http://userserve-ak.last.fm/serve/300x300/70593498.png	817.9722448979592
265	Boards of Canada	Melissa Juice	Boards of Canada/Twoism/36_Boards of Canada - Melissa Juice.mp3	1.00	8.607139999999998	http://userserve-ak.last.fm/serve/300x300/102554877.png	92.83920833333333
273	Boards of Canada	Aquarius	Boards of Canada/Aquarius/59_Boards of Canada - Aquarius.mp3	1.00	15.74346	http://userserve-ak.last.fm/serve/300x300/3623188.jpg	368.90125
281	Boards of Canada	Left Side Drive	Boards of Canada/Trans Canada Highway/10_Boards of Canada - Left Side Drive.mp3	0.00	7.404349999999998	http://userserve-ak.last.fm/serve/300x300/99915311.png	320.80983333333336
289	Boards of Canada	Gyroscope	Boards of Canada/Geogaddi/Geogaddi-004-Boards of Canada-Gyroscope.mp3	1.00	9.58251	http://userserve-ak.last.fm/serve/300x300/100576167.png	215.0661
296	Boards of Canada	Energy Warning	Boards of Canada/Geogaddi/Geogaddi-011-Boards of Canada-Energy Warning.mp3	1.00	5.608669999999999	http://userserve-ak.last.fm/serve/300x300/100576167.png	35.369775
303	Boards of Canada	Over The Horizon Radar	Boards of Canada/Geogaddi/Geogaddi-018-Boards of Canada-Over The Horizon Radar.mp3	0.00	-5.59917	http://userserve-ak.last.fm/serve/300x300/100576167.png	68.649775
309	Boards of Canada	Sherbet Head	Boards of Canada/The Campfire Headphase/The Campfire Headphase-008-Boards of Canada-Sherbet Head.mp3	0.00	6.092720000000001	http://userserve-ak.last.fm/serve/300x300/88552753.png	161.933025
314	Boards of Canada	Telepath	Boards of Canada/Tomorrow's Harvest/05 telepath.mp3	1.00	-3.7859600000000004	http://userserve-ak.last.fm/serve/300x300/90102967.png	92.760775
319	Boards of Canada	Palace Posy	Boards of Canada/Tomorrow's Harvest/10 palace posy.mp3	1.00	14.6492	http://userserve-ak.last.fm/serve/300x300/90102967.png	246.0212
324	Boards of Canada	New Seeds	Boards of Canada/Tomorrow's Harvest/15 new seeds.mp3	1.00	12.29554	http://userserve-ak.last.fm/serve/300x300/90102967.png	340.4016
329	Bon Iver	Blood Bank	Bon Iver/Blood Bank EP/Blood Bank.mp3	1.00	6.943859999999999	http://userserve-ak.last.fm/serve/300x300/88188085.png	285.236375
334	Bon Iver	Holocene	Bon Iver/Bon Iver/Bon Iver - Holocene.mp3	1.00	8.14732	http://userserve-ak.last.fm/serve/300x300/92318031.png	336.669325
339	Bon Iver	Towers	Bon Iver/Bon Iver/Bon Iver - Towers.mp3	1.00	2.9171199999999995	http://userserve-ak.last.fm/serve/300x300/92318031.png	188.110975
344	Bon Iver	The Wolves (Act I and II)	Bon Iver/2008-02-19: Washington, DC, USA/Bon Iver - 05 The Wolves (Act I and II).mp3	1.00	4.399630000000001	fyp.matthewoneill.com/images/default.png	395.319
349	Bon Iver	Lump Sum	Bon Iver/For Emma, Forever Ago/02 Lump Sum.mp3	1.00	8.76205	http://userserve-ak.last.fm/serve/300x300/93278287.png	201.11673469387756
354	Bon Iver	Team	Bon Iver/For Emma, Forever Ago/07 Team.mp3	1.00	11.916489999999999	http://userserve-ak.last.fm/serve/300x300/93278287.png	116.95020408163265
359	Bon Iver	Beach Baby	Bon Iver/Daytrotter Session/Beach Baby.mp3	1.00	5.10504	http://userserve-ak.last.fm/serve/300x300/92003425.png	155.16734693877552
362	Bon Iver	For Emma	Bon Iver/Myspace Transmissions/For Emma.mp3	-1.00	10.81299	http://userserve-ak.last.fm/serve/300x300/65088256.jpg	177.13629166666666
365	Brian Eno	The Big Ship	Brian Eno/Another Green World/Brian Eno - The Big Ship.mp3	1.00	3.3663299999999994	http://userserve-ak.last.fm/serve/300x300/41586769.png	183.51020833333334
368	Burial	Untitled	Burial/Burial/01 untitled.mp3	1.00	2.9380600000000004	http://userserve-ak.last.fm/serve/300x300/74625220.png	36.26329166666667
371	Burial	Wounder	Burial/Burial/04-burial-wounder.mp3	0.00	12.539700000000002	http://userserve-ak.last.fm/serve/300x300/74625220.png	291.49245833333333
374	Burial	Gutted	Burial/Burial/08-burial-gutted.mp3	0.00	3.262979999999999	http://userserve-ak.last.fm/serve/300x300/74625220.png	282.92429166666665
377	Burial	Prayer	Burial/Burial/11-burial-prayer.mp3	1.00	17.671809999999998	http://userserve-ak.last.fm/serve/300x300/74625220.png	225.24591666666666
380	Burial	Archangel	Burial/Untrue/02 Archangel.mp3	1.00	15.316690000000002	http://userserve-ak.last.fm/serve/300x300/61586309.png	238.52408163265306
70	65daysofstatic	Tiger Girl (Wishful Thinking Edit)	65daysofstatic/Heavy Sky EP (Japanese Edition)/01. Tiger Girl (Wishful Thinking Edit).mp3	0.00	12.955350000000004	http://userserve-ak.last.fm/serve/300x300/57695687.jpg	216.741125
73	65daysofstatic	Pacify	65daysofstatic/Heavy Sky EP (Japanese Edition)/04. Pacify.mp3	1.00	14.23889	http://userserve-ak.last.fm/serve/300x300/57695687.jpg	255.27175
76	65daysofstatic	Guitar Cascades	65daysofstatic/Heavy Sky EP (Japanese Edition)/07. Guitar Cascades.mp3	1.00	9.648250000000002	http://userserve-ak.last.fm/serve/300x300/57695687.jpg	627.8301
79	65daysofstatic	Await Rescue	65daysofstatic/One Time for all Time/02. Await Rescue.mp3	0.00	17.060870000000002	http://userserve-ak.last.fm/serve/300x300/94767059.png	284.734693877551
26	Max Richter	Fragment	Max Richter/Memoryhouse/14. Fragment.mp3	0.00	4.30783	http://userserve-ak.last.fm/serve/300x300/67161254.png	86.78195
383	Burial	Endorphin	Burial/Untrue/05 Endorphin.mp3	0.00	0.2044099999999998	http://userserve-ak.last.fm/serve/300x300/61586309.png	177.42367346938775
386	Burial	Untrue	Burial/Untrue/08 Untrue.mp3	1.00	13.710290000000001	http://userserve-ak.last.fm/serve/300x300/61586309.png	376.7902040816327
389	Burial	Homeless	Burial/Untrue/11 Homeless.mp3	0.00	15.500339999999998	http://userserve-ak.last.fm/serve/300x300/61586309.png	320.6269387755102
100	65daysofstatic	Dance Parties (Mechanised)	65daysofstatic/The Distant And Mechanised Glo/02. Dance Parties (Mechanised).mp3	0.00	7.58254	fyp.matthewoneill.com/images/default.png	161.496375
102	65daysofstatic	Antique Hyper Mall	65daysofstatic/The Distant And Mechanised Glo/04. Antique Hyper Mall.mp3	0.00	16.11611	fyp.matthewoneill.com/images/default.png	387.9579375
104	65daysofstatic	Mountainhead	65daysofstatic/We Were Exploding Anyway/01. Mountainhead.mp3	0.00	12.722639999999999	http://userserve-ak.last.fm/serve/300x300/44034775.png	291.05575
106	65daysofstatic	Dance dance dance	65daysofstatic/We Were Exploding Anyway/03. Dance dance dance.mp3	1.00	12.45021	http://userserve-ak.last.fm/serve/300x300/44034775.png	258.17175
108	65daysofstatic	Come to me	65daysofstatic/We Were Exploding Anyway/06. Come to me.mp3	1.00	11.377580000000003	http://userserve-ak.last.fm/serve/300x300/44034775.png	427.109675
110	65daysofstatic	Debutante	65daysofstatic/We Were Exploding Anyway/08. Debutante.mp3	1.00	9.09959	http://userserve-ak.last.fm/serve/300x300/44034775.png	360.996275
113	65daysofstatic	Pacify	65daysofstatic/Weak4/02. Pacify.mp3	1.00	14.23889	http://userserve-ak.last.fm/serve/300x300/43640421.jpg	258.97145
44	3epkano	Caligari! Caligari!	3epkano/EP/3epkano - EP - 01 Caligari! Caligari!.mp3	1.00	-0.470940000000001	http://userserve-ak.last.fm/serve/300x300/71112982.jpg	237.60979591836735
47	3epkano	The Man Who Fell From Grace	3epkano/EP/3epkano - EP - 05 The Man Who Fell From Grace.mp3	1.00	4.87421	http://userserve-ak.last.fm/serve/300x300/71112982.jpg	310.93551020408165
50	65daysofstatic	The Undertow	65daysofstatic/Wild Light/03 - 65Daysofstatic - The Undertow.mp3	1.00	9.481850000000002	http://userserve-ak.last.fm/serve/300x300/92480615.png	391.970525
53	65daysofstatic	Taipei	65daysofstatic/Wild Light/06 - 65Daysofstatic - Taipei.mp3	0.00	12.259610000000001	http://userserve-ak.last.fm/serve/300x300/92480615.png	360.25785
56	65daysofstatic	No Station	65daysofstatic/B-Sides & Rarities Volume 1: Then We Take Japan/04. No Station.mp3	0.00	10.912649999999998	http://userserve-ak.last.fm/serve/300x300/27659881.jpg	134.14275
59	65daysofstatic	Crash Tactics	65daysofstatic/Crash Tactics/01. Crash Tactics.mp3	0.00	15.2736	http://userserve-ak.last.fm/serve/300x300/99533913.jpg	238.60244897959183
62	65daysofstatic	Morning In The Knife Quarter	65daysofstatic/Don't Go Down to Sorrow/02. Morning In The Knife Quarter.mp3	0.00	10.888089999999999	http://userserve-ak.last.fm/serve/300x300/94929703.png	323.21841666666666
65	65daysofstatic	Fix The Sky A Little	65daysofstatic/Escape From New York/05. Fix The Sky A Little.mp3	0.00	11.069570000000001	http://userserve-ak.last.fm/serve/300x300/94767023.png	412.56005
68	65daysofstatic	Radio Protector	65daysofstatic/Escape From New York/08. Radio Protector.mp3	1.00	16.355369999999998	http://userserve-ak.last.fm/serve/300x300/94767023.png	257.6266875
71	65daysofstatic	Sawtooth Rising	65daysofstatic/Heavy Sky EP (Japanese Edition)/02. Sawtooth Rising.mp3	0.00	14.565269999999997	http://userserve-ak.last.fm/serve/300x300/57695687.jpg	295.630925
74	65daysofstatic	PX3	65daysofstatic/Heavy Sky EP (Japanese Edition)/05. PX3.mp3	1.00	10.841119999999999	http://userserve-ak.last.fm/serve/300x300/57695687.jpg	240.5648
77	65daysofstatic	String Loop	65daysofstatic/Heavy Sky EP (Japanese Edition)/08. String Loop.mp3	0.00	8.682700000000001	http://userserve-ak.last.fm/serve/300x300/57695687.jpg	314.830925
2	Katrina and The Waves	Walking On Sunshine	Katrina and The Waves/Walking on sunshine (Greatest hits)/01. Walking on sunshine.mp3	3.00	12.75329	http://userserve-ak.last.fm/serve/300x300/97590691.jpg	239.6265
80	65daysofstatic	23kid	65daysofstatic/One Time for all Time/03. 23kid.mp3	1.00	12.071670000000002	http://userserve-ak.last.fm/serve/300x300/94767059.png	272.2220408163265
83	65daysofstatic	The Big Afraid	65daysofstatic/One Time for all Time/07. The Big Afraid.mp3	0.00	7.3232099999999985	http://userserve-ak.last.fm/serve/300x300/94767059.png	128.13061224489795
45	3epkano	Here's Hoping	3epkano/EP/3epkano - EP - 02 Here's Hoping.mp3	1.00	7.947239999999999	http://userserve-ak.last.fm/serve/300x300/71112982.jpg	403.6702040816327
86	65daysofstatic	Radio Protector	65daysofstatic/Radio Protector/01. Radio Protector.mp3	1.00	16.355369999999998	http://userserve-ak.last.fm/serve/300x300/103060931.jpg	326.24326530612245
89	65daysofstatic	AOD	65daysofstatic/Stumble.Stop.Repeat/03. AOD.mp3	0.00	12.21688	http://userserve-ak.last.fm/serve/300x300/93951385.png	387.99673469387756
91	65daysofstatic	Don't Go Down to Sorrow	65daysofstatic/The Destruction of Small Ideas/03. Don't Go Down to Sorrow.mp3	0.00	13.66066	http://userserve-ak.last.fm/serve/300x300/9267227.jpg	506.26135
93	65daysofstatic	These Things You Can't Unlearn	65daysofstatic/The Destruction of Small Ideas/05. These Things You Can't Unlearn.mp3	0.00	9.566790000000002	http://userserve-ak.last.fm/serve/300x300/9267227.jpg	479.7225
95	65daysofstatic	Little Victories	65daysofstatic/The Destruction of Small Ideas/09. Little Victories.mp3	1.00	11.929099999999999	http://userserve-ak.last.fm/serve/300x300/9267227.jpg	329.775375
114	65daysofstatic	Antique Hyper Mall	65daysofstatic/Weak4/03. Antique Hyper Mall.mp3	0.00	16.11611	http://userserve-ak.last.fm/serve/300x300/43640421.jpg	435.37565
97	65daysofstatic	White Peak/Dark Peak	65daysofstatic/The Destruction of Small Ideas/11. White Peak_Dark Peak.mp3	1.00	4.8361300000000005	http://userserve-ak.last.fm/serve/300x300/9267227.jpg	243.696875
99	65daysofstatic	Dance Parties (Distant)	65daysofstatic/The Distant And Mechanised Glo/01. Dance Parties (Distant).mp3	0.00	14.93681	fyp.matthewoneill.com/images/default.png	274.39140625
101	65daysofstatic	Goodbye, 2007	65daysofstatic/The Distant And Mechanised Glo/03. Goodbye, 2007.mp3	0.00	16.624290000000003	fyp.matthewoneill.com/images/default.png	235.2186875
103	65daysofstatic	Radio Protector	65daysofstatic/Watch the Stars Fall/02. Radio Protector.mp3	1.00	16.355369999999998	http://userserve-ak.last.fm/serve/300x300/65879118.jpg	389.7730612244898
105	65daysofstatic	Crash tactics	65daysofstatic/We Were Exploding Anyway/02. Crash tactics.mp3	0.00	15.2736	http://userserve-ak.last.fm/serve/300x300/44034775.png	211.012225
107	65daysofstatic	Piano Fights	65daysofstatic/We Were Exploding Anyway/04. Piano Fights.mp3	1.00	15.299599999999999	http://userserve-ak.last.fm/serve/300x300/44034775.png	272.7648125
109	65daysofstatic	Go Complex	65daysofstatic/We Were Exploding Anyway/07. Go Complex.mp3	0.00	13.88651	http://userserve-ak.last.fm/serve/300x300/44034775.png	225.060775
111	65daysofstatic	Tiger Girl	65daysofstatic/We Were Exploding Anyway/09. Tiger Girl.mp3	1.00	13.336470000000001	http://userserve-ak.last.fm/serve/300x300/44034775.png	707.75659375
6	Low	Lullaby	Low/I Could Live In Hope/06 Lullaby.mp3	0.00	-1.810950000000001	http://userserve-ak.last.fm/serve/300x300/84725893.png	590.79325
7	A Winged Victory For The Sullen	A Symphony Pathetique	A Winged Victory For The Sullen/A Winged Victory For The Sullen/06_A_Symphony_Pathetique.mp3	1.00	-0.8876800000000004	http://userserve-ak.last.fm/serve/300x300/68742438.png	761.808975
8	Low	Sea	Low/I Could Live In Hope/07 Sea.mp3	1.00	0.7420099999999992	http://userserve-ak.last.fm/serve/300x300/84725893.png	110.5581875
9	iamamiwhoami	Blue Blue	iamamiwhoami/BLUE (Island Digital Edition)/09. Blue Blue.mp3	1.00	8.856279999999999	http://userserve-ak.last.fm/serve/300x300/102078561.png	327.683175
10	Radiohead	Fake Plastic Trees	Radiohead/The Bends/Radiohead - Fake Plastic Trees.mp3	1.00	0.9543399999999993	http://userserve-ak.last.fm/serve/300x300/62328943.png	290.7769375
11	Radiohead	No Surprises	Radiohead/OK Computer/Radiohead - No Surprises.mp3	1.00	-1.335780000000001	http://userserve-ak.last.fm/serve/300x300/100673911.png	228.60395
12	Radiohead	Street Spirit (Fade Out)	Radiohead/The Bends/Radiohead - Street Spirit (Fade Out).mp3	0.00	10.15096	http://userserve-ak.last.fm/serve/300x300/62328943.png	254.46675
1	Max Richter	Europe, After The Rain	Max Richter/Memoryhouse/01. Europe, After The Rain.mp3	4.00	-7.0112300000000005	http://userserve-ak.last.fm/serve/300x300/67161254.png	373.893775
13	Max Richter	Europe, After The Rain	Max Richter/Memoryhouse/01. Europe, After The Rain.mp3	4.00	-7.0112300000000005	http://userserve-ak.last.fm/serve/300x300/67161254.png	373.893775
14	Max Richter	Maria, The Poet (1913)	Max Richter/Memoryhouse/02. Maria, The Poet (1913).mp3	0.00	-3.2952399999999995	http://userserve-ak.last.fm/serve/300x300/67161254.png	287.532975
15	Max Richter	Laika's Journey	Max Richter/Memoryhouse/03. Laika's Journey.mp3	0.00	0.4716600000000011	http://userserve-ak.last.fm/serve/300x300/67161254.png	90.726425
16	Max Richter	The Twins (Prague)	Max Richter/Memoryhouse/04. The Twins (Prague).mp3	0.00	0.4671199999999998	http://userserve-ak.last.fm/serve/300x300/67161254.png	118.416225
17	Max Richter	Sarajevo	Max Richter/Memoryhouse/05. Sarajevo.mp3	0.00	-3.1717500000000005	http://userserve-ak.last.fm/serve/300x300/67161254.png	243.490525
18	Max Richter	Andras	Max Richter/Memoryhouse/06. Andras.mp3	0.00	0.5348399999999998	http://userserve-ak.last.fm/serve/300x300/67161254.png	162.19745
19	Max Richter	Untitled (Figures)	Max Richter/Memoryhouse/07. Untitled (Figures).mp3	0.00	12.54426	http://userserve-ak.last.fm/serve/300x300/67161254.png	207.650525
20	Max Richter	Sketchbook	Max Richter/Memoryhouse/08. Sketchbook.mp3	0.00	2.6321700000000015	http://userserve-ak.last.fm/serve/300x300/67161254.png	114.47175
21	Max Richter	November	Max Richter/Memoryhouse/09. November.mp3	1.00	6.391890000000001	http://userserve-ak.last.fm/serve/300x300/67161254.png	381.208075
22	Max Richter	Jan's Notebook	Max Richter/Memoryhouse/10. Jan's Notebook.mp3	0.00	-2.4069300000000006	http://userserve-ak.last.fm/serve/300x300/67161254.png	161.936225
23	Max Richter	Arbenita (11 Years)	Max Richter/Memoryhouse/11. Arbenita (11 Years).mp3	0.00	-3.89957	http://userserve-ak.last.fm/serve/300x300/67161254.png	424.519075
24	Max Richter	Garden (1973) / Interior	Max Richter/Memoryhouse/12. Garden (1973). Interior.mp3	0.00	-2.78625	http://userserve-ak.last.fm/serve/300x300/67161254.png	204.4897
25	Max Richter	Landscape With Figure (1922)	Max Richter/Memoryhouse/13. Landscape With Figure (1922).mp3	1.00	-3.2139499999999994	http://userserve-ak.last.fm/serve/300x300/67161254.png	314.3346
120	A Winged Victory For The Sullen	Atomos V	A Winged Victory For The Sullen/Atomos/04_Atomos_V.mp3	1.00	-3.9527900000000018	http://userserve-ak.last.fm/serve/300x300/101805485.png	252.995925
126	A Winged Victory For The Sullen	Atomos XI	A Winged Victory For The Sullen/Atomos/10_Atomos_XI.mp3	0.00	1.7845400000000003	http://userserve-ak.last.fm/serve/300x300/101805485.png	326.086525
27	Max Richter	Lines On A Page (One Hundred Violins)	Max Richter/Memoryhouse/15. Lines On A Page (One Hundred Violins).mp3	0.00	-2.6292600000000006	http://userserve-ak.last.fm/serve/300x300/67161254.png	82.628475
42	Max Richter	Infra 7	Max Richter/Infra/12. Infra 7.mp3	1.00	-1.2576500000000001	http://userserve-ak.last.fm/serve/300x300/51460697.png	105.485625
43	Max Richter	Infra 8	Max Richter/Infra/13. Infra 8.mp3	0.00	-3.233510000000001	http://userserve-ak.last.fm/serve/300x300/51460697.png	201.903575
48	3epkano	Gretchensong	3epkano/EP/3epkano - EP - 06 Gretchensong.mp3	1.00	5.103919999999999	http://userserve-ak.last.fm/serve/300x300/71112982.jpg	584.4897959183673
51	65daysofstatic	Blackspots	65daysofstatic/Wild Light/04 - 65Daysofstatic - Blackspots.mp3	0.00	11.73691	http://userserve-ak.last.fm/serve/300x300/92480615.png	450.275825
54	65daysofstatic	Unmake The Wild Light	65daysofstatic/Wild Light/07 - 65Daysofstatic - Unmake The Wild Light.mp3	0.00	16.011949999999996	http://userserve-ak.last.fm/serve/300x300/92480615.png	384.0293
57	65daysofstatic	Betraying Chino	65daysofstatic/B-Sides & Rarities Volume 1: Then We Take Japan/06. Betraying Chino.mp3	0.00	12.388	http://userserve-ak.last.fm/serve/300x300/27659881.jpg	128.996625
60	65daysofstatic	After San Francisco	65daysofstatic/Crash Tactics/02. After San Francisco.mp3	0.00	6.26358	http://userserve-ak.last.fm/serve/300x300/99533913.jpg	129.1787
63	65daysofstatic	Retreat! Retreat!	65daysofstatic/Escape From New York/03. Retreat! Retreat!.mp3	0.00	14.944900000000001	http://userserve-ak.last.fm/serve/300x300/94767023.png	164.6572
66	65daysofstatic	65 Doesn't Understand You	65daysofstatic/Escape From New York/06. 65 Doesn't Understand You.mp3	0.00	11.604500000000002	http://userserve-ak.last.fm/serve/300x300/94767023.png	313.27415625
69	65daysofstatic	A Failsafe	65daysofstatic/Escape From New York/10. A Failsafe.mp3	1.00	15.853530000000002	http://userserve-ak.last.fm/serve/300x300/94767023.png	343.4034642857143
72	65daysofstatic	Wrong Shape	65daysofstatic/Heavy Sky EP (Japanese Edition)/03. Wrong Shape.mp3	0.00	14.94816	http://userserve-ak.last.fm/serve/300x300/57695687.jpg	244.45705
75	65daysofstatic	Beats Like A Helix	65daysofstatic/Heavy Sky EP (Japanese Edition)/06. Beats Like A Helix.mp3	1.00	14.80715	http://userserve-ak.last.fm/serve/300x300/57695687.jpg	129.648875
78	65daysofstatic	Wrong Shape (Alternate Version)	65daysofstatic/Heavy Sky EP (Japanese Edition)/09. Wrong Shape (Alternate Version).mp3	1.00	13.84401	http://userserve-ak.last.fm/serve/300x300/57695687.jpg	220.293775
81	65daysofstatic	Welcome To the Times	65daysofstatic/One Time for all Time/04. Welcome To the Times.mp3	0.00	16.12457	http://userserve-ak.last.fm/serve/300x300/94767059.png	234.00489795918367
84	65daysofstatic	65 doesn't understand you	65daysofstatic/One Time for all Time/08. 65 doesn't understand you.mp3	0.00	11.604500000000002	http://userserve-ak.last.fm/serve/300x300/94767059.png	337.0057142857143
87	65daysofstatic	Retreat! Retreat!	65daysofstatic/Retreat! Retreat!/01. Retreat! Retreat!.mp3	0.00	14.944900000000001	http://userserve-ak.last.fm/serve/300x300/94920835.png	247.82367346938776
192	Atelecine	Sodium Vapor	Atelecine/The Falcon And The Pod/03 Atelecine - Sodium Vapor.mp3	1.00	13.953029999999999	http://userserve-ak.last.fm/serve/300x300/70012912.jpg	70.899525
201	Atelecine	The Falcon And The Pod	Atelecine/The Falcon And The Pod/13 Atelecine - The Falcon And The Pod.mp3	1.00	6.715579999999999	http://userserve-ak.last.fm/serve/300x300/70012912.jpg	320.8391
112	65daysofstatic	Weak4	65daysofstatic/Weak4/01. Weak4.mp3	1.00	16.03252	http://userserve-ak.last.fm/serve/300x300/43640421.jpg	235.381825
115	65daysofstatic	Goodbye, 2007	65daysofstatic/Weak4/04. Goodbye, 2007.mp3	0.00	16.624290000000003	http://userserve-ak.last.fm/serve/300x300/43640421.jpg	235.40805
121	A Winged Victory For The Sullen	Atomos VI	A Winged Victory For The Sullen/Atomos/05_Atomos_VI.mp3	0.00	-4.845260000000001	http://userserve-ak.last.fm/serve/300x300/101805485.png	444.186125
127	A Winged Victory For The Sullen	Atomos XII	A Winged Victory For The Sullen/Atomos/11_Atomos_XII.mp3	1.00	-4.08587	http://userserve-ak.last.fm/serve/300x300/101805485.png	249.99185
132	Adebisi Shank	Turnaround	Adebisi Shank/This Is the Third Album of a Band Called Adebisi Shank/03 - Turnaround.mp3	1.00	18.696969999999997	http://userserve-ak.last.fm/serve/300x300/100510739.png	196.261125
137	Adebisi Shank	Voodoo Vision	Adebisi Shank/This Is the Third Album of a Band Called Adebisi Shank/08 - Voodoo Vision.mp3	1.00	8.568640000000001	http://userserve-ak.last.fm/serve/300x300/100510739.png	360.70195
142	Adebisi Shank	Agassi Shank	Adebisi Shank/This Is the Album of a Band Called Adebisi Shank/06 Agassi Shank.mp3	1.00	11.582109999999999	http://userserve-ak.last.fm/serve/300x300/86719279.jpg	147.27836734693878
147	Adebisi Shank	Micromachines	Adebisi Shank/This Is The Second Album Of A Band Called Adebisi Shank/04 Micromachines.mp3	1.00	15.47599	http://userserve-ak.last.fm/serve/300x300/60222025.jpg	216.7641
152	Adebisi Shank	Europa	Adebisi Shank/This Is The Second Album Of A Band Called Adebisi Shank/09 Europa.mp3	0.00	19.442310000000003	http://userserve-ak.last.fm/serve/300x300/60222025.jpg	237.061225
157	Alcest	Shelter	Alcest/Shelter/06 - Shelter.mp3	1.00	11.653650000000001	http://userserve-ak.last.fm/serve/300x300/96248127.png	329.195075
162	Amiina	Rugla	Amiina/Kurr/Amiina - Rugla.mp3	1.00	2.395429999999999	http://userserve-ak.last.fm/serve/300x300/39622263.png	240.2039375
167	And So I Watch You From Afar	Set Guitars to Kill	And So I Watch You From Afar/And So I Watch You From Afar/01 - Set Guitars to Kill.mp3	0.00	7.25237	http://userserve-ak.last.fm/serve/300x300/80704853.jpg	329.6391836734694
172	And So I Watch You From Afar	If it Ain't Broke... Break it	And So I Watch You From Afar/And So I Watch You From Afar/07 - If it Ain't Broke... Break it.mp3	1.00	5.969979999999999	http://userserve-ak.last.fm/serve/300x300/80704853.jpg	381.8840816326531
177	Anoice	Ripple	Anoice/The Black Rain/Anoice_The Black Rain_03_Ripple.mp3	0.00	4.142729999999999	http://userserve-ak.last.fm/serve/300x300/77157728.jpg	461.32244897959185
182	Anoice	The End Of Something	Anoice/The Black Rain/Anoice_The Black Rain_08_The End Of Something.mp3	0.00	-6.0957	http://userserve-ak.last.fm/serve/300x300/77157728.jpg	114.05061224489796
193	Atelecine	A Moist Duck	Atelecine/The Falcon And The Pod/04 Atelecine - A Moist Duck.mp3	0.00	8.58059	http://userserve-ak.last.fm/serve/300x300/70012912.jpg	116.300325
202	BABYMETAL	BABYMETAL DEATH	BABYMETAL/BABYMETAL/1-01 BABYMETAL DEATH.mp3	1.00	12.8165	http://userserve-ak.last.fm/serve/300x300/101848547.png	348.853375
218	Ben Frost	Stomp	Ben Frost/Theory of Machines/02 Stomp.mp3	0.00	6.494770000000001	http://userserve-ak.last.fm/serve/300x300/98447919.png	506.909325
226	Ben Howard	Only Love	Ben Howard/Every Kingdom (Deluxe Edition)/05 - Only Love.mp3	1.00	6.99172	http://userserve-ak.last.fm/serve/300x300/90449179.jpg	249.316625
234	Ben Howard	Under The Same Sun	Ben Howard/Every Kingdom (Deluxe Edition)/03 - Under The Same Sun.mp3	0.00	12.80837	http://userserve-ak.last.fm/serve/300x300/90449179.jpg	286.4105
242	Biffy Clyro	Love Has A Diameter	Biffy Clyro/Puzzle/Biffy Clyro - Love Has a Diameter.mp3	1.00	12.54178	http://userserve-ak.last.fm/serve/300x300/72269842.png	233.90785
250	Blanck Mass	Sundowner	Blanck Mass/Blanck Mass/02 - Sundowner.mp3	1.00	2.71308	http://userserve-ak.last.fm/serve/300x300/70593498.png	481.17551020408166
258	Blanck Mass	Weakling Flier	Blanck Mass/Blanck Mass/10 - Weakling Flier.mp3	1.00	2.1379600000000003	http://userserve-ak.last.fm/serve/300x300/70593498.png	202.97142857142856
266	Boards of Canada	Smokes Quantity	Boards of Canada/Twoism/40_Boards of Canada - Smokes Quantity.mp3	0.00	8.249579999999999	http://userserve-ak.last.fm/serve/300x300/102554877.png	288.36575
274	Boards of Canada	Chinook	Boards of Canada/Aquarius/60_Boards of Canada - Chinook.mp3	0.00	14.7791	http://userserve-ak.last.fm/serve/300x300/3623188.jpg	445.49225
282	Boards of Canada	Heard from Telegraph Lines	Boards of Canada/Trans Canada Highway/13_Boards of Canada - Heard from Telegraph Lines.mp3	0.00	-4.10349	http://userserve-ak.last.fm/serve/300x300/99915311.png	69.98204166666666
290	Boards of Canada	Dandelion	Boards of Canada/Geogaddi/Geogaddi-005-Boards of Canada-Dandelion.mp3	0.00	-4.372180000000001	http://userserve-ak.last.fm/serve/300x300/100576167.png	75.3371
297	Boards of Canada	The Beach At Redpoint	Boards of Canada/Geogaddi/Geogaddi-012-Boards of Canada-The Beach At Redpoint.mp3	0.00	13.009529999999999	http://userserve-ak.last.fm/serve/300x300/100576167.png	258.66445
304	Boards of Canada	Dawn Chorus	Boards of Canada/Geogaddi/Geogaddi-019-Boards of Canada-Dawn Chorus.mp3	1.00	10.6325	http://userserve-ak.last.fm/serve/300x300/100576167.png	235.5722
310	Boards of Canada	Gemini	Boards of Canada/Tomorrow's Harvest/01 gemini.mp3	1.00	10.25794	http://userserve-ak.last.fm/serve/300x300/90102967.png	176.74445
315	Boards of Canada	Cold Earth	Boards of Canada/Tomorrow's Harvest/06 cold earth.mp3	0.00	13.89374	http://userserve-ak.last.fm/serve/300x300/90102967.png	224.653025
320	Boards of Canada	Split Your Infinities	Boards of Canada/Tomorrow's Harvest/11 split your infinities.mp3	0.00	12.28441	http://userserve-ak.last.fm/serve/300x300/90102967.png	269.609775
325	Boards of Canada	Come To Dust	Boards of Canada/Tomorrow's Harvest/16 come to dust.mp3	0.00	12.260989999999999	http://userserve-ak.last.fm/serve/300x300/90102967.png	247.693025
330	Bon Iver	Woods	Bon Iver/Blood Bank EP/Woods.mp3	0.00	3.8565399999999997	http://userserve-ak.last.fm/serve/300x300/88188085.png	284.8391836734694
335	Bon Iver	Lisbon, Oh	Bon Iver/Bon Iver/Bon Iver - Lisbon, Oh.mp3	1.00	-6.701280000000002	http://userserve-ak.last.fm/serve/300x300/92318031.png	93.4171
340	Bon Iver	Wash.	Bon Iver/Bon Iver/Bon Iver - Wash..mp3	1.00	6.587809999999998	http://userserve-ak.last.fm/serve/300x300/92318031.png	298.661175
345	Bon Iver	Blindsided	Bon Iver/2008-02-19: Washington, DC, USA/Bon Iver - 06 Blindsided.mp3	1.00	5.945990000000001	fyp.matthewoneill.com/images/default.png	487.0610625
350	Bon Iver	Skinny Love	Bon Iver/For Emma, Forever Ago/03 Skinny Love.mp3	0.00	3.541419999999998	http://userserve-ak.last.fm/serve/300x300/93278287.png	238.4489
355	Bon Iver	For Emma	Bon Iver/For Emma, Forever Ago/08 For Emma.mp3	0.00	10.81299	http://userserve-ak.last.fm/serve/300x300/93278287.png	220.7608163265306
401	Caspian	High Lonesome	Caspian/Waking Season/06 High Lonesome.mp3	1.00	2.58694	http://userserve-ak.last.fm/serve/300x300/83871407.png	217.65224489795918
402	Caspian	Hickory '54	Caspian/Waking Season/07 Hickory '54.mp3	1.00	17.64992	http://userserve-ak.last.fm/serve/300x300/83871407.png	364.1469387755102
403	Caspian	Long the Desert Mile	Caspian/Waking Season/08 Long the Desert Mile.mp3	0.00	9.727129999999998	http://userserve-ak.last.fm/serve/300x300/83871407.png	370.75591836734696
404	Caspian	Collider in Blue	Caspian/Waking Season/09 Collider in Blue.mp3	0.00	0.9351399999999992	http://userserve-ak.last.fm/serve/300x300/83871407.png	154.17469387755102
405	Caspian	Fire Made Flesh	Caspian/Waking Season/10 Fire Made Flesh.mp3	1.00	8.69347	http://userserve-ak.last.fm/serve/300x300/83871407.png	469.3681632653061
406	Caspian	Moksha	Caspian/The Four Trees/01-caspian-moksha.mp3	1.00	3.0164599999999993	http://userserve-ak.last.fm/serve/300x300/53168971.jpg	547.8922448979591
407	Caspian	Some Are White Light	Caspian/The Four Trees/02-caspian-some_are_white_light.mp3	1.00	8.98738	http://userserve-ak.last.fm/serve/300x300/53168971.jpg	326.2955102040816
408	Caspian	Sea Lawn	Caspian/The Four Trees/03-caspian-sea_lawn.mp3	1.00	2.8199799999999995	http://userserve-ak.last.fm/serve/300x300/53168971.jpg	323.42204081632656
409	Caspian	Crawlspace	Caspian/The Four Trees/04-caspian-crawlspace.mp3	0.00	7.575819999999999	http://userserve-ak.last.fm/serve/300x300/53168971.jpg	457.84816326530614
410	Caspian	Book IX	Caspian/The Four Trees/05-caspian-book_ix.mp3	1.00	12.800240000000001	http://userserve-ak.last.fm/serve/300x300/53168971.jpg	343.5885714285714
411	Caspian	The Dropsonde	Caspian/The Four Trees/06-caspian-the_dropsonde.mp3	1.00	5.362699999999999	http://userserve-ak.last.fm/serve/300x300/53168971.jpg	125.12653061224489
412	Caspian	Brombie	Caspian/The Four Trees/07-caspian-brombie.mp3	1.00	11.322390000000001	http://userserve-ak.last.fm/serve/300x300/53168971.jpg	358.24326530612245
413	Caspian	Our Breath In Winter	Caspian/The Four Trees/08-caspian-our_breath_in_winter.mp3	1.00	2.2454999999999997	http://userserve-ak.last.fm/serve/300x300/53168971.jpg	203.1804081632653
414	Caspian	The Dove	Caspian/The Four Trees/09-caspian-the_dove.mp3	1.00	0.18302999999999985	http://userserve-ak.last.fm/serve/300x300/53168971.jpg	184.84244897959184
415	Caspian	ASA	Caspian/The Four Trees/10-caspian-asa.mp3	1.00	10.604160000000001	http://userserve-ak.last.fm/serve/300x300/53168971.jpg	436.68897959183676
416	Caspian	...Reprise	Caspian/The Four Trees/11-caspian-...reprise.mp3	1.00	-3.2082800000000013	http://userserve-ak.last.fm/serve/300x300/53168971.jpg	314.09632653061226
417	Caspian	Last Rites (live)	Caspian/Live at Old South Church/01_last_rites_live.mp3	1.00	-2.03905	http://userserve-ak.last.fm/serve/300x300/95337825.png	635.06285
418	Caspian	The Dove (live)	Caspian/Live at Old South Church/02_the_dove_live.mp3	1.00	3.6112399999999994	http://userserve-ak.last.fm/serve/300x300/95337825.png	195.056325
419	Caspian	ASA (live)	Caspian/Live at Old South Church/03_asa_live.mp3	1.00	9.21956	http://userserve-ak.last.fm/serve/300x300/95337825.png	301.635925
420	Caspian	Concrescence (live)	Caspian/Live at Old South Church/04_concrescence_live.mp3	1.00	5.466790000000001	http://userserve-ak.last.fm/serve/300x300/95337825.png	277.57715
421	Caspian	Sycamore (live)	Caspian/Live at Old South Church/05_sycamore_live.mp3	1.00	1.7786099999999992	http://userserve-ak.last.fm/serve/300x300/95337825.png	669.83185
422	Caspian	Mie	Caspian/Tertia/01 Mie.mp3	0.00	-0.6100700000000001	http://userserve-ak.last.fm/serve/300x300/52756457.png	251.5591836734694
423	Caspian	La Cerva	Caspian/Tertia/02 La Cerva.mp3	0.00	5.0540399999999995	http://userserve-ak.last.fm/serve/300x300/52756457.png	299.7289795918367
424	Caspian	Ghosts of the Garden City	Caspian/Tertia/03 Ghosts of the Garden City.mp3	0.00	14.109620000000002	http://userserve-ak.last.fm/serve/300x300/52756457.png	452.0751020408163
425	Caspian	Malacoda	Caspian/Tertia/04 Malacoda.mp3	0.00	14.131490000000002	http://userserve-ak.last.fm/serve/300x300/52756457.png	301.7665306122449
426	Caspian	Epochs in DMaj	Caspian/Tertia/05 Epochs in DMaj.mp3	1.00	1.0389799999999998	http://userserve-ak.last.fm/serve/300x300/52756457.png	302.7069387755102
427	Caspian	Of Foam and Wave	Caspian/Tertia/06 Of Foam and Wave.mp3	1.00	1.9093599999999993	http://userserve-ak.last.fm/serve/300x300/52756457.png	376.448125
428	Caspian	Concrescence	Caspian/Tertia/07 Concrescence.mp3	1.00	5.02688	http://userserve-ak.last.fm/serve/300x300/52756457.png	261.8514285714286
429	Caspian	The Raven	Caspian/Tertia/08 The Raven.mp3	0.00	10.25582	http://userserve-ak.last.fm/serve/300x300/52756457.png	419.4481632653061
430	Caspian	Vienna	Caspian/Tertia/09 Vienna.mp3	1.00	2.0445899999999984	http://userserve-ak.last.fm/serve/300x300/52756457.png	372.21877551020407
431	Caspian	Sycamore	Caspian/Tertia/10 Sycamore.mp3	1.00	6.176800000000001	http://userserve-ak.last.fm/serve/300x300/52756457.png	540.2906122448979
432	Cheap Trick	I Want You To Want Me	Cheap Trick/In Color/Cheap Trick - I Want you to Want Me.mp3	0.00	6.07878	http://userserve-ak.last.fm/serve/300x300/86552943.png	219.256375
433	Chicane	Poppiholla	Chicane/Reworks/Chicane - Poppiholla.mp3	1.00	14.326679999999999	fyp.matthewoneill.com/images/default.png	179.5918125
434	City and Colour	Against The Grain	City and Colour/Bring Me Your Love/City and Colour - Against the Grain.mp3	-2.00	9.39336	http://userserve-ak.last.fm/serve/300x300/52046227.jpg	226.06367346938777
435	City and Colour	As Much As I Ever Could	City and Colour/Bring Me Your Love/City and Colour - As Much As I Ever Could.mp3	0.00	3.99885	http://userserve-ak.last.fm/serve/300x300/52046227.jpg	325.0677551020408
436	City and Colour	Body In A Box	City and Colour/Bring Me Your Love/City and Colour - Body in a Box.mp3	1.00	10.171290000000003	http://userserve-ak.last.fm/serve/300x300/52046227.jpg	252.2383673469388
437	City and Colour	Confessions	City and Colour/Bring Me Your Love/City and Colour - Confessions.mp3	1.00	9.65068	http://userserve-ak.last.fm/serve/300x300/52046227.jpg	226.5338775510204
438	City and Colour	Constant Knot	City and Colour/Bring Me Your Love/City and Colour - Constant Knot.mp3	1.00	6.3624300000000005	http://userserve-ak.last.fm/serve/300x300/52046227.jpg	243.1738775510204
439	City and Colour	Forgive Me	City and Colour/Bring Me Your Love/City and Colour - Forgive Me.mp3	0.00	1.7089499999999993	http://userserve-ak.last.fm/serve/300x300/52046227.jpg	128.39183673469387
440	City and Colour	Sensible Heart	City and Colour/Bring Me Your Love/City and Colour - Sensible Heart.mp3	1.00	9.151070000000003	http://userserve-ak.last.fm/serve/300x300/52046227.jpg	201.6130612244898
441	City and Colour	Sleeping Sickness	City and Colour/Bring Me Your Love/City and Colour - Sleeping Sickness.mp3	1.00	10.06064	http://userserve-ak.last.fm/serve/300x300/52046227.jpg	248.05877551020407
442	City and Colour	The Death of Me	City and Colour/Bring Me Your Love/City and Colour - The Death of Me.mp3	1.00	4.966839999999999	http://userserve-ak.last.fm/serve/300x300/52046227.jpg	190.0408163265306
443	City and Colour	The Girl	City and Colour/Bring Me Your Love/City and Colour - The Girl.mp3	1.00	6.09523	http://userserve-ak.last.fm/serve/300x300/52046227.jpg	360.15020408163264
444	City and Colour	Waiting...	City and Colour/Bring Me Your Love/City and Colour - Waiting....mp3	1.00	12.756790000000001	http://userserve-ak.last.fm/serve/300x300/52046227.jpg	294.0604081632653
445	City and Colour	What Makes A Man?	City and Colour/Bring Me Your Love/City and Colour - What Makes a Man.mp3	0.00	3.60709	http://userserve-ak.last.fm/serve/300x300/52046227.jpg	206.4195918367347
446	City and Colour	We Found Each Other in the Dark	City and Colour/Little Hell/01 - We Found Each Other in the Dark.mp3	1.00	5.622859999999998	http://userserve-ak.last.fm/serve/300x300/63731889.png	262.246475
447	City and Colour	Natural Disaster	City and Colour/Little Hell/02 - Natural Disaster.mp3	1.00	11.816550000000002	http://userserve-ak.last.fm/serve/300x300/63731889.png	229.75015
448	City and Colour	Grand Optimist	City and Colour/Little Hell/03 - Grand Optimist.mp3	0.00	5.728649999999999	http://userserve-ak.last.fm/serve/300x300/63731889.png	245.1624
449	City and Colour	Little Hell	City and Colour/Little Hell/04 - Little Hell.mp3	0.00	3.866299999999999	http://userserve-ak.last.fm/serve/300x300/63731889.png	283.3534
450	City and Colour	Fragile Bird	City and Colour/Little Hell/05 - Fragile Bird.mp3	0.00	19.07892	http://userserve-ak.last.fm/serve/300x300/63731889.png	257.2832
451	City and Colour	Northern Wind	City and Colour/Little Hell/06 - Northern Wind.mp3	1.00	4.16763	http://userserve-ak.last.fm/serve/300x300/63731889.png	255.846475
452	City and Colour	O' Sister	City and Colour/Little Hell/07 - O' Sister.mp3	1.00	9.457309999999999	http://userserve-ak.last.fm/serve/300x300/63731889.png	256.05545
453	City and Colour	Weightless	City and Colour/Little Hell/08 - Weightless.mp3	1.00	12.105940000000001	http://userserve-ak.last.fm/serve/300x300/63731889.png	212.2481
454	City and Colour	Sorrowing Man	City and Colour/Little Hell/09 - Sorrowing Man.mp3	0.00	6.395549999999999	http://userserve-ak.last.fm/serve/300x300/63731889.png	272.068525
455	City and Colour	Silver and Gold	City and Colour/Little Hell/10 - Silver and Gold.mp3	1.00	3.086349999999999	http://userserve-ak.last.fm/serve/300x300/63731889.png	279.90525
456	City and Colour	Hope for Now	City and Colour/Little Hell/11 - Hope for Now.mp3	0.00	2.268919999999999	http://userserve-ak.last.fm/serve/300x300/63731889.png	295.213
457	City and Colour	....Off By Heart	City and Colour/Sometimes/City and Colour - ....Off By Heart.mp3	1.00	12.247369999999997	http://userserve-ak.last.fm/serve/300x300/70159084.png	111.83020408163266
458	City and Colour	Casey's Song	City and Colour/Sometimes/City and Colour - Casey's Song.mp3	0.00	7.62395	http://userserve-ak.last.fm/serve/300x300/70159084.png	208.03918367346938
459	City and Colour	Comin' Home	City and Colour/Sometimes/City and Colour - Comin' Home.mp3	0.00	6.2756000000000006	http://userserve-ak.last.fm/serve/300x300/70159084.png	305.50204081632654
460	City and Colour	Day Old Hate	City and Colour/Sometimes/City and Colour - Day Old Hate.mp3	-3.00	7.730349999999999	http://userserve-ak.last.fm/serve/300x300/70159084.png	404.97632653061225
461	City and Colour	Hello, I'm In Delaware	City and Colour/Sometimes/City and Colour - Hello, I'm in Delaware.mp3	1.00	14.42293	http://userserve-ak.last.fm/serve/300x300/70159084.png	345.10367346938773
462	City and Colour	In The Water I Am Beautiful	City and Colour/Sometimes/City and Colour - In the Water I Am Beautiful.mp3	1.00	7.03324	http://userserve-ak.last.fm/serve/300x300/70159084.png	167.52326530612245
463	City and Colour	Like Knives	City and Colour/Sometimes/City and Colour - Like Knives.mp3	1.00	6.475779999999999	http://userserve-ak.last.fm/serve/300x300/70159084.png	270.7069387755102
464	City and Colour	Sam Malone	City and Colour/Sometimes/City and Colour - Sam Malone.mp3	0.00	8.45419	http://userserve-ak.last.fm/serve/300x300/70159084.png	291.5787755102041
465	City and Colour	Save Your Scissors	City and Colour/Sometimes/City and Colour - Save your Scissors.mp3	-1.00	4.1634	http://userserve-ak.last.fm/serve/300x300/70159084.png	288.705306122449
466	City and Colour	Sometimes (I Wish)	City and Colour/Sometimes/City and Colour - Sometimes (I Wish).mp3	1.00	8.316830000000002	http://userserve-ak.last.fm/serve/300x300/70159084.png	360.96
467	Coldplay	Politik	Coldplay/A Rush of Blood to the Head/01 - Politik.mp3	1.00	11.722250000000001	http://userserve-ak.last.fm/serve/300x300/100107809.png	318.6613
468	Coldplay	In My Place	Coldplay/A Rush of Blood to the Head/02 - In My Place.mp3	0.00	1.524489999999999	http://userserve-ak.last.fm/serve/300x300/100107809.png	228.9295
469	Coldplay	God Put a Smile Upon Your Face	Coldplay/A Rush of Blood to the Head/03 - God Put a Smile Upon Your Face.mp3	1.00	11.692849999999999	http://userserve-ak.last.fm/serve/300x300/100107809.png	297.3376
470	Coldplay	The Scientist	Coldplay/A Rush of Blood to the Head/04 - The Scientist.mp3	0.00	10.0731	http://userserve-ak.last.fm/serve/300x300/100107809.png	309.2653
471	Coldplay	Clocks	Coldplay/A Rush of Blood to the Head/05 - Clocks.mp3	0.00	13.034640000000002	http://userserve-ak.last.fm/serve/300x300/100107809.png	307.5688
472	Coldplay	Daylight	Coldplay/A Rush of Blood to the Head/06 - Daylight.mp3	1.00	10.842170000000002	http://userserve-ak.last.fm/serve/300x300/100107809.png	327.8224
473	Coldplay	Green Eyes	Coldplay/A Rush of Blood to the Head/07 - Green Eyes.mp3	1.00	10.15907	http://userserve-ak.last.fm/serve/300x300/100107809.png	223.1614
474	Coldplay	Warning Sign	Coldplay/A Rush of Blood to the Head/08 - Warning Sign.mp3	-2.00	10.76149	http://userserve-ak.last.fm/serve/300x300/100107809.png	331.2415
475	Coldplay	A Whisper	Coldplay/A Rush of Blood to the Head/09 - A Whisper.mp3	1.00	15.798300000000002	http://userserve-ak.last.fm/serve/300x300/100107809.png	238.5082
476	Coldplay	A Rush of Blood to the Head	Coldplay/A Rush of Blood to the Head/10 - A Rush of Blood to the Head.mp3	1.00	11.30479	http://userserve-ak.last.fm/serve/300x300/100107809.png	351.469
477	Coldplay	Amsterdam	Coldplay/A Rush of Blood to the Head/11 - Amsterdam.mp3	1.00	-3.5747	http://userserve-ak.last.fm/serve/300x300/100107809.png	319.4965
478	Coldplay	Always In My Head	Coldplay/Ghost Stories [Deluxe Edition]/01 Always In My Head.mp3	1.00	6.7815399999999995	http://userserve-ak.last.fm/serve/300x300/99307037.jpg	216.688875
479	Coldplay	Magic	Coldplay/Ghost Stories [Deluxe Edition]/02 Magic.mp3	0.00	8.485930000000002	http://userserve-ak.last.fm/serve/300x300/99307037.jpg	285.07745
480	Coldplay	Ink	Coldplay/Ghost Stories [Deluxe Edition]/03 Ink.mp3	1.00	12.362350000000002	http://userserve-ak.last.fm/serve/300x300/99307037.jpg	228.443975
481	Coldplay	True Love	Coldplay/Ghost Stories [Deluxe Edition]/04 True Love.mp3	1.00	9.399259999999999	http://userserve-ak.last.fm/serve/300x300/99307037.jpg	246.076625
482	Coldplay	Midnight	Coldplay/Ghost Stories [Deluxe Edition]/05 Midnight.mp3	1.00	9.637069999999999	http://userserve-ak.last.fm/serve/300x300/99307037.jpg	294.74275
483	Coldplay	Another's Arms	Coldplay/Ghost Stories [Deluxe Edition]/06 Another's Arms.mp3	1.00	13.944509999999998	http://userserve-ak.last.fm/serve/300x300/99307037.jpg	234.478275
484	Coldplay	Oceans	Coldplay/Ghost Stories [Deluxe Edition]/07 Oceans.mp3	1.00	-2.8816600000000003	http://userserve-ak.last.fm/serve/300x300/99307037.jpg	321.753375
485	Coldplay	A Sky Full of Stars	Coldplay/Ghost Stories [Deluxe Edition]/08 A Sky Full Of Stars.mp3	1.00	10.626870000000001	http://userserve-ak.last.fm/serve/300x300/99307037.jpg	268.54195
486	Coldplay	O	Coldplay/Ghost Stories [Deluxe Edition]/09 O.mp3	1.00	0.13877000000000033	http://userserve-ak.last.fm/serve/300x300/99307037.jpg	323.555825
487	Coldplay	All Your Friends	Coldplay/Ghost Stories [Deluxe Edition]/10 All Your Friends.mp3	0.00	2.903639999999999	http://userserve-ak.last.fm/serve/300x300/99307037.jpg	211.88235
488	Coldplay	Ghost Story	Coldplay/Ghost Stories [Deluxe Edition]/11 Ghost Story.mp3	1.00	11.563650000000002	http://userserve-ak.last.fm/serve/300x300/99307037.jpg	257.4399
489	Coldplay	Mylo Xyloto	Coldplay/Mylo Xyloto/01 Mylo Xyloto.mp3	1.00	1.061489999999999	http://userserve-ak.last.fm/serve/300x300/88588967.png	42.16485
490	Coldplay	Hurts Like Heaven	Coldplay/Mylo Xyloto/02 Hurts Like Heaven.mp3	1.00	9.42262	http://userserve-ak.last.fm/serve/300x300/88588967.png	242.31505
491	Coldplay	Paradise	Coldplay/Mylo Xyloto/03 Paradise.mp3	1.00	11.578330000000002	http://userserve-ak.last.fm/serve/300x300/88588967.png	277.68485
492	Coldplay	Charlie Brown	Coldplay/Mylo Xyloto/04 Charlie Brown.mp3	0.00	12.800169999999999	http://userserve-ak.last.fm/serve/300x300/88588967.png	285.234225
493	Coldplay	Us Against The World	Coldplay/Mylo Xyloto/05 Us Against The World.mp3	1.00	-0.1927000000000005	http://userserve-ak.last.fm/serve/300x300/88588967.png	239.8334
494	Coldplay	M.M.I.X.	Coldplay/Mylo Xyloto/06 M.M.I.X..mp3	1.00	0.8473599999999999	http://userserve-ak.last.fm/serve/300x300/88588967.png	48.538725
495	Coldplay	Every Teardrop Is A Waterfall	Coldplay/Mylo Xyloto/07 Every Teardrop Is A Waterfall.mp3	1.00	9.388249999999998	http://userserve-ak.last.fm/serve/300x300/88588967.png	240.8783
496	Coldplay	Major Minus	Coldplay/Mylo Xyloto/08 Major Minus.mp3	0.00	10.16482	http://userserve-ak.last.fm/serve/300x300/88588967.png	210.419525
497	Coldplay	U.F.O.	Coldplay/Mylo Xyloto/09 U.F.O..mp3	1.00	5.40765	http://userserve-ak.last.fm/serve/300x300/88588967.png	137.8775
498	Coldplay	Up In Flames	Coldplay/Mylo Xyloto/11 Up In Flames.mp3	0.00	5.555569999999998	http://userserve-ak.last.fm/serve/300x300/88588967.png	193.309325
499	Coldplay	A Hopeful Transmission	Coldplay/Mylo Xyloto/12 A Hopeful Transmission.mp3	1.00	4.57514	http://userserve-ak.last.fm/serve/300x300/88588967.png	33.074225
500	Coldplay	Don't Let It Break Your Heart	Coldplay/Mylo Xyloto/13 Don't Let It Break Your Heart.mp3	0.00	12.97965	http://userserve-ak.last.fm/serve/300x300/88588967.png	234.16485
501	Coldplay	Up With The Birds	Coldplay/Mylo Xyloto/14 Up With The Birds.mp3	1.00	7.4258	http://userserve-ak.last.fm/serve/300x300/88588967.png	225.701175
502	Coldplay	Charlie Brown (Live From Glastonbury 2011)	Coldplay/Mylo Xyloto/15 Charlie Brown (Live From Glastonbury 2011).mp3	1.00	13.450390000000001	http://userserve-ak.last.fm/serve/300x300/88588967.png	288.29055
503	Coldplay	Life Is For Living (Live From Glastonbury 2011)	Coldplay/Mylo Xyloto/16 Life Is For Living (Live From Glastonbury 2011).mp3	1.00	0.40888999999999946	http://userserve-ak.last.fm/serve/300x300/88588967.png	149.737075
504	Coldplay	Every Teardrop Is A Waterfall (Live From Glastonbury 2011)	Coldplay/Mylo Xyloto/17 Every Teardrop Is A Waterfall (Live From Glastonbury 2011).mp3	1.00	10.995100000000001	http://userserve-ak.last.fm/serve/300x300/88588967.png	278.15505
505	Coldplay	Don't Panic	Coldplay/Parachutes/01 - Dont Panic.mp3	3.00	11.020379999999998	http://userserve-ak.last.fm/serve/300x300/100107463.png	137.4751
507	Coldplay	Spies	Coldplay/Parachutes/03 - Spies.mp3	0.00	10.81679	http://userserve-ak.last.fm/serve/300x300/100107463.png	318.8701
508	Coldplay	Sparks	Coldplay/Parachutes/04 - Sparks.mp3	1.00	3.2636799999999997	http://userserve-ak.last.fm/serve/300x300/100107463.png	227.2069
509	Coldplay	Yellow	Coldplay/Parachutes/05 - Yellow.mp3	1.00	2.6589299999999996	http://userserve-ak.last.fm/serve/300x300/100107463.png	269.2018
510	Coldplay	Trouble	Coldplay/Parachutes/06 - Trouble.mp3	0.00	11.90958	http://userserve-ak.last.fm/serve/300x300/100107463.png	270.8983
511	Coldplay	Parachutes	Coldplay/Parachutes/07 - Parachutes.mp3	1.00	6.047159999999999	http://userserve-ak.last.fm/serve/300x300/100107463.png	46.6732
512	Coldplay	High Speed	Coldplay/Parachutes/08 - High Speed.mp3	-2.00	5.299399999999999	http://userserve-ak.last.fm/serve/300x300/100107463.png	254.2726
513	Coldplay	We Never Change	Coldplay/Parachutes/09 - We Never Change.mp3	0.00	7.752290000000001	http://userserve-ak.last.fm/serve/300x300/100107463.png	249.6007
514	Coldplay	Everything's Not Lost	Coldplay/Parachutes/10 - Everythings Not Lost.mp3	0.00	6.08282	http://userserve-ak.last.fm/serve/300x300/100107463.png	435.25
515	Coldplay	Square One	Coldplay/X&Y/01 - Square One.mp3	0.00	10.91927	http://userserve-ak.last.fm/serve/300x300/88463793.png	287.451375
516	Coldplay	What If	Coldplay/X&Y/02 - What If.mp3	0.00	9.139090000000002	http://userserve-ak.last.fm/serve/300x300/88463793.png	297.0905625
517	Coldplay	White Shadows	Coldplay/X&Y/03 - White Shadows.mp3	0.00	12.588580000000001	http://userserve-ak.last.fm/serve/300x300/88463793.png	328.2024375
518	Coldplay	Fix You	Coldplay/X&Y/04 - Fix You.mp3	1.00	7.410410000000001	http://userserve-ak.last.fm/serve/300x300/88463793.png	295.0269375
519	Coldplay	Talk	Coldplay/X&Y/05 - Talk.mp3	-2.00	9.96028	http://userserve-ak.last.fm/serve/300x300/88463793.png	311.3011875
520	Coldplay	Speed of Sound	Coldplay/X&Y/07 - Speed of Sound.mp3	0.00	13.606439999999998	http://userserve-ak.last.fm/serve/300x300/88463793.png	288.4963125
521	Coldplay	A Message	Coldplay/X&Y/08 - A Message.mp3	1.00	8.919	http://userserve-ak.last.fm/serve/300x300/88463793.png	285.361625
522	Coldplay	Low	Coldplay/X&Y/09 - Low.mp3	0.00	13.75039	http://userserve-ak.last.fm/serve/300x300/88463793.png	332.1469375
523	Coldplay	The Hardest Part	Coldplay/X&Y/10 - The Hardest Part.mp3	1.00	13.09409	http://userserve-ak.last.fm/serve/300x300/88463793.png	265.0905625
524	Coldplay	Swallowed in the Sea	Coldplay/X&Y/11 - Swallowed in the Sea.mp3	1.00	7.797260000000001	http://userserve-ak.last.fm/serve/300x300/88463793.png	239.020375
525	Coldplay	Twisted Logic	Coldplay/X&Y/12 - Twisted Logic.mp3	1.00	3.045399999999999	http://userserve-ak.last.fm/serve/300x300/88463793.png	301.92325
526	Coldplay	Til Kingdom Come	Coldplay/X&Y/13 - Til Kingdom Come.mp3	1.00	8.530839999999998	http://userserve-ak.last.fm/serve/300x300/88463793.png	250.72325
527	Damien Rice	Delicate	Damien Rice/Live from the Union Chapel/01 Delicate.mp3	1.00	3.13093	http://userserve-ak.last.fm/serve/300x300/61534393.png	320.8113125
528	Damien Rice	The Blower's Daughter	Damien Rice/Live from the Union Chapel/02 The Blower's Daughter.mp3	1.00	0.1356199999999999	http://userserve-ak.last.fm/serve/300x300/61534393.png	298.58
529	Damien Rice	Volcano	Damien Rice/Live from the Union Chapel/03 Volcano.mp3	0.00	2.5370900000000003	http://userserve-ak.last.fm/serve/300x300/61534393.png	322.7399375
530	Damien Rice	Then Go	Damien Rice/Live from the Union Chapel/04 Then Go.mp3	1.00	2.9343699999999997	http://userserve-ak.last.fm/serve/300x300/61534393.png	345.9876875
531	Damien Rice	Baby Sister	Damien Rice/Live from the Union Chapel/05 Baby Sister.mp3	0.00	1.1946900000000003	http://userserve-ak.last.fm/serve/300x300/61534393.png	264.125375
532	Damien Rice	Be My Husband	Damien Rice/Live from the Union Chapel/06 Be My Husband.mp3	0.00	11.88352	http://userserve-ak.last.fm/serve/300x300/61534393.png	161.4651875
533	Damien Rice	Amie	Damien Rice/Live from the Union Chapel/07 Amie.mp3	3.00	1.97041	http://userserve-ak.last.fm/serve/300x300/61534393.png	264.5684375
534	Damien Rice	Silent Night	Damien Rice/Live from the Union Chapel/08 Silent Night.mp3	0.00	0.29541999999999895	http://userserve-ak.last.fm/serve/300x300/61534393.png	183.9310625
535	Damien Rice	Delicate	Damien Rice/O/01 Delicate.mp3	1.00	3.13093	http://userserve-ak.last.fm/serve/300x300/69553578.png	312.19466666666665
536	Damien Rice	Volcano	Damien Rice/O/02 Volcano.mp3	0.00	2.5370900000000003	http://userserve-ak.last.fm/serve/300x300/69553578.png	278.73179166666665
537	Damien Rice	The Blower's Daughter	Damien Rice/O/03 The Blower's Daughter.mp3	1.00	0.1356199999999999	http://userserve-ak.last.fm/serve/300x300/69553578.png	284.504875
538	Damien Rice	Cannonball	Damien Rice/O/04 Cannonball.mp3	1.00	7.683330000000001	http://userserve-ak.last.fm/serve/300x300/69553578.png	310.131
539	Damien Rice	Older Chests	Damien Rice/O/05 Older Chests.mp3	-1.00	3.8171000000000006	http://userserve-ak.last.fm/serve/300x300/69553578.png	286.54241666666667
540	Damien Rice	Amie	Damien Rice/O/06 Amie.mp3	1.00	1.97041	http://userserve-ak.last.fm/serve/300x300/69553578.png	276.25016666666664
541	Damien Rice	Cheers Darlin'	Damien Rice/O/07 Cheers Darlin'.mp3	0.00	3.3349099999999996	http://userserve-ak.last.fm/serve/300x300/69553578.png	350.35954166666664
542	Damien Rice	Cold Water	Damien Rice/O/08 Cold Water.mp3	1.00	3.30786	http://userserve-ak.last.fm/serve/300x300/69553578.png	299.52529166666665
543	Damien Rice	I Remember	Damien Rice/O/09 I Remember.mp3	1.00	0.7241999999999991	http://userserve-ak.last.fm/serve/300x300/69553578.png	331.3946666666667
544	Damien Rice	Eskimo	Damien Rice/O/10 Eskimo.mp3	1.00	2.42694	http://userserve-ak.last.fm/serve/300x300/69553578.png	307.33591666666666
545	Damien Rice	Moody Mooday	Damien Rice/B-Sides/04 Moody Mooday.mp3	1.00	8.37403	http://userserve-ak.last.fm/serve/300x300/78445416.png	230.63510204081632
546	Damien Rice	Delicate (Live In Dublin)	Damien Rice/B-Sides/05 Delicate (Live In Dublin).mp3	1.00	-1.91687	http://userserve-ak.last.fm/serve/300x300/78445416.png	367.7779591836735
547	Damien Rice	Volcano (Instrumental)	Damien Rice/B-Sides/06 Volcano (Instrumental).mp3	1.00	8.869970000000001	http://userserve-ak.last.fm/serve/300x300/78445416.png	210.78204081632654
548	Damien Rice	Volcano ('97 Demo)	Damien Rice/B-Sides/07 Volcano ('97 Demo).mp3	1.00	4.72553	http://userserve-ak.last.fm/serve/300x300/78445416.png	156.34285714285716
549	Damien Rice	Cannonball (Radio Remix)	Damien Rice/B-Sides/08 Cannonball (Radio Remix).mp3	1.00	7.131169999999999	http://userserve-ak.last.fm/serve/300x300/78445416.png	207.25551020408165
550	Damien Rice	9 Crimes	Damien Rice/9/01 9 Crimes.mp3	1.00	4.88541	http://userserve-ak.last.fm/serve/300x300/87242011.png	219.3555
551	Damien Rice	The Animals Were Gone	Damien Rice/9/02 The Animals Were Gone.mp3	1.00	3.598950000000001	http://userserve-ak.last.fm/serve/300x300/87242011.png	341.16445833333336
552	Damien Rice	Elephant.	Damien Rice/9/03 Elephant..mp3	1.00	-0.38185	http://userserve-ak.last.fm/serve/300x300/87242011.png	357.54325
553	Damien Rice	Rootless Tree	Damien Rice/9/04 Rootless Tree.mp3	-3.00	7.26847	http://userserve-ak.last.fm/serve/300x300/87242011.png	262.90158333333335
554	Damien Rice	Dogs	Damien Rice/9/05 Dogs.mp3	1.00	3.92222	http://userserve-ak.last.fm/serve/300x300/87242011.png	251.068125
555	Damien Rice	Coconut Skins	Damien Rice/9/06 Coconut Skins.mp3	1.00	7.503599999999999	http://userserve-ak.last.fm/serve/300x300/87242011.png	225.520375
556	Damien Rice	Me My Yoke And I	Damien Rice/9/07 Me My Yoke And I.mp3	0.00	12.24926	http://userserve-ak.last.fm/serve/300x300/87242011.png	357.6999583333333
557	Damien Rice	Grey Room	Damien Rice/9/08 Grey Room.mp3	-1.00	-0.23406000000000122	http://userserve-ak.last.fm/serve/300x300/87242011.png	343.6983333333333
558	Damien Rice	Accidental Babies	Damien Rice/9/09 Accidental Babies.mp3	1.00	3.273059999999999	http://userserve-ak.last.fm/serve/300x300/87242011.png	394.0101666666667
559	Damien Rice	Cannonball	Damien Rice/Live at Fingerprints Warts & All/01 Cannonball.mp3	0.00	7.683330000000001	http://userserve-ak.last.fm/serve/300x300/41105339.jpg	252.350875
560	Damien Rice	Coconut Skins	Damien Rice/Live at Fingerprints Warts & All/02 Coconut Skins.mp3	1.00	7.503599999999999	http://userserve-ak.last.fm/serve/300x300/41105339.jpg	238.715
561	Damien Rice	Grey Room Intro	Damien Rice/Live at Fingerprints Warts & All/03 Grey Room Intro.mp3	0.00	2.078969999999999	http://userserve-ak.last.fm/serve/300x300/41105339.jpg	83.443125
562	Damien Rice	Grey Room	Damien Rice/Live at Fingerprints Warts & All/04 Grey Room.mp3	1.00	-0.23406000000000122	http://userserve-ak.last.fm/serve/300x300/41105339.jpg	333.304375
563	Damien Rice	Volcano	Damien Rice/Live at Fingerprints Warts & All/05 Volcano.mp3	0.00	2.5370900000000003	http://userserve-ak.last.fm/serve/300x300/41105339.jpg	393.177
564	Damien Rice	Rootless Tree	Damien Rice/Live at Fingerprints Warts & All/07 Rootless Tree.mp3	1.00	7.26847	http://userserve-ak.last.fm/serve/300x300/41105339.jpg	285.4480625
565	Damien Rice	I Remember	Damien Rice/Live at Fingerprints Warts & All/08 I Remember.mp3	1.00	0.7241999999999991	http://userserve-ak.last.fm/serve/300x300/41105339.jpg	378.5223125
566	Deafheaven	From the Kettle Onto the Coil	Deafheaven/Adult Swim Singles Program 2014/12 From the Kettle Onto the Coil.mp3	1.00	6.04483	http://userserve-ak.last.fm/serve/300x300/100720709.jpg	396.2636875
567	Deafheaven	Dream House	Deafheaven/Sunbather/01 Dream House.mp3	1.00	12.89786	http://userserve-ak.last.fm/serve/300x300/89689517.png	554.63185
568	Deafheaven	Irresistible	Deafheaven/Sunbather/02 Irresistible.mp3	1.00	5.750470000000001	http://userserve-ak.last.fm/serve/300x300/89689517.png	193.175525
569	Deafheaven	Sunbather	Deafheaven/Sunbather/03 Sunbather.mp3	0.00	3.97045	http://userserve-ak.last.fm/serve/300x300/89689517.png	616.855525
570	Deafheaven	Please Remember	Deafheaven/Sunbather/04 Please Remember.mp3	1.00	5.87151	http://userserve-ak.last.fm/serve/300x300/89689517.png	386.246525
571	Deafheaven	Vertigo	Deafheaven/Sunbather/05 Vertigo.mp3	1.00	5.456010000000002	http://userserve-ak.last.fm/serve/300x300/89689517.png	877.113475
572	Deafheaven	Windows	Deafheaven/Sunbather/06 Windows.mp3	0.00	2.0442499999999993	http://userserve-ak.last.fm/serve/300x300/89689517.png	282.88
573	Deafheaven	The Pecan Tree	Deafheaven/Sunbather/07 The Pecan Tree.mp3	1.00	9.461519999999999	http://userserve-ak.last.fm/serve/300x300/89689517.png	686.9943
574	Death Cab For Cutie	I Will Follow You Into The Dark	Death Cab For Cutie/Plans/Death Cab For Cutie - I Will Follow you Into the Dark.mp3	-6.00	2.0086199999999995	http://userserve-ak.last.fm/serve/300x300/86801123.png	189.20489795918368
575	Death Grips	Anne Bonny	Death Grips/Government Plates/Death Grips - Government Plates - 02 - Anne Bonny.mp3	0.00	16.93258	http://userserve-ak.last.fm/serve/300x300/94655577.png	207.441525
576	Death Grips	Two Heavens	Death Grips/Government Plates/Death Grips - Government Plates - 03 - Two Heavens.mp3	1.00	11.39893	http://userserve-ak.last.fm/serve/300x300/94655577.png	182.076625
577	Death Grips	Birds	Death Grips/Government Plates/Death Grips - Government Plates - 05 - Birds.mp3	0.00	11.54035	http://userserve-ak.last.fm/serve/300x300/94655577.png	277.9199
578	Death Grips	Feels like a wheel	Death Grips/Government Plates/Death Grips - Government Plates - 06 - Feels like a wheel.mp3	1.00	10.73192	http://userserve-ak.last.fm/serve/300x300/94655577.png	141.7697
579	Death Grips	Big House	Death Grips/Government Plates/Death Grips - Government Plates - 08 - Big House.mp3	0.00	18.74871	http://userserve-ak.last.fm/serve/300x300/94655577.png	138.713375
580	Death Grips	Government Plates	Death Grips/Government Plates/Death Grips - Government Plates - 09 - Government Plates.mp3	1.00	15.205460000000001	http://userserve-ak.last.fm/serve/300x300/94655577.png	162.092975
581	Death Grips	Come up and get me	Death Grips/NO LOVE DEEP WEB/Death Grips - NO LOVE DEEP WEB - 01 - Come up and get me.mp3	1.00	4.44637	http://userserve-ak.last.fm/serve/300x300/103994971.png	252.633375
582	Death Grips	Lil Boy	Death Grips/NO LOVE DEEP WEB/Death Grips - NO LOVE DEEP WEB - 02 - Lil Boy.mp3	1.00	16.98307	http://userserve-ak.last.fm/serve/300x300/103994971.png	226.458675
702	Kiasmos	Burnt	Kiasmos/Erased Tapes Collection VI/07_Burnt.mp3	0.00	12.65411	http://userserve-ak.last.fm/serve/300x300/102770769.jpg	374.9094
583	Death Grips	No Love	Death Grips/NO LOVE DEEP WEB/Death Grips - NO LOVE DEEP WEB - 03 - No Love.mp3	1.00	17.03723	http://userserve-ak.last.fm/serve/300x300/103994971.png	303.963975
584	Death Grips	Black Dice	Death Grips/NO LOVE DEEP WEB/Death Grips - NO LOVE DEEP WEB - 04 - Black Dice.mp3	0.00	15.178430000000003	http://userserve-ak.last.fm/serve/300x300/103994971.png	206.99745
585	Death Grips	World of Dogs	Death Grips/NO LOVE DEEP WEB/Death Grips - NO LOVE DEEP WEB - 05 - World of Dogs.mp3	1.00	9.760290000000002	http://userserve-ak.last.fm/serve/300x300/103994971.png	162.458675
586	Death Grips	Lock your doors	Death Grips/NO LOVE DEEP WEB/Death Grips - NO LOVE DEEP WEB - 06 - Lock your doors.mp3	1.00	14.23934	http://userserve-ak.last.fm/serve/300x300/103994971.png	232.36235
587	Death Grips	Whammy	Death Grips/NO LOVE DEEP WEB/Death Grips - NO LOVE DEEP WEB - 07 - Whammy.mp3	0.00	8.27802	http://userserve-ak.last.fm/serve/300x300/103994971.png	189.443175
588	Death Grips	Hunger games	Death Grips/NO LOVE DEEP WEB/Death Grips - NO LOVE DEEP WEB - 08 - Hunger games.mp3	1.00	12.673270000000001	http://userserve-ak.last.fm/serve/300x300/103994971.png	159.245625
589	Death Grips	Deep Web	Death Grips/NO LOVE DEEP WEB/Death Grips - NO LOVE DEEP WEB - 09 - Deep Web.mp3	1.00	15.03574	http://userserve-ak.last.fm/serve/300x300/103994971.png	138.373775
590	Death Grips	Stockton	Death Grips/NO LOVE DEEP WEB/Death Grips - NO LOVE DEEP WEB - 10 - Stockton.mp3	0.00	15.400709999999997	http://userserve-ak.last.fm/serve/300x300/103994971.png	197.488875
591	Death Grips	Pop	Death Grips/NO LOVE DEEP WEB/Death Grips - NO LOVE DEEP WEB - 11 - Pop.mp3	1.00	12.037810000000001	http://userserve-ak.last.fm/serve/300x300/103994971.png	173.37785
592	Death Grips	Bass rattle stars out the sky	Death Grips/NO LOVE DEEP WEB/Death Grips - NO LOVE DEEP WEB - 12 - Bass rattle stars out the sky.mp3	0.00	11.823499999999998	http://userserve-ak.last.fm/serve/300x300/103994971.png	147.333775
593	Death Grips	Artificial death in the west	Death Grips/NO LOVE DEEP WEB/Death Grips - NO LOVE DEEP WEB - 13 - Artificial death in the west.mp3	1.00	17.01107	http://userserve-ak.last.fm/serve/300x300/103994971.png	358.403175
594	Death Grips	Get Got	Death Grips/The Money Store/01. Get Got.mp3	1.00	19.74225	http://userserve-ak.last.fm/serve/300x300/76945790.png	171.941125
595	Death Grips	The Fever (Aye Aye)	Death Grips/The Money Store/02. The Fever (Aye Aye).mp3	1.00	9.41888	http://userserve-ak.last.fm/serve/300x300/76945790.png	187.0399
596	Death Grips	Lost Boys	Death Grips/The Money Store/03. Lost Boys.mp3	1.00	9.43359	http://userserve-ak.last.fm/serve/300x300/76945790.png	186.38685
597	Death Grips	Blackjack	Death Grips/The Money Store/04. Blackjack.mp3	0.00	15.210969999999999	http://userserve-ak.last.fm/serve/300x300/76945790.png	142.05705
598	Death Grips	Hustle Bones	Death Grips/The Money Store/05. Hustle Bones.mp3	0.00	14.473010000000001	http://userserve-ak.last.fm/serve/300x300/76945790.png	192.421125
599	Death Grips	I've Seen Footage	Death Grips/The Money Store/06. I've Seen Footage.mp3	0.00	16.107259999999997	http://userserve-ak.last.fm/serve/300x300/76945790.png	202.92235
600	Death Grips	Double Helix	Death Grips/The Money Store/07. Double Helix.mp3	0.00	9.49644	http://userserve-ak.last.fm/serve/300x300/76945790.png	160.1599
601	Death Grips	System Blower	Death Grips/The Money Store/08. System Blower.mp3	0.00	16.942399999999996	http://userserve-ak.last.fm/serve/300x300/76945790.png	228.156625
602	Death Grips	The Cage	Death Grips/The Money Store/09. The Cage.mp3	1.00	14.789030000000003	http://userserve-ak.last.fm/serve/300x300/76945790.png	211.150925
603	Death Grips	Punk Weight	Death Grips/The Money Store/10. Punk Weight.mp3	1.00	13.736040000000002	http://userserve-ak.last.fm/serve/300x300/76945790.png	204.30685
604	Death Grips	Fuck That	Death Grips/The Money Store/11. Fuck That.mp3	0.00	17.982860000000003	http://userserve-ak.last.fm/serve/300x300/76945790.png	144.930525
605	Death Grips	Bitch Please	Death Grips/The Money Store/12. Bitch Please.mp3	3.00	10.81742	http://userserve-ak.last.fm/serve/300x300/76945790.png	176.068475
606	Death Grips	Hacker	Death Grips/The Money Store/13. Hacker.mp3	0.00	15.665160000000001	http://userserve-ak.last.fm/serve/300x300/76945790.png	275.595
607	Death Grips	I Break Mirrors With My Face In The United States	Death Grips/the Powers That B/01 - I Break Mirrors With My Face In The United States.mp3	0.00	15.3675	http://userserve-ak.last.fm/serve/300x300/101489185.jpg	161.15255
608	Death Grips	Inanimate Sensation	Death Grips/the Powers That B/02 - Inanimate Sensation.mp3	1.00	12.84997	http://userserve-ak.last.fm/serve/300x300/101489185.jpg	364.09785
609	Death Grips	Turned Off	Death Grips/the Powers That B/03 - Turned Off.mp3	1.00	12.575610000000002	http://userserve-ak.last.fm/serve/300x300/101489185.jpg	277.893775
610	Death Grips	Why A Bitch Gotta Lie	Death Grips/the Powers That B/04 - Why A Bitch Gotta Lie.mp3	1.00	13.36811	http://userserve-ak.last.fm/serve/300x300/101489185.jpg	280.1142
611	Death Grips	PSS PSS	Death Grips/the Powers That B/05 - Pss Pss.mp3	1.00	12.287260000000002	http://userserve-ak.last.fm/serve/300x300/101489185.jpg	273.870925
612	Death Grips	Beyond Alive	Death Grips/the Powers That B/07 - Beyond Alive.mp3	0.00	14.45985	http://userserve-ak.last.fm/serve/300x300/101489185.jpg	367.93785
613	Death Grips	Centuries Of Damn	Death Grips/the Powers That B/08 - Centuries Of Damn.mp3	1.00	10.979720000000001	http://userserve-ak.last.fm/serve/300x300/101489185.jpg	332.30685
614	Death Grips	On GP	Death Grips/the Powers That B/09 - On GP.mp3	1.00	12.761869999999999	http://userserve-ak.last.fm/serve/300x300/101489185.jpg	367.6244
615	Death Grips	Death Grips 2.0	Death Grips/the Powers That B/10 - Death Grips 2.0.mp3	0.00	8.68464	http://userserve-ak.last.fm/serve/300x300/101489185.jpg	200.5452
616	Death Grips	Big Dipper	Death Grips/the Powers That B/Death Grips - Big Dipper.mp3	0.00	12.73586	http://userserve-ak.last.fm/serve/300x300/101489185.jpg	327.6048
617	Death Grips	Billy Not Really	Death Grips/the Powers That B/Death Grips - Billy Not Really.mp3	0.00	15.047090000000001	http://userserve-ak.last.fm/serve/300x300/101489185.jpg	228.86195
618	Death Grips	Black Quarterback	Death Grips/the Powers That B/Death Grips - Black Quarterback.mp3	1.00	16.50099	http://userserve-ak.last.fm/serve/300x300/101489185.jpg	179.333775
619	Death Grips	Fuck Me Out	Death Grips/the Powers That B/Death Grips - Fuck Me Out.mp3	1.00	7.78143	http://userserve-ak.last.fm/serve/300x300/101489185.jpg	200.205625
620	Death Grips	Have A Sad Cum	Death Grips/the Powers That B/Death Grips - Have A Sad Cum.mp3	1.00	13.869530000000002	http://userserve-ak.last.fm/serve/300x300/101489185.jpg	219.5101
621	Death Grips	Say Hey Kid	Death Grips/the Powers That B/Death Grips - Say Hey Kid.mp3	-2.00	10.22333	http://userserve-ak.last.fm/serve/300x300/101489185.jpg	207.3893
622	Death Grips	Up My Sleeves	Death Grips/the Powers That B/Death Grips - Up My Sleeves.mp3	1.00	10.7123	http://userserve-ak.last.fm/serve/300x300/101489185.jpg	317.0252
623	Death Grips	Voila	Death Grips/the Powers That B/Death Grips - Voila.mp3	0.00	7.27443	http://userserve-ak.last.fm/serve/300x300/101489185.jpg	208.98275
624	Deftones	Swerve City	Deftones/Koi No Yokan/01 Swerve City.mp3	1.00	13.042190000000002	http://userserve-ak.last.fm/serve/300x300/83905387.png	165.018725
625	Deftones	Romantic Dreams	Deftones/Koi No Yokan/02 Romantic Dreams.mp3	0.00	13.33578	http://userserve-ak.last.fm/serve/300x300/83905387.png	278.15505
626	Deftones	Leathers	Deftones/Koi No Yokan/03 Leathers.mp3	1.00	14.658750000000002	http://userserve-ak.last.fm/serve/300x300/83905387.png	248.924025
627	Deftones	Poltergeist	Deftones/Koi No Yokan/04 Poltergeist.mp3	1.00	8.673279999999999	http://userserve-ak.last.fm/serve/300x300/83905387.png	211.4383
628	Deftones	Entombed	Deftones/Koi No Yokan/05 Entombed.mp3	1.00	12.118480000000002	http://userserve-ak.last.fm/serve/300x300/83905387.png	299.2881
629	Deftones	Graphic Nature	Deftones/Koi No Yokan/06 Graphic Nature.mp3	0.00	9.560420000000001	http://userserve-ak.last.fm/serve/300x300/83905387.png	271.5722
630	Deftones	Tempest	Deftones/Koi No Yokan/07 Tempest.mp3	1.00	9.475559999999999	http://userserve-ak.last.fm/serve/300x300/83905387.png	365.508525
631	Deftones	Gauze	Deftones/Koi No Yokan/08 Gauze.mp3	1.00	11.17641	http://userserve-ak.last.fm/serve/300x300/83905387.png	281.446475
632	Deftones	Rosemary	Deftones/Koi No Yokan/09 Rosemary.mp3	1.00	9.04467	http://userserve-ak.last.fm/serve/300x300/83905387.png	413.390975
633	Deftones	Goon Squad	Deftones/Koi No Yokan/10 Goon Squad.mp3	1.00	5.042779999999999	http://userserve-ak.last.fm/serve/300x300/83905387.png	340.039125
634	Deftones	What Happened to You?	Deftones/Koi No Yokan/11 What Happened to You.mp3	1.00	15.791920000000002	http://userserve-ak.last.fm/serve/300x300/83905387.png	233.746875
635	Elbow	Starlings	Elbow/The Seldom Seen Kid/01 - Starlings.mp3	1.00	4.46858	http://userserve-ak.last.fm/serve/300x300/49362145.png	305.0659375
636	Elbow	The Bones of You	Elbow/The Seldom Seen Kid/02 - The Bones of You.mp3	0.00	8.41243	http://userserve-ak.last.fm/serve/300x300/49362145.png	289.079
637	Elbow	Mirrorball	Elbow/The Seldom Seen Kid/03 - Mirrorball.mp3	0.00	13.6005	http://userserve-ak.last.fm/serve/300x300/49362145.png	350.231625
638	Elbow	Grounds for Divorce	Elbow/The Seldom Seen Kid/04 - Grounds for Divorce.mp3	0.00	8.02826	http://userserve-ak.last.fm/serve/300x300/49362145.png	219.5149375
639	Elbow	An Audience With the Pope	Elbow/The Seldom Seen Kid/05 - An Audience With the Pope.mp3	0.00	9.486039999999998	http://userserve-ak.last.fm/serve/300x300/49362145.png	267.8675625
640	Elbow	Weather to Fly	Elbow/The Seldom Seen Kid/06 - Weather to Fly.mp3	0.00	3.372509999999998	http://userserve-ak.last.fm/serve/300x300/49362145.png	269.1736875
641	Elbow	The Loneliness of a Tower Crane Driver	Elbow/The Seldom Seen Kid/07 - The Loneliness of a Tower Crane Driver.mp3	0.00	10.024840000000002	http://userserve-ak.last.fm/serve/300x300/49362145.png	314.52225
642	Elbow	The Fix	Elbow/The Seldom Seen Kid/08 - The Fix.mp3	0.00	3.148189999999999	http://userserve-ak.last.fm/serve/300x300/49362145.png	267.9459375
643	Elbow	Some Riot	Elbow/The Seldom Seen Kid/09 - Some Riot.mp3	0.00	1.55971	http://userserve-ak.last.fm/serve/300x300/49362145.png	323.247125
644	Elbow	One Day Like This	Elbow/The Seldom Seen Kid/10 - One Day Like This.mp3	1.00	15.611539999999997	http://userserve-ak.last.fm/serve/300x300/49362145.png	394.221875
645	Elbow	Friend of Ours	Elbow/The Seldom Seen Kid/11 - Friend of Ours.mp3	0.00	6.297600000000002	http://userserve-ak.last.fm/serve/300x300/49362145.png	301.3304375
646	Elbow	We're Away	Elbow/The Seldom Seen Kid/12 - We're Away.mp3	1.00	3.1037	http://userserve-ak.last.fm/serve/300x300/49362145.png	119.4920625
647	Eluvium	Don't Get Any Closer	Eluvium/Nightmare Ending/01. Eluvium - Don't Get Any Closer.mp3	1.00	-1.0484300000000002	http://userserve-ak.last.fm/serve/300x300/90044963.png	549.20175
648	Eluvium	Warm	Eluvium/Nightmare Ending/02. Eluvium - Warm.mp3	0.00	-4.59877	http://userserve-ak.last.fm/serve/300x300/90044963.png	432.82585
649	Eluvium	By the Rails	Eluvium/Nightmare Ending/03. Eluvium - By the Rails.mp3	1.00	-0.5813199999999998	http://userserve-ak.last.fm/serve/300x300/90044963.png	138.008075
650	Eluvium	Unknown Variation	Eluvium/Nightmare Ending/04. Eluvium - Unknown Variation.mp3	1.00	1.6028999999999994	http://userserve-ak.last.fm/serve/300x300/90044963.png	525.1429
651	Eluvium	Caroling	Eluvium/Nightmare Ending/05. Eluvium - Caroling.mp3	1.00	7.55927	http://userserve-ak.last.fm/serve/300x300/90044963.png	236.28065
652	Eluvium	Sleeper	Eluvium/Nightmare Ending/06. Eluvium - Sleeper.mp3	1.00	-3.9928400000000017	http://userserve-ak.last.fm/serve/300x300/90044963.png	379.3794
653	Eluvium	Envenom Mettle	Eluvium/Nightmare Ending/07. Eluvium - Envenom Mettle.mp3	1.00	8.429830000000002	http://userserve-ak.last.fm/serve/300x300/90044963.png	325.279975
654	Eluvium	Chime	Eluvium/Nightmare Ending/01. Eluvium - Chime.mp3	1.00	-3.6489199999999992	http://userserve-ak.last.fm/serve/300x300/90044963.png	208.4079
655	Eluvium	Rain Gently	Eluvium/Nightmare Ending/02. Eluvium - Rain Gently.mp3	1.00	-0.019389999999999752	http://userserve-ak.last.fm/serve/300x300/90044963.png	531.673375
656	Eluvium	Covered in Writing	Eluvium/Nightmare Ending/04. Eluvium - Covered in Writing.mp3	0.00	-2.3846299999999998	http://userserve-ak.last.fm/serve/300x300/90044963.png	561.139675
657	Eluvium	Entendre	Eluvium/Nightmare Ending/05. Eluvium - Entendre.mp3	0.00	-2.4053800000000003	http://userserve-ak.last.fm/serve/300x300/90044963.png	262.977775
658	Eluvium	Strange Arrivals	Eluvium/Nightmare Ending/06. Eluvium - Strange Arrivals.mp3	1.00	-3.1696200000000003	http://userserve-ak.last.fm/serve/300x300/90044963.png	173.0645
659	Eluvium	Happiness	Eluvium/Nightmare Ending/07. Eluvium - Happiness.mp3	1.00	-3.7707300000000005	http://userserve-ak.last.fm/serve/300x300/90044963.png	498.680675
660	Enter Shikari	Adieu	Enter Shikari/Take To The Skies/Enter Shikari - Adieu.mp3	1.00	5.20009	http://userserve-ak.last.fm/serve/300x300/97982825.png	340.2234375
661	Enter Shikari	Antwerpen	Enter Shikari/Common Dreads/Enter Shikari - Antwerpen.mp3	1.00	17.521769999999997	http://userserve-ak.last.fm/serve/300x300/100338205.png	194.773
662	Enter Shikari	Anything Can Happen In The Next Half Hour...	Enter Shikari/Take To The Skies/Enter Shikari - Anything Can Happen in the Next Half Hour....mp3	0.00	13.899360000000002	http://userserve-ak.last.fm/serve/300x300/97982825.png	271.8211875
663	Enter Shikari	Common Dreads	Enter Shikari/Common Dreads/Enter Shikari - Common Dreads.mp3	1.00	3.7310699999999984	http://userserve-ak.last.fm/serve/300x300/100338205.png	128.186875
664	Enter Shikari	Enter Shikari	Enter Shikari/Take To The Skies/Enter Shikari - Enter Shikari.mp3	1.00	15.309380000000002	http://userserve-ak.last.fm/serve/300x300/97982825.png	172.234375
665	Enter Shikari	Fanfare For The Conscious Man	Enter Shikari/Common Dreads/Enter Shikari - Fanfare For the Conscious Man.mp3	1.00	11.936970000000001	http://userserve-ak.last.fm/serve/300x300/100338205.png	251.5893125
666	Enter Shikari	Gap In The Fence	Enter Shikari/Common Dreads/Enter Shikari - Gap in the Fence.mp3	0.00	13.931190000000002	http://userserve-ak.last.fm/serve/300x300/100338205.png	246.70440625
667	Enter Shikari	Havoc A	Enter Shikari/Common Dreads/Enter Shikari - Havoc A.mp3	1.00	15.34124	http://userserve-ak.last.fm/serve/300x300/100338205.png	100.23584375
668	Enter Shikari	Havoc B	Enter Shikari/Common Dreads/Enter Shikari - Havoc B.mp3	1.00	13.292480000000002	http://userserve-ak.last.fm/serve/300x300/100338205.png	172.4121875
669	Enter Shikari	Hectic	Enter Shikari/Common Dreads/Enter Shikari - Hectic.mp3	1.00	10.76758	http://userserve-ak.last.fm/serve/300x300/100338205.png	197.254625
670	Enter Shikari	Interlude 1	Enter Shikari/Take To The Skies/Enter Shikari - Interlude 1.mp3	0.00	7.89272	http://userserve-ak.last.fm/serve/300x300/97982825.png	60.6096875
671	Enter Shikari	Interlude 3	Enter Shikari/Take To The Skies/Enter Shikari - Interlude 3.mp3	1.00	14.268509999999996	http://userserve-ak.last.fm/serve/300x300/97982825.png	18.48175
672	Enter Shikari	Interlude 4	Enter Shikari/Take To The Skies/Enter Shikari - Interlude 4.mp3	1.00	9.13462	http://userserve-ak.last.fm/serve/300x300/97982825.png	35.3371875
673	Enter Shikari	Johnny Sniper	Enter Shikari/anything can happen in the next half hour EP/Enter Shikari - Johnny Sniper.mp3	1.00	13.874479999999999	http://userserve-ak.last.fm/serve/300x300/31847589.jpg	215.4198125
674	Enter Shikari	Juggernauts	Enter Shikari/Common Dreads/Enter Shikari - Juggernauts.mp3	1.00	13.82345	http://userserve-ak.last.fm/serve/300x300/100338205.png	284.00728125
675	Enter Shikari	Kickin' Back On The Surface Of Your Cheek	Enter Shikari/KERRANG! Awards 2007/Enter Shikari - Kickin' Back on the Surface of your Cheek.mp3	1.00	10.147970000000002	fyp.matthewoneill.com/images/default.png	230.908125
676	Enter Shikari	Labyrinth	Enter Shikari/Take To The Skies/Enter Shikari - Labyrinth.mp3	0.00	16.997430000000002	http://userserve-ak.last.fm/serve/300x300/97982825.png	231.16625
677	Enter Shikari	Mothership	Enter Shikari/Mother ship {single}/Enter Shikari - Mothership.mp3	-2.00	4.939020000000001	fyp.matthewoneill.com/images/default.png	263.5494
678	Enter Shikari	No Sleep Tonight	Enter Shikari/Common Dreads/Enter Shikari - No Sleep Tonight.mp3	0.00	17.06902	http://userserve-ak.last.fm/serve/300x300/100338205.png	256.39584375
679	Enter Shikari	No Sssweat	Enter Shikari/Take To The Skies/Enter Shikari - No Sssweat.mp3	0.00	18.02448	http://userserve-ak.last.fm/serve/300x300/97982825.png	196.028375
680	Enter Shikari	OK, Time For Plan B	Enter Shikari/Take To The Skies/Enter Shikari - Ok, Time For Plan B.mp3	1.00	16.37521	http://userserve-ak.last.fm/serve/300x300/97982825.png	294.6670625
681	Enter Shikari	Solidarity	Enter Shikari/Common Dreads/Enter Shikari - Solidarity.mp3	0.00	14.646610000000003	http://userserve-ak.last.fm/serve/300x300/100338205.png	195.81790625
682	Enter Shikari	Sorry, You're Not A Winner	Enter Shikari/Take To The Skies/Enter Shikari - Sorry, You're Not a Winner.mp3	1.00	15.070819999999998	http://userserve-ak.last.fm/serve/300x300/97982825.png	231.6090625
683	Enter Shikari	Step Up	Enter Shikari/Common Dreads/Enter Shikari - Step Up.mp3	0.00	9.092	http://userserve-ak.last.fm/serve/300x300/100338205.png	280.29790625
684	Enter Shikari	The Jester	Enter Shikari/Common Dreads/Enter Shikari - The Jester.mp3	1.00	17.08089	http://userserve-ak.last.fm/serve/300x300/100338205.png	235.49790625
685	Enter Shikari	Today Won't Go Down In History	Enter Shikari/Take To The Skies/Enter Shikari - Today Won't Go Down in History.mp3	0.00	12.484989999999999	http://userserve-ak.last.fm/serve/300x300/97982825.png	214.444625
686	Enter Shikari	Wall	Enter Shikari/Common Dreads/Enter Shikari - Wall.mp3	1.00	16.74321	http://userserve-ak.last.fm/serve/300x300/100338205.png	269.30034375
687	Enter Shikari	Zzzonked	Enter Shikari/Common Dreads/Enter Shikari - Zzzonked.mp3	1.00	17.926850000000002	http://userserve-ak.last.fm/serve/300x300/100338205.png	207.41625
688	A Winged Victory for the Sullen	Steep Hills Of Vicodin Tears	A Winged Victory for the Sullen/Erased Tapes Collection IV/01_Steep_Hills_Of_Vicodin_Tears.mp3	1.00	4.9180800000000005	http://userserve-ak.last.fm/serve/300x300/74560182.jpg	265.456325
689	Nils Frahm	Snippet	Nils Frahm/Erased Tapes Collection IV/03_Snippet.mp3	1.00	-0.14115000000000073	http://userserve-ak.last.fm/serve/300x300/74559944.jpg	265.1951
690	Rival Consoles	Into The Heart I	Rival Consoles/Erased Tapes Collection IV/05_Into_The_Heart_I.mp3	0.00	13.757670000000002	http://userserve-ak.last.fm/serve/300x300/74559446.jpg	237.32245
691	Peter Broderick	Old Time	Peter Broderick/Erased Tapes Collection IV/06_Old_Time.mp3	4.00	4.128109999999999	http://userserve-ak.last.fm/serve/300x300/74559528.jpg	204.303675
692	Oliveray	Growing Waterwings	Oliveray/Erased Tapes Collection IV/07_Growing_Waterwings.mp3	0.00	-2.99089	http://userserve-ak.last.fm/serve/300x300/74559634.jpg	273.946125
693	The British Expeditionary Force	Where You Go I Will Follow	The British Expeditionary Force/Erased Tapes Collection IV/08_Where_You_Go_I_Will_Follow.mp3	1.00	11.10389	http://userserve-ak.last.fm/serve/300x300/74559788.jpg	279.19675
694	Nils Frahm	For	Nils Frahm/Erased Tapes Collection IV/10_For.mp3	1.00	8.644239999999999	http://userserve-ak.last.fm/serve/300x300/74559944.jpg	352.05225
695	Jon Hopkins	Insides (Rival Consoles RMX)	Jon Hopkins/Erased Tapes Collection IV/11_Insides_(Rival_Consoles_RMX).mp3	1.00	13.37132	http://userserve-ak.last.fm/serve/300x300/74560068.jpg	260.70205
696	Lubomyr Melnyk	Pockets Of Light (Excerpt)	Lubomyr Melnyk/Erased Tapes Collection VI/01_Pockets_Of_Light_(Excerpt).mp3	1.00	1.6445399999999986	http://userserve-ak.last.fm/serve/300x300/102770447.jpg	350.0147
697	Peter Broderick	A Snowflake	Peter Broderick/Erased Tapes Collection VI/02_A_Snowflake.mp3	0.00	3.49193	http://userserve-ak.last.fm/serve/300x300/102770463.jpg	187.50695
698	Rival Consoles	Odyssey	Rival Consoles/Erased Tapes Collection VI/03_Odyssey.mp3	1.00	7.907059999999999	http://userserve-ak.last.fm/serve/300x300/102770495.jpg	277.0547
699	Douglas Dare	Swim	Douglas Dare/Erased Tapes Collection VI/04_Swim.mp3	0.00	8.075119999999999	http://userserve-ak.last.fm/serve/300x300/102770549.jpg	276.1143
700	Nils Frahm	You	Nils Frahm/Erased Tapes Collection VI/05_You.mp3	1.00	7.067629999999999	http://userserve-ak.last.fm/serve/300x300/102770605.jpg	186.775525
701	A Winged Victory For The Sullen	Atomos VI	A Winged Victory For The Sullen/Erased Tapes Collection VI/06_Atomos_VI.mp3	0.00	-4.845260000000001	http://userserve-ak.last.fm/serve/300x300/102770721.jpg	358.1649
116	A Winged Victory For The Sullen	All Farewells Are Sudden	A Winged Victory For The Sullen/A Winged Victory For The Sullen/07_All_Farewells_Are_Sudden.mp3	1.00	-7.3671800000000005	http://userserve-ak.last.fm/serve/300x300/68742438.png	455.653875
122	A Winged Victory For The Sullen	Atomos VII	A Winged Victory For The Sullen/Atomos/06_Atomos_VII.mp3	1.00	-5.8912500000000005	http://userserve-ak.last.fm/serve/300x300/101805485.png	471.7192
128	A Winged Victory For The Sullen	Atomos VII	A Winged Victory For The Sullen/Atomos VII/01_Atomos_VII.mp3	1.00	-5.8912500000000005	http://userserve-ak.last.fm/serve/300x300/100601513.png	479.973875
133	Adebisi Shank	Mazel Tov	Adebisi Shank/This Is the Third Album of a Band Called Adebisi Shank/04 - Mazel Tov.mp3	0.00	13.946039999999999	http://userserve-ak.last.fm/serve/300x300/100510739.png	229.932975
138	Adebisi Shank	(Trio Always)	Adebisi Shank/This Is the Third Album of a Band Called Adebisi Shank/09 - (Trio Always).mp3	1.00	6.092599999999999	http://userserve-ak.last.fm/serve/300x300/100510739.png	65.648875
143	Adebisi Shank	I Answer To Doc	Adebisi Shank/This Is the Album of a Band Called Adebisi Shank/07 I Answer To Doc.mp3	1.00	16.757869999999998	http://userserve-ak.last.fm/serve/300x300/86719279.jpg	160.54857142857142
148	Adebisi Shank	(-_-)	Adebisi Shank/This Is The Second Album Of A Band Called Adebisi Shank/05 (-_-).mp3	0.00	10.83731	http://userserve-ak.last.fm/serve/300x300/60222025.jpg	123.768175
153	Adebisi Shank	Century City	Adebisi Shank/This Is The Second Album Of A Band Called Adebisi Shank/10 Century City.mp3	0.00	17.885950000000005	http://userserve-ak.last.fm/serve/300x300/60222025.jpg	305.345325
158	Alcest	Away	Alcest/Shelter/07 - Away.mp3	1.00	9.645689999999999	http://userserve-ak.last.fm/serve/300x300/96248127.png	302.41955
163	Amiina	Saga	Amiina/Kurr/Amiina - Saga.mp3	0.00	-9.840220000000001	http://userserve-ak.last.fm/serve/300x300/39622263.png	41.7255625
168	And So I Watch You From Afar	Clench Fists, Grit Teeth... Go!	And So I Watch You From Afar/And So I Watch You From Afar/03 - Clench Fists, Grit Teeth... Go!.mp3	0.00	7.8672400000000005	http://userserve-ak.last.fm/serve/300x300/80704853.jpg	379.7681632653061
173	And So I Watch You From Afar	The Voiceless	And So I Watch You From Afar/And So I Watch You From Afar/10 - The Voiceless.mp3	1.00	8.502480000000001	http://userserve-ak.last.fm/serve/300x300/80704853.jpg	387.84
178	Anoice	Tipsy Dance	Anoice/The Black Rain/Anoice_The Black Rain_04_Tipsy Dance.mp3	0.00	1.1660499999999992	http://userserve-ak.last.fm/serve/300x300/77157728.jpg	170.05714285714285
183	Anoice	Finale	Anoice/The Black Rain/Anoice_The Black Rain_09_Finale.mp3	0.00	2.86047	http://userserve-ak.last.fm/serve/300x300/77157728.jpg	468.06204081632654
28	Max Richter	Embers	Max Richter/Memoryhouse/16. Embers.mp3	0.00	-5.312950000000001	http://userserve-ak.last.fm/serve/300x300/67161254.png	218.439075
40	Max Richter	Infra 5	Max Richter/Infra/10. Infra 5.mp3	0.00	4.01082	http://userserve-ak.last.fm/serve/300x300/51460697.png	316.60725
82	65daysofstatic	Mean Low Water	65daysofstatic/One Time for all Time/05. Mean Low Water.mp3	0.00	15.184930000000002	http://userserve-ak.last.fm/serve/300x300/94767059.png	241.00571428571428
85	65daysofstatic	Radio Protector	65daysofstatic/One Time for all Time/09. Radio Protector.mp3	1.00	16.355369999999998	http://userserve-ak.last.fm/serve/300x300/94767059.png	326.24326530612245
210	Ben Frost	Nolan	Ben Frost/A U R O R A/02 Nolan.mp3	0.00	13.26335	http://userserve-ak.last.fm/serve/300x300/97867001.png	417.645725
506	Coldplay	Shiver	Coldplay/Parachutes/02 - Shiver.mp3	1.00	11.611900000000001	http://userserve-ak.last.fm/serve/300x300/100107463.png	299.6866
703	Greg Gives Peter Space	That I Am	Greg Gives Peter Space/Erased Tapes Collection VI/08_That_I_Am.mp3	0.00	2.27464	http://userserve-ak.last.fm/serve/300x300/102770831.jpg	245.9951
704	Michael Price	A Bridge	Michael Price/Erased Tapes Collection VI/09_A_Bridge.mp3	0.00	-2.74309	http://userserve-ak.last.fm/serve/300x300/102770857.jpg	189.570625
705	Nils Frahm	Hammers	Nils Frahm/Erased Tapes Collection VI/10_Hammers.mp3	0.00	8.07208	http://userserve-ak.last.fm/serve/300x300/102770605.jpg	230.530625
706	Nils Frahm	Peter (Clark Remix)	Nils Frahm/Erased Tapes Collection VI/11_Peter_(Clark_Remix).mp3	0.00	11.996790000000001	http://userserve-ak.last.fm/serve/300x300/102770605.jpg	386.95185
\.


--
-- Name: tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fypuser
--

SELECT pg_catalog.setval('tracks_id_seq', 706, true);


--
-- Name: tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: fypuser; Tablespace: 
--

ALTER TABLE ONLY tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

