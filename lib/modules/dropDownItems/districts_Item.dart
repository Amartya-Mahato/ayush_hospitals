import 'dart:core';

class DistrictItem {
  DistrictItem();

  static List<String> andhra_PRADESH = [
    "Uknown",
    "ANANTHPUR",
    "CHITTOOR",
    "CUDDAPAH",
    "EAST GODAVARI",
    "GUNTUR",
    "KRISHNA",
    "KURNOOL",
    "NELLOR",
    "PRAKASAM",
    "SRIKAKULAM",
    "VISHAKHAPATNAM",
    "VIZIANAGARAM",
    "WEST GODAVARI"
  ];

  static List<String> arunachal_PRADESH = [
    "ANJAW",
    "CHANGLANG",
    "EAST KAMENG",
    "EAST SIANG",
    "KAMLE",
    "KURUNG KUMEY",
    "Kra Daadi",
    "LEPARADA",
    "LOHIT",
    "LONGDING",
    "LOWER DIBANG VALLEY",
    "LOWER SIANG",
    "LOWER SUBANSIRI",
    "NAMSAI",
    "PAKKE KESSANG",
    "PAPUM PARE",
    "SHI YOMI",
    "SIANG",
    "TAWANG",
    "TIRAP",
    "UPPER SIANG",
    "UPPER SUBANSIRI",
    "WEST SIANG",
    "WEST" "KAMENG"
  ];

  static List<String> assam = [
    "Uknown",
    "BAKSA",
    "BARPETA",
    "BONGAIGAON",
    "Biswanath",
    "CHIRANG",
    "Cachar",
    "DARRANG",
    "DHEMAJI",
    "DHUBRI",
    "DIBRUGARH",
    "GOALPARA",
    "GOLAGHAT",
    "HAILAKANDI",
    "HOJAI",
    "JORHAT",
    "KAMRUP METRO",
    "KAMRUP",
    "KARBI ANGLONG",
    "KARIMGANJ",
    "KOKRAJHAR",
    "LAKHIMPUR",
    "MAJULI",
    "MARIGAON",
    "NAGAON",
    "NALBARI",
    "NORTH CACHAR HILL",
    "SIBSAGAR",
    "SONITPUR",
    "SOUTH SALMARA MANCACHAR",
    "TINSUKIA",
    "UDALGURI",
    "WEST KARBI ANGLONG"
  ];

  static List<String> bihar = [
    "ARARIA",
    "ARWAL",
    "AURANGABAD",
    "BANKA",
    "BEGUSARAI",
    "BHAGALPUR",
    "BHOJPUR",
    "BUXAR",
    "DARBHANGA",
    "EAST CHAMPARAN",
    "GAYA",
    "GOPALGANJ",
    "JAMUI",
    "JEHANABAD",
    "KAIMUR (BHABUA)",
    "KATIHAR",
    "KHAGARIA",
    "KISHANGANJ",
    "LAKHISARAI",
    "MADHEPURA",
    "MADHUBANI",
    "MUNGER",
    "MUZAFFARPUR",
    "NALANDA",
    "NAWADA",
    "PATNA",
    "PURNIA",
    "ROHTAS",
    "SAHARSA",
    "SAMASTIPUR",
    "SARAN",
    "SHEIKHPURA",
    "SHEOHAR",
    "SITAMARHI",
    "SIWAN",
    "SUPAUL",
    "VAISHALI",
    "WEST CHAMPARAN"
  ];

  static List<String> chandigarh = ["CHANDIGARH"];

  static List<String> dadra_AND_NAGAR_HAVELI = ["DADRA & NAGAR HAVELI"];

  static List<String> daman_AND_DIU = ["DAMAN", "DIU"];

  static List<String> goa = ["NORTH GOA", "SOUTH GOA"];

  static List<String> gujrat = [
    "AHMEDABAD",
    "AMRELI",
    "ANAND",
    "ARVALLI",
    "BHARUCH",
    "BHAVNAGAR",
    "BOTAD",
    "Banaskantha",
    "CHHOTAUDEPUR",
    "DANG",
    "DEVBHUMI DWARKA",
    "Dahod",
    "GIR SOMNATH",
    "Gandhi Nagar",
    "JAMNAGAR",
    "JUNAGADH",
    "KACHCHH",
    "KHEDA",
    "MAHESANA",
    "MORBI",
    "Mahisagar",
    "NARMADA",
    "NAVSARI",
    "PANCH MAHALS",
    "PATAN",
    "PORBANDAR",
    "RAJKOT",
    "SURAT",
    "Sabarkantha",
    "Surendra Nagar",
    "TAPI",
    "VADODARA",
    "VALSAD"
  ];

  static List<String> hARYANA = [
    "AMBALA",
    "BHIWANI",
    "CHARKI DADRI",
    "FARIDABAD",
    "FATEHABAD",
    "GURUGRAM",
    "HISAR",
    "JHAJJAR",
    "JIND",
    "KAITHAL",
    "KARNAL",
    "KURUKSHETRA",
    "MAHENDRAGARH",
    "MEWAT",
    "PALWAL",
    "PANCHKULA",
    "PANIPAT",
    "REWARI",
    "ROHTAK",
    "SIRSA",
    "SONIPAT",
    "Yamuna Nagar"
  ];

  static List<String> himachal_PRADESH = [
    "BILASPUR",
    "CHAMBA",
    "HAMIRPUR",
    "KANGRA",
    "KINNAUR",
    "KULLU",
    "Lahul & Spiti",
    "MANDI",
    "SHIMLA",
    "SIRMAUR",
    "SOLAN",
    "UNA"
  ];

  static List<String> jammu_AND_KASHMIR = [
    "Ananthnag",
    "BARAMULLA",
    "Bandipur",
    "Budgam",
    "DODA",
    "GANDERBAL",
    "JAMMU",
    "KATHUA",
    "KISHTWAR",
    "KULGAM",
    "KUPWARA",
    "POONCH",
    "PULWAMA",
    "RAJAURI",
    "RAMBAN",
    "REASI",
    "SAMBA",
    "SHOPIAN",
    "SRINAGAR",
    "UDHAMPUR"
  ];

  static List<String> kARNATAKA = [
    "Uknown",
    "BAGALKOT",
    "BALLARY",
    "BANGALORE RURAL",
    "BANGALORE",
    "BELAGAVI",
    "BIDAR",
    "CHAMARAJNAGAR",
    "CHITRADURGA",
    "Chikamagalur",
    "DAKSHINA KANNADA",
    "DAVANGERE",
    "DHARWAD",
    "GADAG",
    "HASSAN",
    "HAVERI",
    "KALABURAGI",
    "KODAGU",
    "KOLAR",
    "KOPPAL",
    "MANDYA",
    "MYSORE",
    "RAICHUR",
    "RAMANAGAR",
    "SHIMOGA",
    "TUMKUR",
    "UDUPI",
    "UTTARA KANNADA",
    "VIJAYAPURA",
    "YADGIR"
  ];

  static List<String> kERALA = [
    "ALAPPUZHA",
    "ERNAKULAM",
    "IDUKKI",
    "KANNUR",
    "KASARGOD",
    "KOLLAM",
    "KOTTAYAM",
    "KOZHIKODE",
    "MALAPPURAM",
    "PALAKKAD",
    "PATHANAMTHITTA",
    "THIRUVANANTHAPURAM",
    "THRISSUR",
    "WAYANAD"
  ];

  static List<String> lADAKH = ["KARGIL", "LEH LADAKH"];

  static List<String> lAKSHADWEEP = ["LAKSHADWEEP"];

  static List<String> mAHARASHTRA = [
    "AHMED NAGAR",
    "AKOLA",
    "AMRAVATI",
    "AURANGABAD",
    "BEED",
    "BHANDARA",
    "BULDHANA",
    "CHANDRAPUR",
    "DHULE",
    "GADCHIROLI",
    "GONDIA",
    "HINGOLI",
    "JALGAON",
    "JALNA",
    "KOLHAPUR",
    "LATUR",
    "MUMBAI SUBURBAN",
    "MUMBAI",
    "NAGPUR",
    "NANDED",
    "NANDURBAR",
    "NASHIK",
    "OSMANABAD",
    "PALGHAR",
    "PARBHANI",
    "PUNE",
    "RAIGARH(MH)",
    "RATNAGIRI",
    "SANGLI",
    "SATARA",
    "SINDHUDURG",
    "SOLAPUR",
    "THANE",
    "WARDHA",
    "WASHIM",
    "YAVATMAL"
  ];

  static List<String> mANIPUR = [
    "Uknown",
    "BISHNUPUR",
    "CHANDEL",
    "CHURACHANDPUR",
    "IMPHAL EAST",
    "IMPHAL WEST",
    "JIRIBAM",
    "KAKCHING",
    "KAMJONG",
    "KANGPOKPI",
    "NONEY",
    "PHERZAWL",
    "SENAPATI",
    "TAMENGLONG",
    "TENGNOUPAL",
    "THOUBAL",
    "UKHRUL"
  ];

  static List<String> mEGHALAYA = [
    "EAST GARO HILLS",
    "EAST JAINTIA HILLS",
    "EAST KHASI HILLS",
    "NORTH GARO HILLS",
    "RI BHOI",
    "SOUTH GARO HILLS",
    "SOUTH WEST GARO HILLS",
    "SOUTH WEST KHASI HILLS",
    "WEST GARO HILLS",
    "WEST JAINTIA HILLS",
    "WEST KHASI HILLS"
  ];

  static List<String> mIZORAM = [
    "AIZAWL",
    "CHAMPHAI",
    "KOLASIB",
    "LAWNGTLAI",
    "LUNGLEI",
    "MAMMIT",
    "SAIHA",
    "SERCHHIP"
  ];

  static List<String> nAGALAND = [
    "DIMAPUR",
    "KIPHIRE",
    "KOHIMA",
    "LONGLENG",
    "MOKOKCHUNG",
    "MON",
    "PEREN",
    "PHEK",
    "TUENSANG",
    "WOKHA",
    "ZUNHEBOTTO"
  ];

  static List<String> nCT_OF_DELHI = [
    "CENTRAL DELHI",
    "EAST DELHI",
    "NEW DELHI",
    "NORTH DELHI",
    "NORTH EAST DELHI",
    "NORTH WEST DELHI",
    "SOUTH DELHI",
    "SOUTH EAST DELHI",
    "SOUTH WEST DELHI",
    "WEST DELHI"
  ];

  static List<String> oDISHA = [
    "ANGUL",
    "BALANGIR",
    "CUTTACK",
    "DHENKANAL",
    "GANJAM",
    "JAGATSINGHAPUR",
    "JHARSUGUDA",
    "KALAHANDI",
    "KENDUJHAR",
    "KHORDA",
    "KORAPUT",
    "NUAPADA",
    "RAYAGADA",
    "SAMBALPUR",
    "SUNDERGARH"
  ];

  static List<String> psu = ["Mo Home Affairs"];

  static List<String> pUDUCHERRY = ["KARAIKAL", "MAHE", "PONDICHERRY", "YANAM"];

  static List<String> pUNJAB = [
    "AMRITSAR",
    "BARNALA",
    "BATHINDA",
    "FARIDKOT",
    "FATEHGARH SAHIB",
    "FAZILKA",
    "FIROZPUR",
    "GURDASPUR",
    "HOSHIARPUR",
    "JALANDHAR",
    "KAPURTHALA",
    "LUDHIANA",
    "MANSA",
    "MOGA",
    "MUKTSAR",
    "PATHANKOT",
    "PATIALA",
    "RUPNAGAR",
    "S.A.S Nagar",
    "SANGRUR",
    "Shahid Bhagat Singh Nagar",
    "Tarn Taran"
  ];

  static List<String> rAJASTHAN = [
    "AJMER",
    "ALWAR",
    "BANSWARA",
    "BARAN",
    "BARMER",
    "BHARATPUR",
    "BHILWARA",
    "BIKANER",
    "BUNDI",
    "CHITTORGARH",
    "CHURU",
    "DAUSA",
    "DHOLPUR",
    "DUNGARPUR",
    "GANGANAGAR",
    "HANUMANGARH",
    "JAIPUR",
    "JAISALMER",
    "JALOR",
    "JHALAWAR",
    "JHUJHUNU",
    "JODHPUR",
    "KARAULI",
    "KOTA",
    "NAGAUR",
    "PALI",
    "PRATAPGARH",
    "RAJSAMAND",
    "SAWAI MADHOPUR",
    "SIKAR",
    "SIROHI",
    "TONK",
    "UDAIPUR"
  ];

  static List<String> sIKKIM = [
    "East Sikkim",
    "North Sikkim",
    "South Sikkim",
    "West Sikkim"
  ];

  static List<String> tAMIL_NADU = [
    "Uknown",
    "Ariyalur",
    "CHENNAI",
    "COIMBATORE",
    "CUDDALORE",
    "DHARMAPURI",
    "DINDIGUL",
    "ERODE",
    "KANCHIPURAM",
    "KARUR",
    "KRISHNAGIRI",
    "Kanyakumari",
    "MADURAI",
    "NAGAPATTINAM",
    "NAMAKKAL",
    "Nilgiris",
    "PERAMBALUR",
    "PUDUKKOTTAI",
    "RAMANATHAPURAM",
    "SALEM",
    "SIVAGANGA",
    "THANJAVUR",
    "THENI",
    "TIRUCHIRAPPALLI",
    "TIRUNELVELI",
    "TIRUPPUR",
    "TIRUVANNAMALAI",
    "TUTICORIN",
    "Tiruvallur",
    "Tiruvarur",
    "VELLORE",
    "VILLUPURAM",
    "VIRUDHUNAGAR"
  ];

  static List<String> tELANGANA = [
    "ADILABAD",
    "BHADRADRI KOTHAGUDEM",
    "HYDERABAD",
    "JANGOAN",
    "JAYASHANKAR BHUPALAPALLY",
    "JOGULAMBA GADWAL",
    "Jagitial",
    "KAMAREDDY",
    "KARIMNAGAR",
    "KHAMMAM",
    "KUMURAM BHEEM ASIFABAD",
    "MAHABUBABAD",
    "MAHABUBNAGAR",
    "MANCHERIAL",
    "MEDAK",
    "MEDCHAL MALKAJGIRI",
    "NAGARKURNOOL",
    "NALGONDA",
    "NIZAMABAD",
    "Nirmal",
    "PEDDAPALLI",
    "RAJANNA SIRCILLA",
    "RANGA REDDY",
    "SANGAREDDY",
    "SIDDIPET",
    "SURYAPET",
    "VIKARABAD",
    "WANAPARTHY",
    "WARANGAL RURAL",
    "WARANGAL URBAN",
    "YADADRI BHUVANAGIRI"
  ];

  static List<String> tRIPURA = [
    "Dhalai",
    "Gomati",
    "Khowai",
    "North Tripura",
    "Sepahijala",
    "South Tripura",
    "Unakoti",
    "West Tripura"
  ];
  static List<String> uTTAR_PRADESH = [
    "AGRA",
    "ALIGARH",
    "ALLAHABAD",
    "AMBEDKAR NAGAR",
    "AMROHA",
    "AURAIYA",
    "AZAMGARH",
    "Amethi",
    "BAHRAICH",
    "BALLIA",
    "BALRAMPUR",
    "BANDA",
    "BARABANKI",
    "BAREILLY",
    "BASTI",
    "BHADOHI",
    "BIJNOR",
    "BUDAUN",
    "BULANDSHAHR",
    "Bagpat",
    "CHANDAULI",
    "CHITRAKOOT",
    "DEORIA",
    "ETAH",
    "ETAWAH",
    "FAIZABAD",
    "FARRUKHABAD",
    "FATEHPUR",
    "FIROZABAD",
    "GAUTAM BUDDHA NAGAR",
    "GHAZIABAD",
    "GHAZIPUR",
    "GONDA",
    "GORAKHPUR",
    "HAMIRPUR",
    "HAPUR",
    "HARDOI",
    "HATHRAS",
    "JALAUN",
    "JAUNPUR",
    "JHANSI",
    "KANNAUJ",
    "KANPUR DEHAT",
    "KANPUR NAGAR",
    "KAUSHAMBI",
    "KHERI",
    "KUSHI NAGAR",
    "Kasganj",
    "LALITPUR",
    "LUCKNOW",
    "MAHARAJGANJ",
    "MAHOBA",
    "MAINPURI",
    "MATHURA",
    "MAU",
    "MEERUT",
    "MIRZAPUR",
    "MORADABAD",
    "MUZAFFARNAGAR",
    "PILIBHIT",
    "PRATAPGARH",
    "RAMPUR",
    "Raebareli",
    "SAHARANPUR",
    "SHAHJAHANPUR",
    "SHAMLI",
    "SITAPUR",
    "SONBHADRA",
    "SULTANPUR",
    "Sambhal",
    "Sant Kabir Nagar",
    "Shrawasti",
    "Siddharthnagar",
    "UNNAO",
    "VARANASI"
  ];
  static List<String> uTTARAKHAND = [
    "ALMORA",
    "BAGESHWAR",
    "CHAMOLI",
    "CHAMPAWAT",
    "DEHRADUN",
    "HARIDWAR",
    "NAINITAL",
    "PAURI GARHWAL",
    "PITHORAGARH",
    "Rudraprayag",
    "TEHRI GARHWAL",
    "Udham Singh Nagar",
    "Uttarkashi"
  ];
  static List<String> wEST_BENGAL = [
    "Alipurduar",
    "BANKURA",
    "Cooch Behar",
    "Darjiling",
    "East Midnapur",
    "HOWRAH",
    "JALPAIGURI",
    "Jhargram",
    "KOLKATA",
    "MURSHIDABAD",
    "Malda",
    "NADIA",
    "North 24 Parganas",
    "North Dinajpur",
    "PASCHIM BARDHAMAN",
    "Puruliya",
    "South Dinajpur",
    "West Midnapur"
  ];

  static List<String> anadaman_AND_NICOBAR_ISLANDS = [
    "NICOBAR",
    "NORTH AND MIDDLE ANDAMAN",
    "SOUTH ANDAMAN"
  ];

  static List<String> madhya_pradesh = [
    "AGAR MALWA",
    "ALIRAJPUR",
    "ANUPPUR",
    "ASHOK NAGAR",
    "BALAGHAT",
    "BARWANI",
    "BETUL",
    "BHIND",
    "BHOPAL",
    "BURHANPUR",
    "CHHATARPUR",
    "CHHINDWARA",
    "DAMOH",
    "DATIA",
    "DEWAS",
    "DHAR",
    "DINDORI",
    "EAST NIMAR",
    "GUNA",
    "GWALIOR",
    "HARDA",
    "HOSHANGABAD",
    "INDORE",
    "JABALPUR",
    "JHABUA",
    "KATNI",
    "KHARGONE",
    "MANDLA",
    "MANDSAUR",
    "MORENA",
    "NARSINGHPUR",
    "NEEMUCH",
    "PANNA",
    "RAISEN",
    "RAJGARH",
    "RATLAM",
    "REWA",
    "SAGAR",
    "SATNA",
    "SEHORE",
    "SEONI",
    "SHAHDOL",
    "SHAJAPUR",
    "SHEOPUR",
    "SHIVPURI",
    "SIDHI",
    "SINGRAULI",
    "TIKAMGARH",
    "UJJAIN",
    "UMARIA",
    "VIDISHA"
  ];

  static List<String> chhattisgarh = [
    "BALOD",
    "BALODA BAZAR",
    "BALRAMPUR",
    "BASTAR",
    "BEMETARA",
    "BILASPUR",
    "Bijapur(CGH)",
    "DANTEWADA",
    "DHAMTARI",
    "DURG",
    "GARIABAND",
    "GAURELLA PENDRA MARWAHI",
    "JANJGIR-CHAMPA",
    "JASHPUR",
    "KABIRDHAM",
    "KANKER",
    "KONDAGAON",
    "KORBA",
    "KORIYA",
    "MAHASAMUND",
    "MUNGELI",
    "NARAYANPUR",
    "RAIGARH",
    "RAIPUR",
    "RAJNANDGAON",
    "SUKMA",
    "SURAJPUR",
    "SURGUJA"
  ];

  static List<String> jharkhand = [
    "BOKARO",
    "CHATRA",
    "DEOGHAR",
    "DHANBAD",
    "DUMKA",
    "EastSinghbhum",
    "GARHWA",
    "GODDA",
    "GUMLA",
    "Giridh",
    "Hazaribag",
    "JAMTARA",
    "KHUNTI",
    "KODERMA",
    "LATEHAR",
    "LOHARDAGA",
    "PAKUR",
    "Palamau",
    "RAMGARH",
    "RANCHI",
    "SIMDEGA",
    "Sahibganj",
    "SeraikelaKharsawan",
    "WESTSINGHBHUM"
  ];

  static List<String> ofState(String str) {
    switch (str) {
      case "MADHYA PRADESH":
        return madhya_pradesh;
      case "LAKSHADWEEP":
        return lAKSHADWEEP;
      case "ANDAMAN AND NICOBAR ISLANDS":
        return anadaman_AND_NICOBAR_ISLANDS;
      case "ANDHRA PRADESH":
        return andhra_PRADESH;
      case "ARUNACHAL PRADESH":
        return arunachal_PRADESH;
      case "ASSAM":
        return assam;
      case "BIHAR":
        return bihar;
      case "CHANDIGARH":
        return chandigarh;
      case "CHHATTISGARH":
        return chhattisgarh;
      case "DADRA AND NAGAR HAVELI":
        return dadra_AND_NAGAR_HAVELI;
      case "DAMAN AND DIU":
        return daman_AND_DIU;
      case "GOA":
        return goa;
      case "GUJARAT":
        return gujrat;
      case "HARYANA":
        return hARYANA;
      case "HIMACHAL PRADESH":
        return himachal_PRADESH;
      case "JAMMU AND KASHMIR":
        return jammu_AND_KASHMIR;
      case "JHARKHAND":
        return jharkhand;
      case "KARNATAKA":
        return kARNATAKA;
      case "KERALA":
        return kERALA;
      case "LADAKH":
        return lADAKH;
      case "MAHARASHTRA":
        return mAHARASHTRA;
      case "MANIPUR":
        return mANIPUR;
      case "MEGHALAYA":
        return mEGHALAYA;
      case "MIZORAM":
        return mIZORAM;
      case "NAGALAND":
        return nAGALAND;
      case "NCT OF DELHI":
        return nCT_OF_DELHI;
      case "ODISHA":
        return oDISHA;
      case "PSU":
        return psu;
      case "PUDUCHERRY":
        return pUDUCHERRY;
      case "PUNJAB":
        return pUNJAB;
      case "RAJASTHAN":
        return rAJASTHAN;
      case "SIKKIM":
        return sIKKIM;
      case "TAMIL NADU":
        return tAMIL_NADU;
      case "TELANGANA":
        return tELANGANA;
      case "TRIPURA":
        return tRIPURA;
      case "UTTARAKHAND":
        return uTTARAKHAND;
      case "UTTAR PRADESH":
        return uTTAR_PRADESH;
      case "WEST BENGAL":
        return wEST_BENGAL;
      default:
        return ["Not Available"];
    }
  }
}
