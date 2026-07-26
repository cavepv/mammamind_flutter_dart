// Static content ported from mammamind.se (landing page + 2 course/workshop
// detail pages). No backend/API layer — this is a static content demo, not
// a functional port of the live site's Supabase-backed booking system.

class FaqEntry {
  final String question;
  final List<String> answerParagraphs;

  const FaqEntry({required this.question, required this.answerParagraphs});
}

class CourseMetaItem {
  final String label;
  final String value;

  const CourseMetaItem({required this.label, required this.value});
}

class MammaMindData {
  // --- Landing page ---

  static const heroHeadline =
      'Trygg träning för gravida & nyblivna mammor i Göteborg';
  static const heroLead =
      'Träning, återhämtning och gemenskap – anpassat för just dig';

  static const whyMammaMindParagraphs = [
    'MammaMind finns för dig som är gravid eller nybliven mamma och vill '
        'röra på dig med trygghet, inte krav. För dig som känner dig osäker '
        'på vad din kropp klarar av – och längtar efter att lyssna inåt '
        'igen. Här möts anpassad träning, återhämtning och medveten '
        'närvaro i en mjuk helhet. Allt utgår från var du befinner dig, '
        'med fokus på styrka, andning, stabilitet och läkning.',
    'Återhämtning är en självklar del, inte något som ska hinnas med '
        'senare. Och kanske viktigast av allt – här finns gemenskap. En '
        'plats där du inte behöver bära allt själv, och där det är okej '
        'att vara precis där du är.',
    'Låter det intressant? Kolla in aktuella kurser och workshops eller '
        'kontakta mig direkt för mer info!',
  ];

  static const instagramHandle = '@tara_mammamind';
  static const instagramUrl = 'https://www.instagram.com/tara_mammamind/';
  static const contactEmail = 'info@mammamind.se';

  static const aboutMeParagraphs = [
    'Jag är mamma till två barn som har förändrat min syn på hälsa, kropp '
        'och livet i grunden. De har lärt mig att hälsa inte handlar om '
        'prestation – utan om tålamod, nyfikenhet och självomsorg. Under '
        'min första graviditet insåg jag hur lite stöd som fanns för '
        'trygg träning före och efter förlossning, och hur osäker jag '
        'själv kände mig. Det blev startskottet för MammaMind.',
    'Med över tio års yogapraktik och utbildningar inom yoga, kost och '
        'träning under och efter graviditet erbjuder jag ett inkännande '
        'och hållbart stöd. Hos mig får du landa, känna dig sedd och '
        'bygga styrka i din egen takt – utan press eller jämförelse. Min '
        'önskan är att göra den här omvälvande tiden kring graviditeten '
        'lite lättare och att skapa en plats där mammor får mötas, vila '
        'och växa – tillsammans.',
  ];

  static const faq = [
    FaqEntry(
      question: 'Behöver jag ha tränat innan?',
      answerParagraphs: [
        'Nej, absolut inte.',
        'Kursen passar både dig som är helt ny till träning och dig som '
            'har tränat tidigare men vill komma igång tryggt efter '
            'graviditet och förlossning. Alla övningar anpassas efter din '
            'kropp och dina förutsättningar.',
      ],
    ),
    FaqEntry(
      question: 'Hur långt efter förlossning kan jag delta?',
      answerParagraphs: [
        'Du behöver ha genomfört din efterkontroll och fått okej att '
            'börja träna. Därefter är du varmt välkommen, oavsett om det '
            'gått några månader eller längre tid sedan förlossningen.',
      ],
    ),
    FaqEntry(
      question: 'Är kursen säker efter kejsarsnitt?',
      answerParagraphs: [
        'Ja, träningen är skonsam och anpassad även för dig som fött med '
            'kejsarsnitt. Vi tar hänsyn till ärr, läkning och '
            'återhämtning, och fokus ligger på att bygga upp kroppen '
            'steg för steg i din takt.',
      ],
    ),
    FaqEntry(
      question: 'Vad händer om jag missar ett tillfälle?',
      answerParagraphs: [
        'Om du missar ett tillfälle under kursen kommer det finnas ett '
            'bonustillfälle i slutet av kursen du kan delta på. På så '
            'sätt har du möjlighet att ta igen ett missat pass.',
      ],
    ),
    FaqEntry(
      question:
          'Vad händer efter att jag skickat in en intresseanmälan till en '
          'workshop/kurs?',
      answerParagraphs: [
        'Kul att du vill veta mer!',
        'När du skickat in din intresseanmälan (ej bindande) kommer du '
            'få ett bekräftelsemail inom 48 timmar där du hittar mer '
            'information om workshopen/kursen. För dig som anmält '
            'intresse för en kurs kommer all info om betalning också '
            'finnas med i bekräftelsemailet. Din plats är bokad först '
            'när betalningen är genomförd.',
        'Om mailet inte dyker upp, vänligen kolla i din skräppost eller '
            'fliken kampanjer/promotions om du använder Gmail.',
      ],
    ),
    FaqEntry(
      question: 'Vad händer om ett pass blir inställt?',
      answerParagraphs: [
        'Vid inställt tillfälle erbjuds ersättningstillfälle för att '
            'kompensera ett inställt pass. Se Allmänna villkor för '
            'MammaMind, här har vi samlat allt du behöver veta kring '
            'bokning, avbokning och återbetalning vid oförutsedda '
            'händelser etc.',
      ],
    ),
  ];

  static const contactParagraphs = [
    'Har du frågor eller funderingar hör gärna av dig via mail eller '
        "MammaMind's Instagram.",
    'Vill du boka en plats till en kurs så klicka dig in på "Läs mer om '
        'kursen" så hittar du all information där. Jag ser fram emot att '
        'höra från dig!',
  ];

  // --- Course: Trygg återstart efter graviditet ---

  static const courseTitle = 'Trygg återstart efter graviditet';
  static const courseSummaryStartDate = '6 maj';
  static const courseSummarySchedule = 'Varje Onsdag kl. 10:00–11:00';
  static const courseSummaryLocation = 'Utomhus Eriksberg';
  static const courseSummarySessions = '6 tillfällen';

  static const courseLead =
      'Den här kursen är för dig som vill komma igång med träning på ett '
      'tryggt, inkännande och hållbart sätt efter graviditet och '
      'förlossning. Under sex veckor får du möjlighet att steg för steg '
      'återknyta kontakten med din kropp, bygga upp styrka och skapa en '
      'stabil grund för fortsatt träning – utan press eller prestation. '
      'Träningen är anpassad efter mammakroppen och har fokus på:';

  static const courseFocusAreas = [
    'bäckenbotten och core',
    'hållning och kroppskännedom',
    'skonsam styrka',
    'yoga, andning och meditation',
    'återhämtning och närvaro',
  ];

  static const courseBabyNote =
      'Bebisar är varmt välkomna, och träningen sker i små grupper för '
      'att skapa trygghet, gemenskap och utrymme att möta varje '
      'deltagare där hon är.';

  static const courseMeta = [
    CourseMetaItem(label: 'Start', value: '6 maj'),
    CourseMetaItem(label: 'Längd', value: '6 veckor'),
    CourseMetaItem(label: 'Dag & Tid', value: 'Onsdagar kl. 10.00–11.00'),
    CourseMetaItem(label: 'Plats', value: 'Utomhus Eriksberg'),
    CourseMetaItem(label: 'Bebisar', value: 'Varmt välkomna'),
    CourseMetaItem(
      label: 'Förkunskapskrav',
      value: 'Efterkontroll genomförd',
    ),
  ];

  static const courseClosing =
      'Fokus ligger på återhämtning, närvaro och att bygga styrka i din '
      'egen takt. Efter passet finns möjlighet att stanna kvar för fika '
      'och umgänge om man vill.';

  static const courseEarlyBirdNote =
      'Goodiebag med produkter till ett värde av ca 500 kr!';
  static const coursePriceNote =
      'Platserna är begränsade för att kunna ge varje mamma en trygg '
      'och personlig upplevelse.';
  static const coursePriceSek = 899;

  // --- Workshop: Stark & smärtfri vardag ---

  static const workshopTitle = 'Stark & smärtfri vardag';
  static const workshopSubtitle = 'Fokus på Bäckenbotten & Andning';
  static const workshopSummaryDate = '19 mars';
  static const workshopSummaryTime = '13:00– ca 14:30 (inkl. fika)';
  static const workshopSummaryLocation =
      'Vila och värme yogastudio, Säterigatan 29 Eriksberg';

  static const workshopLead =
      'För dig som vill återfå kontakten med din kropp, hitta styrkan '
      'inifrån och njuta av en mysig stund med andra mammor i Eriksberg.';

  static const workshopIntroParagraphs = [
    'Känns kroppen inte helt som din efter förlossningen? Du kanske '
        'upplever en tyngdkänsla i underlivet, ryggvärk som inte ger med '
        'sig, eller att du läcker lite när du lyfter ditt barn, nyser '
        'eller skrattar.',
    'Många mammor får höra att de "bara ska knipa", men sanningen är '
        'att isolerade knipövningar sällan är hela lösningen. För att din '
        'kropp ska kännas stark och hålla för vardagens alla lyft, '
        'behöver din bäckenbotten samarbeta med din andning och din '
        'djupa magmuskulatur.',
    'Vad händer under workshopen?',
    'Under 45 minuter guidar jag dig genom praktiska tekniker som du '
        'direkt kan använda i din vardag. Vi fokuserar på:',
  ];

  static const workshopFocusAreas = [
    'Samspelet mellan andning & bäckenbotten: Vi utforskar hur '
        '360-andning fungerar och hur den naturligt avlastar din '
        'bäckenbotten.',
    'Hitta rätt stöd: Hur du aktiverar din inre cylinder för att undvika '
        'smärta och läckage vid lyft och rörelse.',
    'Avslappning vs. Styrka: Vi lär oss att en stark bäckenbotten också '
        'måste kunna slappna av – och hur du hittar balansen '
        'däremellan.',
  ];

  static const workshopClosingParagraphs = [
    'En stund för dig (och din bebis). Efter träningen sänker vi tempot '
        'och avslutar med en gemensam fika. Det här är din stund att få '
        'sitta ner, andas ut och dela erfarenheter med andra mammor i '
        'samma situation.',
    'Bebisar är självklart varmt välkomna att vara med under '
        'workshopen!',
  ];

  static const workshopMeta = [
    CourseMetaItem(label: 'Datum', value: '19 mars 2026'),
    CourseMetaItem(label: 'Tid', value: '13:00– ca 14:30 (inkl. fika)'),
    CourseMetaItem(
      label: 'Plats',
      value: 'Vila och värme yogastudio, Säterigatan 29 Eriksberg',
    ),
    CourseMetaItem(
      label: 'Pris',
      value: 'Gratis prova på, anmäl intresse – först till kvarn!',
    ),
  ];

  static const workshopCapacityNote =
      'Vi håller gruppen liten (ca 6 platser) för att jag ska kunna ge '
      'dig personlig vägledning och svara på dina frågor.';
}
