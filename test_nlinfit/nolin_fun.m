function error = nolin_fun(beta)
% beta is vector that needs to be estimated

x = [0.619423315817440,0.869285003583396,0.799396983421862;0.281687703949856,0.323386104923186,0.234132615471646;0.939460579607261,0.162760533264056,0.429118413409836;0.371751309499848,0.485402676697659,0.298711928422883;0.168208205361380,0.135000775839275,0.297501736081029;0.503954661087393,0.815477096783470,0.217826666262519;0.106029349949525,0.168124667210612,5.28287734222754e-05;0.0906449574330215,0.693136858207606,0.274609174979549;0.0278686306483981,0.158133229206768,0.482154105677158;0.460817139995423,0.957282119249663,0.574542661129209;0.167867153129947,0.111048274764720,0.202679385898302;0.300881236116783,0.703406664462643,0.881042682889233;0.665519000760298,0.853880096932556,0.290613563492053;0.465594889991075,0.515457509901286,0.781757090547506;0.393401989641023,0.690079770003319,0.869230237918582;0.590688919059158,0.297461856907911,0.0584715629324807;0.122237138037148,0.00335161909439441,0.603087868888958;0.884674938014856,0.749562884570996,0.489370226540365;0.154176398645315,0.116417425804122,0.923982157807529;0.415657614244198,0.283966050836063,0.694646638472916;0.560276942308949,0.727190600016923,0.715845818254184;0.920144954277964,0.176000328832463,0.477295880910690;0.627498549984699,0.816626004368522,0.317902134415425;0.953899227289331,0.523611386105137,0.325209116714546;0.998722037329770,0.922160427506041,0.210801846857357;0.284771112055484,0.217083187841867,0.217520216368867;0.254778858284769,0.307480961679324,0.342478913824898;0.502277649832040,0.366808577481306,0.881751814496712;0.586606560721760,0.0327404772718138,0.492160268385964;0.629083848562517,0.449381400926158,0.503629863421465;0.472816961993033,0.834023282175195,0.423849223588292;0.706975953174202,0.559914653218403,0.653406567887578;0.509476498902274,0.558588032013114,0.765320712654206;0.974938566743963,0.830650028524521,0.464830173829381;0.206520388008753,0.596203158085355,0.257757179555232;0.479806525680077,0.403739327448962,0.657425732030522;0.0798722512561966,0.303783178559994,0.285491482843017;0.0876736917453587,0.878664831469699,0.665981668661215;0.955588130372366,0.395984094392185,0.448528827950519;0.355985717417228,0.657026739179861,0.952251085212611;0.205245408227253,0.549887345153816,0.540472581716312;0.664519954023166,0.773681486157756,0.450885303160572;0.300122609486439,0.579332215666849,0.296296642167414;0.931280841569944,0.237766604088348,0.278050845633571;0.906195226676704,0.0581881668587996,0.575159037306408;0.394137763480864,0.948965362915568,0.167239264132270;0.208125475064294,0.156443757788218,0.0455368271586375;0.317267771931045,0.502963565843278,0.277719890188319;0.685811452751397,0.470163206891516,0.727081903941365;0.207062855342180,0.735909754844841,0.523923074777530;0.449253103569282,0.0197275454164512,0.458246028250011;0.181580416715315,0.830089593038196,0.355311980258220;0.725004611368144,0.193326807645181,0.453018570112040;0.589381149843983,0.459634124574273,0.0605669526202892;0.862343239408484,0.498635766537298,0.377913732515434;0.627762283384296,0.138406533350840,0.952787436585113;0.526825042911381,0.590311122506074,0.721590084966143;0.458679985214240,0.545333377580954,0.650471930277871;0.555075347670848,0.900419946941478,0.550314338301739;0.410130396308900,0.0857844040826152,0.281476143459524;0.879438335586426,0.217428835898121,0.447987823879832;0.538519170113635,0.164999298675492,0.535430160351147;0.000234166787765333,0.0104625236832526,0.859167760567116;0.695084618951065,0.0193006766943071,0.783186193383656;0.838925349585490,0.710688898436158,0.0393611832704991;0.618247621171882,0.699125882162139,0.354304211035869;0.139432978784611,0.0929231560446018,0.734177451119368;0.0945091691511564,0.211282253213496,0.973218817816047;0.959134257603573,0.684322522829528,0.321538172422418;0.426593209429679,0.611833947631645,0.719352313237522;0.806543525241794,0.290090726103658,0.131847316231578;0.803321198535771,0.225827179336446,0.00289602802387545;0.833721190080499,0.503961995974845,0.700829898656295;0.0113834719575481,0.550953934543068,0.618959139003893;0.306391905126260,0.590968687685369,0.756850623171189;0.232131271775218,0.663833553937586,0.170235344623558;0.810535248606144,0.454992638187350,0.141837595640979;0.966285762686859,0.215360333581817,0.120869201946202;0.527520294444100,0.770871921164804,0.0651767473529252;0.182046145519172,0.556397745697340,0.194266759885721;0.925569524206819,0.229831029994646,0.817337588233732;0.655194391564729,0.112147058240320,0.881702159510924;0.342278349795068,0.370680875618086,0.408474312981162;0.554329441873545,0.987037870778571,0.00302655543347030;0.0546168227458023,0.0432909045435189,0.970027384385036;0.602075194862651,0.121812769193327,0.831985325228096;0.761551866421778,0.0982652367113702,0.495865317950325;0.781353703506391,0.719253486626807,0.650440339323270;0.403527996332341,0.888115531770911,0.313006029544190;0.604703008550331,0.786802991486260,0.326442150843688;0.105789794218688,0.821425789022586,0.0551389447272700;0.708242085182865,0.828101248530570,0.931949655680006;0.485338329262027,0.820679256639685,0.633660759940652;0.943418120925238,0.173496242816248,0.776500281173458;0.629216850890415,0.861264122413471,0.128388092210635;0.614263237590910,0.606478542470121,0.836804293864714;0.798991828822248,0.276474526254622,0.696138605642631;0.642489932027354,0.308601603554575,0.743666483874580;0.492537894613185,0.767850050718422,0.908144936181753;0.269674164159393,0.414729734446336,0.184506924865156];

beta0 = [5 6 7 8 9];

y0 = (beta0(1)*x(:,2)-x(:,3)/beta0(5))./(1+beta0(2)*x(:,1)+beta0(3)*x(:,2)+beta0(4)*x(:,3));

y_est = (beta(1)*x(:,2)-x(:,3)/beta(5))./(1+beta(2)*x(:,1)+beta(3)*x(:,2)+beta(4)*x(:,3));

error = norm(y_est-y0);

end