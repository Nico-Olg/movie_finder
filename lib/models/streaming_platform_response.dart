import 'dart:convert';

class StreamingPlatformResponse {
  int id;
  Results results;

  StreamingPlatformResponse({
    required this.id,
    required this.results,
  });

  factory StreamingPlatformResponse.fromJson(String str) =>
      StreamingPlatformResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StreamingPlatformResponse.fromMap(Map<String, dynamic> json) =>
      StreamingPlatformResponse(
        id: json["id"],
        results: Results.fromMap(json["results"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "results": results.toMap(),
      };
}

class Results {
  Ad? ad;
  Ae? ae;
  Ad? ag;
  Ae? al;
  Ae? ao;
  Ae? ar;
  Ae? at;
  Ae? au;
  Ae? az;
  Ae? ba;
  Ad? bb;
  Ae? be;
  Ae? bf;
  Ae? bg;
  Ad? bh;
  Ad? bm;
  Ae? bo;
  Ae? br;
  Ad? bs;
  Ae? by;
  Ae? bz;
  Ae? ca;
  Ad? cd;
  Ae? ch;
  Ad? ci;
  Ae? cl;
  Ad? cm;
  Ae? co;
  Ae? cr;
  Ae? cv;
  Ae? cy;
  Ae? cz;
  Ae? de;
  Ae? dk;
  Ad? resultsDo;
  Ad? dz;
  Ae? ec;
  Ae? ee;
  Ad? eg;
  Ae? es;
  Ae? fi;
  Ae? fr;
  Ae? gb;
  Ad? gf;
  Ae? gh;
  Ad? gq;
  Ae? gr;
  Ae? gt;
  Ad? gy;
  Ae? hk;
  Ae? hn;
  Ae? hr;
  Ae? hu;
  Ad? id;
  Ae? ie;
  Ae? il;
  Ae? resultsIn;
  Ad? iq;
  Ae? resultsIs;
  Ae? it;
  Ad? jm;
  Ad? jo;
  Ae? jp;
  Ad? ke;
  Ae? kr;
  Ad? kw;
  Ad? lb;
  Ad? lc;
  Ae? lt;
  Ae? lu;
  Ae? lv;
  Ad? ly;
  Ad? ma;
  Ad? mc;
  Ad? md;
  Ad? mg;
  Ae? mk;
  Ae? ml;
  Ae? mt;
  Ae? mu;
  Ad? mw;
  Ae? mx;
  Ad? my;
  Ae? mz;
  Ad? ne;
  Ad? ng;
  Ae? ni;
  Ae? nl;
  Ae? no;
  Ae? nz;
  Ad? pa;
  Ae? pe;
  Ad? pf;
  Ae? pg;
  Ae? ph;
  Ae? pl;
  Ad? ps;
  Ae? pt;
  Ae? py;
  Ad? qa;
  Ae? ro;
  Ae? rs;
  Ae? ru;
  Ae? sa;
  Ad? sc;
  Ae? se;
  Ae? sg;
  Ae? si;
  Ae? sk;
  Ad? sn;
  Ad? sv;
  Ad? tc;
  Ad? td;
  Ae? th;
  Ad? tn;
  Ae? tr;
  Ad? tt;
  Ae? tw;
  Ae? tz;
  Ae? ua;
  Ae? ug;
  Ae? us;
  Ad? uy;
  Ae? ve;
  Ad? ye;
  Ae? za;
  Ad? zm;
  Ae? zw;

  Results({
    this.ad,
    this.ae,
    this.ag,
    this.al,
    this.ao,
    this.ar,
    this.at,
    this.au,
    this.az,
    this.ba,
    this.bb,
    this.be,
    this.bf,
    this.bg,
    this.bh,
    this.bm,
    this.bo,
    this.br,
    this.bs,
    this.by,
    this.bz,
    this.ca,
    this.cd,
    this.ch,
    this.ci,
    this.cl,
    this.cm,
    this.co,
    this.cr,
    this.cv,
    this.cy,
    this.cz,
    this.de,
    this.dk,
    this.resultsDo,
    this.dz,
    this.ec,
    this.ee,
    this.eg,
    this.es,
    this.fi,
    this.fr,
    this.gb,
    this.gf,
    this.gh,
    this.gq,
    this.gr,
    this.gt,
    this.gy,
    this.hk,
    this.hn,
    this.hr,
    this.hu,
    this.id,
    this.ie,
    this.il,
    this.resultsIn,
    this.iq,
    this.resultsIs,
    this.it,
    this.jm,
    this.jo,
    this.jp,
    this.ke,
    this.kr,
    this.kw,
    this.lb,
    this.lc,
    this.lt,
    this.lu,
    this.lv,
    this.ly,
    this.ma,
    this.mc,
    this.md,
    this.mg,
    this.mk,
    this.ml,
    this.mt,
    this.mu,
    this.mw,
    this.mx,
    this.my,
    this.mz,
    this.ne,
    this.ng,
    this.ni,
    this.nl,
    this.no,
    this.nz,
    this.pa,
    this.pe,
    this.pf,
    this.pg,
    this.ph,
    this.pl,
    this.ps,
    this.pt,
    this.py,
    this.qa,
    this.ro,
    this.rs,
    this.ru,
    this.sa,
    this.sc,
    this.se,
    this.sg,
    this.si,
    this.sk,
    this.sn,
    this.sv,
    this.tc,
    this.td,
    this.th,
    this.tn,
    this.tr,
    this.tt,
    this.tw,
    this.tz,
    this.ua,
    this.ug,
    this.us,
    this.uy,
    this.ve,
    this.ye,
    this.za,
    this.zm,
    this.zw,
  });

  factory Results.fromJson(String str) => Results.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Results.fromMap(Map<String, dynamic> json) => Results(
        ad: json["AD"] != null ? Ad.fromMap(json["AD"]) : null,
        ae: json["AE"] != null ? Ae.fromMap(json["AE"]) : null,
        ag: json["AG"] != null ? Ad.fromMap(json["AG"]) : null,
        al: json["AL"] != null ? Ae.fromMap(json["AL"]) : null,
        ao: json["AO"] != null ? Ae.fromMap(json["AO"]) : null,
        ar: json["AR"] != null ? Ae.fromMap(json["AR"]) : null,
        at: json["AT"] != null ? Ae.fromMap(json["AT"]) : null,
        au: json["AU"] != null ? Ae.fromMap(json["AU"]) : null,
        az: json["AZ"] != null ? Ae.fromMap(json["AZ"]) : null,
        ba: json["BA"] != null ? Ae.fromMap(json["BA"]) : null,
        bb: json["BB"] != null ? Ad.fromMap(json["BB"]) : null,
        be: json["BE"] != null ? Ae.fromMap(json["BE"]) : null,
        bf: json["BF"] != null ? Ae.fromMap(json["BF"]) : null,
        bg: json["BG"] != null ? Ae.fromMap(json["BG"]) : null,
        bh: json["BH"] != null ? Ad.fromMap(json["BH"]) : null,
        bm: json["BM"] != null ? Ad.fromMap(json["BM"]) : null,
        bo: json["BO"] != null ? Ae.fromMap(json["BO"]) : null,
        br: json["BR"] != null ? Ae.fromMap(json["BR"]) : null,
        bs: json["BS"] != null ? Ad.fromMap(json["BS"]) : null,
        by: json["BY"] != null ? Ae.fromMap(json["BY"]) : null,
        bz: json["BZ"] != null ? Ae.fromMap(json["BZ"]) : null,
        ca: json["CA"] != null ? Ae.fromMap(json["CA"]) : null,
        cd: json["CD"] != null ? Ad.fromMap(json["CD"]) : null,
        ch: json["CH"] != null ? Ae.fromMap(json["CH"]) : null,
        ci: json["CI"] != null ? Ad.fromMap(json["CI"]) : null,
        cl: json["CL"] != null ? Ae.fromMap(json["CL"]) : null,
        cm: json["CM"] != null ? Ad.fromMap(json["CM"]) : null,
        co: json["CO"] != null ? Ae.fromMap(json["CO"]) : null,
        cr: json["CR"] != null ? Ae.fromMap(json["CR"]) : null,
        cv: json["CV"] != null ? Ae.fromMap(json["CV"]) : null,
        cy: json["CY"] != null ? Ae.fromMap(json["CY"]) : null,
        cz: json["CZ"] != null ? Ae.fromMap(json["CZ"]) : null,
        de: json["DE"] != null ? Ae.fromMap(json["DE"]) : null,
        dk: json["DK"] != null ? Ae.fromMap(json["DK"]) : null,
        resultsDo: json["DO"] != null ? Ad.fromMap(json["DO"]) : null,
        dz: json["DZ"] != null ? Ad.fromMap(json["DZ"]) : null,
        ec: json["EC"] != null ? Ae.fromMap(json["EC"]) : null,
        ee: json["EE"] != null ? Ae.fromMap(json["EE"]) : null,
        eg: json["EG"] != null ? Ad.fromMap(json["EG"]) : null,
        es: json["ES"] != null ? Ae.fromMap(json["ES"]) : null,
        fi: json["FI"] != null ? Ae.fromMap(json["FI"]) : null,
        fr: json["FR"] != null ? Ae.fromMap(json["FR"]) : null,
        gb: json["GB"] != null ? Ae.fromMap(json["GB"]) : null,
        gf: json["GF"] != null ? Ad.fromMap(json["GF"]) : null,
        gh: json["GH"] != null ? Ae.fromMap(json["GH"]) : null,
        gq: json["GQ"] != null ? Ad.fromMap(json["GQ"]) : null,
        gr: json["GR"] != null ? Ae.fromMap(json["GR"]) : null,
        gt: json["GT"] != null ? Ae.fromMap(json["GT"]) : null,
        gy: json["GY"] != null ? Ad.fromMap(json["GY"]) : null,
        hk: json["HK"] != null ? Ae.fromMap(json["HK"]) : null,
        hn: json["HN"] != null ? Ae.fromMap(json["HN"]) : null,
        hr: json["HR"] != null ? Ae.fromMap(json["HR"]) : null,
        hu: json["HU"] != null ? Ae.fromMap(json["HU"]) : null,
        id: json["ID"] != null ? Ad.fromMap(json["ID"]) : null,
        ie: json["IE"] != null ? Ae.fromMap(json["IE"]) : null,
        il: json["IL"] != null ? Ae.fromMap(json["IL"]) : null,
        resultsIn: json["IN"] != null ? Ae.fromMap(json["IN"]) : null,
        iq: json["IQ"] != null ? Ad.fromMap(json["IQ"]) : null,
        resultsIs: json["IS"] != null ? Ae.fromMap(json["IS"]) : null,
        it: json["IT"] != null ? Ae.fromMap(json["IT"]) : null,
        jm: json["JM"] != null ? Ad.fromMap(json["JM"]) : null,
        jo: json["JO"] != null ? Ad.fromMap(json["JO"]) : null,
        jp: json["JP"] != null ? Ae.fromMap(json["JP"]) : null,
        ke: json["KE"] != null ? Ad.fromMap(json["KE"]) : null,
        kr: json["KR"] != null ? Ae.fromMap(json["KR"]) : null,
        kw: json["KW"] != null ? Ad.fromMap(json["KW"]) : null,
        lb: json["LB"] != null ? Ad.fromMap(json["LB"]) : null,
        lc: json["LC"] != null ? Ad.fromMap(json["LC"]) : null,
        lt: json["LT"] != null ? Ae.fromMap(json["LT"]) : null,
        lu: json["LU"] != null ? Ae.fromMap(json["LU"]) : null,
        lv: json["LV"] != null ? Ae.fromMap(json["LV"]) : null,
        ly: json["LY"] != null ? Ad.fromMap(json["LY"]) : null,
        ma: json["MA"] != null ? Ad.fromMap(json["MA"]) : null,
        mc: json["MC"] != null ? Ad.fromMap(json["MC"]) : null,
        md: json["MD"] != null ? Ad.fromMap(json["MD"]) : null,
        mg: json["MG"] != null ? Ad.fromMap(json["MG"]) : null,
        mk: json["MK"] != null ? Ae.fromMap(json["MK"]) : null,
        ml: json["ML"] != null ? Ae.fromMap(json["ML"]) : null,
        mt: json["MT"] != null ? Ae.fromMap(json["MT"]) : null,
        mu: json["MU"] != null ? Ae.fromMap(json["MU"]) : null,
        mw: json["MW"] != null ? Ad.fromMap(json["MW"]) : null,
        mx: json["MX"] != null ? Ae.fromMap(json["MX"]) : null,
        my: json["MY"] != null ? Ad.fromMap(json["MY"]) : null,
        mz: json["MZ"] != null ? Ae.fromMap(json["MZ"]) : null,
        ne: json["NE"] != null ? Ad.fromMap(json["NE"]) : null,
        ng: json["NG"] != null ? Ad.fromMap(json["NG"]) : null,
        ni: json["NI"] != null ? Ae.fromMap(json["NI"]) : null,
        nl: json["NL"] != null ? Ae.fromMap(json["NL"]) : null,
        no: json["NO"] != null ? Ae.fromMap(json["NO"]) : null,
        nz: json["NZ"] != null ? Ae.fromMap(json["NZ"]) : null,
        pa: json["PA"] != null ? Ad.fromMap(json["PA"]) : null,
        pe: json["PE"] != null ? Ae.fromMap(json["PE"]) : null,
        pf: json["PF"] != null ? Ad.fromMap(json["PF"]) : null,
        pg: json["PG"] != null ? Ae.fromMap(json["PG"]) : null,
        ph: json["PH"] != null ? Ae.fromMap(json["PH"]) : null,
        pl: json["PL"] != null ? Ae.fromMap(json["PL"]) : null,
        ps: json["PS"] != null ? Ad.fromMap(json["PS"]) : null,
        pt: json["PT"] != null ? Ae.fromMap(json["PT"]) : null,
        py: json["PY"] != null ? Ae.fromMap(json["PY"]) : null,
        qa: json["QA"] != null ? Ad.fromMap(json["QA"]) : null,
        ro: json["RO"] != null ? Ae.fromMap(json["RO"]) : null,
        rs: json["RS"] != null ? Ae.fromMap(json["RS"]) : null,
        ru: json["RU"] != null ? Ae.fromMap(json["RU"]) : null,
        sa: json["SA"] != null ? Ae.fromMap(json["SA"]) : null,
        sc: json["SC"] != null ? Ad.fromMap(json["SC"]) : null,
        se: json["SE"] != null ? Ae.fromMap(json["SE"]) : null,
        sg: json["SG"] != null ? Ae.fromMap(json["SG"]) : null,
        si: json["SI"] != null ? Ae.fromMap(json["SI"]) : null,
        sk: json["SK"] != null ? Ae.fromMap(json["SK"]) : null,
        sn: json["SN"] != null ? Ad.fromMap(json["SN"]) : null,
        sv: json["SV"] != null ? Ad.fromMap(json["SV"]) : null,
        tc: json["TC"] != null ? Ad.fromMap(json["TC"]) : null,
        td: json["TD"] != null ? Ad.fromMap(json["TD"]) : null,
        th: json["TH"] != null ? Ae.fromMap(json["TH"]) : null,
        tn: json["TN"] != null ? Ad.fromMap(json["TN"]) : null,
        tr: json["TR"] != null ? Ae.fromMap(json["TR"]) : null,
        tt: json["TT"] != null ? Ad.fromMap(json["TT"]) : null,
        tw: json["TW"] != null ? Ae.fromMap(json["TW"]) : null,
        tz: json["TZ"] != null ? Ae.fromMap(json["TZ"]) : null,
        ua: json["UA"] != null ? Ae.fromMap(json["UA"]) : null,
        ug: json["UG"] != null ? Ae.fromMap(json["UG"]) : null,
        us: json["US"] != null ? Ae.fromMap(json["US"]) : null,
        uy: json["UY"] != null ? Ad.fromMap(json["UY"]) : null,
        ve: json["VE"] != null ? Ae.fromMap(json["VE"]) : null,
        ye: json["YE"] != null ? Ad.fromMap(json["YE"]) : null,
        za: json["ZA"] != null ? Ae.fromMap(json["ZA"]) : null,
        zm: json["ZM"] != null ? Ad.fromMap(json["ZM"]) : null,
        zw: json["ZW"] != null ? Ae.fromMap(json["ZW"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "AD": ad?.toMap(),
        "AE": ae?.toMap(),
        "AG": ag?.toMap(),
        "AL": al?.toMap(),
        "AO": ao?.toMap(),
        "AR": ar?.toMap(),
        "AT": at?.toMap(),
        "AU": au?.toMap(),
        "AZ": az?.toMap(),
        "BA": ba?.toMap(),
        "BB": bb?.toMap(),
        "BE": be?.toMap(),
        "BF": bf?.toMap(),
        "BG": bg?.toMap(),
        "BH": bh?.toMap(),
        "BM": bm?.toMap(),
        "BO": bo?.toMap(),
        "BR": br?.toMap(),
        "BS": bs?.toMap(),
        "BY": by?.toMap(),
        "BZ": bz?.toMap(),
        "CA": ca?.toMap(),
        "CD": cd?.toMap(),
        "CH": ch?.toMap(),
        "CI": ci?.toMap(),
        "CL": cl?.toMap(),
        "CM": cm?.toMap(),
        "CO": co?.toMap(),
        "CR": cr?.toMap(),
        "CV": cv?.toMap(),
        "CY": cy?.toMap(),
        "CZ": cz?.toMap(),
        "DE": de?.toMap(),
        "DK": dk?.toMap(),
        "DO": resultsDo?.toMap(),
        "DZ": dz?.toMap(),
        "EC": ec?.toMap(),
        "EE": ee?.toMap(),
        "EG": eg?.toMap(),
        "ES": es?.toMap(),
        "FI": fi?.toMap(),
        "FR": fr?.toMap(),
        "GB": gb?.toMap(),
        "GF": gf?.toMap(),
        "GH": gh?.toMap(),
        "GQ": gq?.toMap(),
        "GR": gr?.toMap(),
        "GT": gt?.toMap(),
        "GY": gy?.toMap(),
        "HK": hk?.toMap(),
        "HN": hn?.toMap(),
        "HR": hr?.toMap(),
        "HU": hu?.toMap(),
        "ID": id?.toMap(),
        "IE": ie?.toMap(),
        "IL": il?.toMap(),
        "IN": resultsIn?.toMap(),
        "IQ": iq?.toMap(),
        "IS": resultsIs?.toMap(),
        "IT": it?.toMap(),
        "JM": jm?.toMap(),
        "JO": jo?.toMap(),
        "JP": jp?.toMap(),
        "KE": ke?.toMap(),
        "KR": kr?.toMap(),
        "KW": kw?.toMap(),
        "LB": lb?.toMap(),
        "LC": lc?.toMap(),
        "LT": lt?.toMap(),
        "LU": lu?.toMap(),
        "LV": lv?.toMap(),
        "LY": ly?.toMap(),
        "MA": ma?.toMap(),
        "MC": mc?.toMap(),
        "MD": md?.toMap(),
        "MG": mg?.toMap(),
        "MK": mk?.toMap(),
        "ML": ml?.toMap(),
        "MT": mt?.toMap(),
        "MU": mu?.toMap(),
        "MW": mw?.toMap(),
        "MX": mx?.toMap(),
        "MY": my?.toMap(),
        "MZ": mz?.toMap(),
        "NE": ne?.toMap(),
        "NG": ng?.toMap(),
        "NI": ni?.toMap(),
        "NL": nl?.toMap(),
        "NO": no?.toMap(),
        "NZ": nz?.toMap(),
        "PA": pa?.toMap(),
        "PE": pe?.toMap(),
        "PF": pf?.toMap(),
        "PG": pg?.toMap(),
        "PH": ph?.toMap(),
        "PL": pl?.toMap(),
        "PS": ps?.toMap(),
        "PT": pt?.toMap(),
        "PY": py?.toMap(),
        "QA": qa?.toMap(),
        "RO": ro?.toMap(),
        "RS": rs?.toMap(),
        "RU": ru?.toMap(),
        "SA": sa?.toMap(),
        "SC": sc?.toMap(),
        "SE": se?.toMap(),
        "SG": sg?.toMap(),
        "SI": si?.toMap(),
        "SK": sk?.toMap(),
        "SN": sn?.toMap(),
        "SV": sv?.toMap(),
        "TC": tc?.toMap(),
        "TD": td?.toMap(),
        "TH": th?.toMap(),
        "TN": tn?.toMap(),
        "TR": tr?.toMap(),
        "TT": tt?.toMap(),
        "TW": tw?.toMap(),
        "TZ": tz?.toMap(),
        "UA": ua?.toMap(),
        "UG": ug?.toMap(),
        "US": us?.toMap(),
        "UY": uy?.toMap(),
        "VE": ve?.toMap(),
        "YE": ye?.toMap(),
        "ZA": za?.toMap(),
        "ZM": zm?.toMap(),
        "ZW": zw?.toMap(),
      };
}

class Ad {
  String? link;
  List<Flatrate>? flatrate;

  Ad({
    this.link,
    this.flatrate,
  });

  factory Ad.fromJson(String str) => Ad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ad.fromMap(Map<String, dynamic> json) => Ad(
        link: json["link"],
        flatrate: json["flatrate"] == null
            ? []
            : List<Flatrate>.from(
                json["flatrate"].map((x) => Flatrate.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "link": link,
        "flatrate": flatrate == null
            ? []
            : List<dynamic>.from(flatrate!.map((x) => x.toMap())),
      };
}

class Flatrate {
  String? logoPath;
  int? providerId;
  String? providerName;
  int? displayPriority;

  Flatrate({
    this.logoPath,
    this.providerId,
    this.providerName,
    this.displayPriority,
  });

  factory Flatrate.fromJson(String str) => Flatrate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Flatrate.fromMap(Map<String, dynamic> json) => Flatrate(
        logoPath: json["logo_path"],
        providerId: json["provider_id"],
        providerName: json["provider_name"],
        displayPriority: json["display_priority"],
      );

  Map<String, dynamic> toMap() => {
        "logo_path": logoPath,
        "provider_id": providerId,
        "provider_name": providerName,
        "display_priority": displayPriority,
      };
}

class Ae {
  String? link;
  List<Flatrate>? rent;
  List<Flatrate>? flatrate;
  List<Flatrate>? buy;
  List<Flatrate>? ads;

  Ae({
    this.link,
    this.rent,
    this.flatrate,
    this.buy,
    this.ads,
  });

  factory Ae.fromJson(String str) => Ae.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ae.fromMap(Map<String, dynamic> json) => Ae(
        link: json["link"],
        rent: json["rent"] == null
            ? []
            : List<Flatrate>.from(json["rent"].map((x) => Flatrate.fromMap(x))),
        flatrate: json["flatrate"] == null
            ? []
            : List<Flatrate>.from(
                json["flatrate"].map((x) => Flatrate.fromMap(x))),
        buy: json["buy"] == null
            ? []
            : List<Flatrate>.from(json["buy"].map((x) => Flatrate.fromMap(x))),
        ads: json["ads"] == null
            ? []
            : List<Flatrate>.from(json["ads"].map((x) => Flatrate.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "link": link,
        "rent": rent == null
            ? []
            : List<dynamic>.from(rent!.map((x) => x.toMap())),
        "flatrate": flatrate == null
            ? []
            : List<dynamic>.from(flatrate!.map((x) => x.toMap())),
        "buy": buy == null ? [] : List<dynamic>.from(buy!.map((x) => x.toMap())),
        "ads": ads == null ? [] : List<dynamic>.from(ads!.map((x) => x.toMap())),
      };
}
