class WatchProvider {
  WatchProvider({
    required this.id,
    required this.results,
  });

  final int id;
  final Results? results;

  factory WatchProvider.fromJson(Map<String, dynamic> json) {
    return WatchProvider(
      id: json["id"] ?? 0,
      results:
          json["results"] == null ? null : Results.fromJson(json["results"]),
    );
  }
}

class Results {
  Results({
    required this.ad,
    required this.ae,
    required this.ag,
    required this.ar,
    required this.at,
    required this.au,
    required this.ba,
    required this.bb,
    required this.be,
    required this.bg,
    required this.bh,
    required this.bm,
    required this.bo,
    required this.br,
    required this.bs,
    required this.bz,
    required this.ca,
    required this.ch,
    required this.ci,
    required this.cl,
    required this.cm,
    required this.co,
    required this.cr,
    required this.cz,
    required this.de,
    required this.dk,
    required this.resultsDo,
    required this.dz,
    required this.ec,
    required this.ee,
    required this.eg,
    required this.es,
    required this.fi,
    required this.fr,
    required this.gb,
    required this.gf,
    required this.gh,
    required this.gi,
    required this.gq,
    required this.gt,
    required this.hk,
    required this.hn,
    required this.hr,
    required this.hu,
    required this.id,
    required this.ie,
    required this.resultsIn,
    required this.iq,
    required this.resultsIs,
    required this.it,
    required this.jm,
    required this.jo,
    required this.jp,
    required this.ke,
    required this.kw,
    required this.lb,
    required this.lc,
    required this.li,
    required this.lt,
    required this.lv,
    required this.ly,
    required this.ma,
    required this.mc,
    required this.md,
    required this.me,
    required this.mg,
    required this.mk,
    required this.ml,
    required this.mu,
    required this.mx,
    required this.my,
    required this.mz,
    required this.ne,
    required this.ng,
    required this.ni,
    required this.nl,
    required this.no,
    required this.nz,
    required this.om,
    required this.pa,
    required this.pe,
    required this.ph,
    required this.pl,
    required this.ps,
    required this.pt,
    required this.py,
    required this.qa,
    required this.ro,
    required this.rs,
    required this.ru,
    required this.sa,
    required this.sc,
    required this.se,
    required this.sg,
    required this.si,
    required this.sk,
    required this.sm,
    required this.sn,
    required this.sv,
    required this.tc,
    required this.td,
    required this.th,
    required this.tn,
    required this.tr,
    required this.tt,
    required this.tw,
    required this.tz,
    required this.us,
    required this.uy,
    required this.ve,
    required this.ye,
    required this.za,
    required this.zm,
    required this.zw,
  });

  final Ad? ad;
  final Ad? ae;
  final Ad? ag;
  final Ad? ar;
  final At? at;
  final At? au;
  final Ad? ba;
  final Ad? bb;
  final Ad? be;
  final Ad? bg;
  final Ad? bh;
  final Ad? bm;
  final Ad? bo;
  final Ad? br;
  final Ad? bs;
  final Ad? bz;
  final At? ca;
  final At? ch;
  final Ad? ci;
  final Ad? cl;
  final Ad? cm;
  final Ad? co;
  final Ad? cr;
  final Ad? cz;
  final At? de;
  final Ad? dk;
  final Ad? resultsDo;
  final Ad? dz;
  final Ad? ec;
  final Ad? ee;
  final Ad? eg;
  final Ad? es;
  final At? fi;
  final At? fr;
  final At? gb;
  final Ad? gf;
  final Ad? gh;
  final Ad? gi;
  final Ad? gq;
  final Ad? gt;
  final Ad? hk;
  final Ad? hn;
  final Ad? hr;
  final Ad? hu;
  final Ad? id;
  final At? ie;
  final Ad? resultsIn;
  final Ad? iq;
  final Ad? resultsIs;
  final At? it;
  final Ad? jm;
  final Ad? jo;
  final At? jp;
  final Ad? ke;
  final Ad? kw;
  final Ad? lb;
  final Ad? lc;
  final Ad? li;
  final Ad? lt;
  final Ad? lv;
  final Ad? ly;
  final Ad? ma;
  final Ad? mc;
  final Ad? md;
  final Ad? me;
  final Ad? mg;
  final Ad? mk;
  final Ad? ml;
  final Ad? mu;
  final Ad? mx;
  final Ad? my;
  final Ad? mz;
  final Ad? ne;
  final Ad? ng;
  final Ad? ni;
  final At? nl;
  final At? no;
  final Ad? nz;
  final Ad? om;
  final Ad? pa;
  final Ad? pe;
  final Ad? ph;
  final At? pl;
  final Ad? ps;
  final Ad? pt;
  final Ad? py;
  final Ad? qa;
  final Ad? ro;
  final Ad? rs;
  final Ru? ru;
  final Ad? sa;
  final Ad? sc;
  final At? se;
  final Ad? sg;
  final Ad? si;
  final Ad? sk;
  final Ad? sm;
  final Ad? sn;
  final Ad? sv;
  final Ad? tc;
  final Ad? td;
  final Ad? th;
  final Ad? tn;
  final Ad? tr;
  final Ad? tt;
  final Ad? tw;
  final Ad? tz;
  final At? us;
  final Ad? uy;
  final Ad? ve;
  final Ad? ye;
  final Ad? za;
  final Ad? zm;
  final Ad? zw;

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      ad: json["AD"] == null ? null : Ad.fromJson(json["AD"]),
      ae: json["AE"] == null ? null : Ad.fromJson(json["AE"]),
      ag: json["AG"] == null ? null : Ad.fromJson(json["AG"]),
      ar: json["AR"] == null ? null : Ad.fromJson(json["AR"]),
      at: json["AT"] == null ? null : At.fromJson(json["AT"]),
      au: json["AU"] == null ? null : At.fromJson(json["AU"]),
      ba: json["BA"] == null ? null : Ad.fromJson(json["BA"]),
      bb: json["BB"] == null ? null : Ad.fromJson(json["BB"]),
      be: json["BE"] == null ? null : Ad.fromJson(json["BE"]),
      bg: json["BG"] == null ? null : Ad.fromJson(json["BG"]),
      bh: json["BH"] == null ? null : Ad.fromJson(json["BH"]),
      bm: json["BM"] == null ? null : Ad.fromJson(json["BM"]),
      bo: json["BO"] == null ? null : Ad.fromJson(json["BO"]),
      br: json["BR"] == null ? null : Ad.fromJson(json["BR"]),
      bs: json["BS"] == null ? null : Ad.fromJson(json["BS"]),
      bz: json["BZ"] == null ? null : Ad.fromJson(json["BZ"]),
      ca: json["CA"] == null ? null : At.fromJson(json["CA"]),
      ch: json["CH"] == null ? null : At.fromJson(json["CH"]),
      ci: json["CI"] == null ? null : Ad.fromJson(json["CI"]),
      cl: json["CL"] == null ? null : Ad.fromJson(json["CL"]),
      cm: json["CM"] == null ? null : Ad.fromJson(json["CM"]),
      co: json["CO"] == null ? null : Ad.fromJson(json["CO"]),
      cr: json["CR"] == null ? null : Ad.fromJson(json["CR"]),
      cz: json["CZ"] == null ? null : Ad.fromJson(json["CZ"]),
      de: json["DE"] == null ? null : At.fromJson(json["DE"]),
      dk: json["DK"] == null ? null : Ad.fromJson(json["DK"]),
      resultsDo: json["DO"] == null ? null : Ad.fromJson(json["DO"]),
      dz: json["DZ"] == null ? null : Ad.fromJson(json["DZ"]),
      ec: json["EC"] == null ? null : Ad.fromJson(json["EC"]),
      ee: json["EE"] == null ? null : Ad.fromJson(json["EE"]),
      eg: json["EG"] == null ? null : Ad.fromJson(json["EG"]),
      es: json["ES"] == null ? null : Ad.fromJson(json["ES"]),
      fi: json["FI"] == null ? null : At.fromJson(json["FI"]),
      fr: json["FR"] == null ? null : At.fromJson(json["FR"]),
      gb: json["GB"] == null ? null : At.fromJson(json["GB"]),
      gf: json["GF"] == null ? null : Ad.fromJson(json["GF"]),
      gh: json["GH"] == null ? null : Ad.fromJson(json["GH"]),
      gi: json["GI"] == null ? null : Ad.fromJson(json["GI"]),
      gq: json["GQ"] == null ? null : Ad.fromJson(json["GQ"]),
      gt: json["GT"] == null ? null : Ad.fromJson(json["GT"]),
      hk: json["HK"] == null ? null : Ad.fromJson(json["HK"]),
      hn: json["HN"] == null ? null : Ad.fromJson(json["HN"]),
      hr: json["HR"] == null ? null : Ad.fromJson(json["HR"]),
      hu: json["HU"] == null ? null : Ad.fromJson(json["HU"]),
      id: json["ID"] == null ? null : Ad.fromJson(json["ID"]),
      ie: json["IE"] == null ? null : At.fromJson(json["IE"]),
      resultsIn: json["IN"] == null ? null : Ad.fromJson(json["IN"]),
      iq: json["IQ"] == null ? null : Ad.fromJson(json["IQ"]),
      resultsIs: json["IS"] == null ? null : Ad.fromJson(json["IS"]),
      it: json["IT"] == null ? null : At.fromJson(json["IT"]),
      jm: json["JM"] == null ? null : Ad.fromJson(json["JM"]),
      jo: json["JO"] == null ? null : Ad.fromJson(json["JO"]),
      jp: json["JP"] == null ? null : At.fromJson(json["JP"]),
      ke: json["KE"] == null ? null : Ad.fromJson(json["KE"]),
      kw: json["KW"] == null ? null : Ad.fromJson(json["KW"]),
      lb: json["LB"] == null ? null : Ad.fromJson(json["LB"]),
      lc: json["LC"] == null ? null : Ad.fromJson(json["LC"]),
      li: json["LI"] == null ? null : Ad.fromJson(json["LI"]),
      lt: json["LT"] == null ? null : Ad.fromJson(json["LT"]),
      lv: json["LV"] == null ? null : Ad.fromJson(json["LV"]),
      ly: json["LY"] == null ? null : Ad.fromJson(json["LY"]),
      ma: json["MA"] == null ? null : Ad.fromJson(json["MA"]),
      mc: json["MC"] == null ? null : Ad.fromJson(json["MC"]),
      md: json["MD"] == null ? null : Ad.fromJson(json["MD"]),
      me: json["ME"] == null ? null : Ad.fromJson(json["ME"]),
      mg: json["MG"] == null ? null : Ad.fromJson(json["MG"]),
      mk: json["MK"] == null ? null : Ad.fromJson(json["MK"]),
      ml: json["ML"] == null ? null : Ad.fromJson(json["ML"]),
      mu: json["MU"] == null ? null : Ad.fromJson(json["MU"]),
      mx: json["MX"] == null ? null : Ad.fromJson(json["MX"]),
      my: json["MY"] == null ? null : Ad.fromJson(json["MY"]),
      mz: json["MZ"] == null ? null : Ad.fromJson(json["MZ"]),
      ne: json["NE"] == null ? null : Ad.fromJson(json["NE"]),
      ng: json["NG"] == null ? null : Ad.fromJson(json["NG"]),
      ni: json["NI"] == null ? null : Ad.fromJson(json["NI"]),
      nl: json["NL"] == null ? null : At.fromJson(json["NL"]),
      no: json["NO"] == null ? null : At.fromJson(json["NO"]),
      nz: json["NZ"] == null ? null : Ad.fromJson(json["NZ"]),
      om: json["OM"] == null ? null : Ad.fromJson(json["OM"]),
      pa: json["PA"] == null ? null : Ad.fromJson(json["PA"]),
      pe: json["PE"] == null ? null : Ad.fromJson(json["PE"]),
      ph: json["PH"] == null ? null : Ad.fromJson(json["PH"]),
      pl: json["PL"] == null ? null : At.fromJson(json["PL"]),
      ps: json["PS"] == null ? null : Ad.fromJson(json["PS"]),
      pt: json["PT"] == null ? null : Ad.fromJson(json["PT"]),
      py: json["PY"] == null ? null : Ad.fromJson(json["PY"]),
      qa: json["QA"] == null ? null : Ad.fromJson(json["QA"]),
      ro: json["RO"] == null ? null : Ad.fromJson(json["RO"]),
      rs: json["RS"] == null ? null : Ad.fromJson(json["RS"]),
      ru: json["RU"] == null ? null : Ru.fromJson(json["RU"]),
      sa: json["SA"] == null ? null : Ad.fromJson(json["SA"]),
      sc: json["SC"] == null ? null : Ad.fromJson(json["SC"]),
      se: json["SE"] == null ? null : At.fromJson(json["SE"]),
      sg: json["SG"] == null ? null : Ad.fromJson(json["SG"]),
      si: json["SI"] == null ? null : Ad.fromJson(json["SI"]),
      sk: json["SK"] == null ? null : Ad.fromJson(json["SK"]),
      sm: json["SM"] == null ? null : Ad.fromJson(json["SM"]),
      sn: json["SN"] == null ? null : Ad.fromJson(json["SN"]),
      sv: json["SV"] == null ? null : Ad.fromJson(json["SV"]),
      tc: json["TC"] == null ? null : Ad.fromJson(json["TC"]),
      td: json["TD"] == null ? null : Ad.fromJson(json["TD"]),
      th: json["TH"] == null ? null : Ad.fromJson(json["TH"]),
      tn: json["TN"] == null ? null : Ad.fromJson(json["TN"]),
      tr: json["TR"] == null ? null : Ad.fromJson(json["TR"]),
      tt: json["TT"] == null ? null : Ad.fromJson(json["TT"]),
      tw: json["TW"] == null ? null : Ad.fromJson(json["TW"]),
      tz: json["TZ"] == null ? null : Ad.fromJson(json["TZ"]),
      us: json["US"] == null ? null : At.fromJson(json["US"]),
      uy: json["UY"] == null ? null : Ad.fromJson(json["UY"]),
      ve: json["VE"] == null ? null : Ad.fromJson(json["VE"]),
      ye: json["YE"] == null ? null : Ad.fromJson(json["YE"]),
      za: json["ZA"] == null ? null : Ad.fromJson(json["ZA"]),
      zm: json["ZM"] == null ? null : Ad.fromJson(json["ZM"]),
      zw: json["ZW"] == null ? null : Ad.fromJson(json["ZW"]),
    );
  }
}

class Ad {
  Ad({
    required this.link,
    required this.flatrate,
  });

  final String link;
  final List<Flatrate> flatrate;

  factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
      link: json["link"] ?? "",
      flatrate: json["flatrate"] == null
          ? []
          : List<Flatrate>.from(
              json["flatrate"]!.map((x) => Flatrate.fromJson(x))),
    );
  }
}

class Flatrate {
  Flatrate({
    required this.logoPath,
    required this.providerId,
    required this.providerName,
    required this.displayPriority,
  });

  final String logoPath;
  final int providerId;
  final String providerName;
  final int displayPriority;

  factory Flatrate.fromJson(Map<String, dynamic> json) {
    return Flatrate(
      logoPath: json["logo_path"] ?? "",
      providerId: json["provider_id"] ?? 0,
      providerName: json["provider_name"] ?? "",
      displayPriority: json["display_priority"] ?? 0,
    );
  }
}

class At {
  At({
    required this.link,
    required this.flatrate,
    required this.buy,
    required this.rent,
  });

  final String link;
  final List<Flatrate> flatrate;
  final List<Flatrate> buy;
  final List<Flatrate> rent;

  factory At.fromJson(Map<String, dynamic> json) {
    return At(
      link: json["link"] ?? "",
      flatrate: json["flatrate"] == null
          ? []
          : List<Flatrate>.from(
              json["flatrate"]!.map((x) => Flatrate.fromJson(x))),
      buy: json["buy"] == null
          ? []
          : List<Flatrate>.from(json["buy"]!.map((x) => Flatrate.fromJson(x))),
      rent: json["rent"] == null
          ? []
          : List<Flatrate>.from(json["rent"]!.map((x) => Flatrate.fromJson(x))),
    );
  }
}

class Ru {
  Ru({
    required this.link,
    required this.ads,
    required this.flatrate,
  });

  final String link;
  final List<Flatrate> ads;
  final List<Flatrate> flatrate;

  factory Ru.fromJson(Map<String, dynamic> json) {
    return Ru(
      link: json["link"] ?? "",
      ads: json["ads"] == null
          ? []
          : List<Flatrate>.from(json["ads"]!.map((x) => Flatrate.fromJson(x))),
      flatrate: json["flatrate"] == null
          ? []
          : List<Flatrate>.from(
              json["flatrate"]!.map((x) => Flatrate.fromJson(x))),
    );
  }
}
