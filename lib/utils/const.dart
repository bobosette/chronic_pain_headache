//string

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const String startTitle = 'Fattori Psicosociali del Dolore Cronico: Cefalea';

const String startContent =
    'Il dolore, in particolare il dolore cronico, con una prevalenza intorno al 20-30% in Europa, è ormai considerato una delle maggiori problematiche sanitarie e sociali, non solo perché può diminuire la capacità lavorativa, causare problemi psichiatrici e portare ad elevati gradi di disabilità, ma soprattutto perché l’efficacia dei trattamenti, farmacologici e non, è limitata.\n\nIn questo studio, vogliamo studiare l’impatto del dolore cronico sulla qualità della vita nei soggetti affetti da dolore cronico, attraverso l’identificazione dei fattori psicosociali correlati. Il presente studio a cui le chiediamo di partecipare, prevede un valutazione soggettiva dei fattori psicosociali, attraverso la somministrazione di alcuni questionari. La partecipazione al presente studio non comporta alcuna risoluzione dei sintomi della malattia o beneficio personale. Partecipando a questo studio però avrà l\'opportunità di contribuire a rivelare i meccanismi psicologici correlati al dolore e potrà sapere in quali pubblicazioni sono stati esposti i risultati dello studio contattando il responsabile del progetto di ricerca riportato alla fine di questo documento. Non ci sono rischi derivanti dalla partecipazione allo studio. In qualsiasi momento potrà interrompere la compilazione senza dover fornire alcuna giustificazione. I dati che la riguardano saranno ritenuti come strettamente confidenziali e soggetti ad anonimato, trattando i Suoi dati comuni e sensibili diversi da quelli identificativi (anagrafici) in modo da impedire di associarli in alcun modo alla Sua persona, cioè trasformandoli in forma anonima. I risultati potranno essere portati a conoscenza di terzi o pubblicati, ma escludendo ogni possibile riferimento personale. Ci si atterrà in ogni caso alle disposizioni normative vigenti relative alla tutela della privacy del soggetto (art.11 D.Lgs. 196/2003 – Codice in materia di protezione dei dati personali).\n\nPer qualsiasi ulteriore informazione può contattare la prof.ssa Roberta Ferrucci: roberta.ferrucci@unimi.it';

const String section1Title = 'Informazioni Personali';

const List<String> section1 = [
  'Acconsente a partecipare allo studio?',
  'Conferma di essere maggiorenne',
  'Iniziali',
  'Età',
  'Sesso biologico',
  'Livello di istruzione',
  'Stato civile',
  'Regione di residenza',
  'Con che frequenza svolge attività fisica?',
  'Lei attualmente fuma?',
  'Quante sigarette al giorno fuma?',
  'Da quanti anni fuma?',
  'Se ha smesso di fumare da quanti anni?',
  '',
  'Oltre alla cefalea, soffre di altre patologie?',
  'Trattamento farmacologico',
];

const String section7Title = 'Cefalea';

const List<String> section7 = [
  'Ha familiarità con la cefalea?',
  'Indichi il carattere del dolore che prova',
  'Indichi l\'intensità del dolore che prova',
  'Indichi la sede del dolore iniziale',
  'Indichi la durata media di un attacco senza farmaci (ore)',
  'Indichi la durata media di un attacco con farmaci (ore)',
  'Il dolore aumenta durante uno sforzo fisico moderato?',
  'Durante il dolore si è mai manifestata Aura?',
  'Indichi la durata dell\'Aura',
  'Quale farmaco o farmaci utilizza quando compare il mal di testa? Non indichi eventuali cure preventive ma solo i farmaci che assume quando ha mal di testa, per farlo passare',
  'Quali di queste cure farmacologiche per il mal di testa ha utilizzato o utilizza? Sono possibili più risposte',
  //'Indichi i fenomeni che accompagnano il suo dolore  (da 1 a 10 gravità, dove 1= nulla, 10= molto grave)',
  'Nausea',
  'Vomito',
  'Fotofobia',
  'Fonofobia',
  'Osmofobia',
  'Lacrimazione',
  'Rinorrea',
  'Deficit CV',
  'Deficit Motori',
  'Deficit Sensitivi',
  'Disfasia',
  'Altro',
  'Indichi se subisce una variazione delle proprie attività a causa della cefalea',
  'Indichi la frequenza media degli attacchi subiti negli ultimi 12 mesi',
  'Quanti giorni di assenza dal lavoro o da scuola ha fatto negli ultimi tre mesi a causa del mal di testa?',
  'Per quanti giorni, nel corso degli ultimi tre mesi, il suo rendimento sul lavoro o a scuola si è ridotto della metà o più a causa del mal di testa? (Non conteggi i giorni di assenza che ha già indicato nella risposta alla prima domanda)',
  'Per quanti, giorni, nel corso degli ultimi tre mesi, non ha partecipato ad attività familiari, sociali o di svago a causa del mal di testa?',
  'Per quanti giorni, nel corso degli ultimi tre mesi, ha sofferto di mal di testa? (Se un mal di testa è durato più di un giorno, sommi tutti i giorni)',
  'Su una scala da 0 a 10, quale è stata mediamente l\'intensità del dolore durante questi mal di testa? (Dove 0 è uguale ad assenza di dolore e 10 dolore fortissimo, non potrebbe essere peggio)',
  'Nell\'ultimo anno si è recato al pronto soccorso a causa del mal di testa?',
  'Da chi è seguito per curare il suo mal di testa? Sono possibili più risposte'
];

const String section2Title = 'Numeric Rating Scale (NRS)';

const String section21Subtitle =
    'Per favore indichi il numero che corrisponde al grado di dolore provato: (0 “nessun dolore”, 1-3 “dolore lieve”, 4-6 “dolore moderato”, 6-10 “dolore severo/grave”)';

const String section22Subtitle =
    'Per favore indichi il numero che corrisponde al suo umore: (0 “cattivo umore”, 10 “buon umore”)';

const List<String> section2 = [
  'Dolore fisico',
  'Umore',
];

const String section3Title = 'Pain Self-Efficacy Questionnaire';

const String section3Subtitle =
    'Valuti con un punteggio quanto si sente sicuro nello svolgere le seguenti attività oggi, nonostante il dolore.\nPer indicare la sua risposta faccia un cerchio attorno a uno dei numeri sulla scala sotto ogni affermazione, dove 0 = per nulla sicuro e 6 = completamente sicuro.\nRicordi che questo questionario non le chiede se fa o non fa queste attività, ma quanto si sente sicuro di poterle fare al momento, nonostante il dolore.';

const List<String> section3 = [
  'Posso vivere bene, nonostante il dolore',
  'Posso fare la maggior parte dei lavori domestici (mettere in ordine, lavare i piatti, ecc), nonostante il dolore',
  'Posso stare in compagnia di amici o famigliari come ho sempre fatto, nonostante il dolore',
  'Posso gestire il dolore nella maggior parte delle situazioni',
  'Posso svolgere delle attività lavorative, nonostante il dolore. (per "attività lavorative" si intendono anche lavori di casa e lavori non pagati)',
  'Posso ancora fare molte delle cose che mi piacciono, come hobbies o svaghi, nonostante il dolore',
  'Posso gestire il dolore senza ricorrere ai farmaci',
  'Posso ancora realizzare la maggior parte dei miei obbiettivi, nonostante il dolore',
  'Posso avere uno stile di vita normale, nonostante il dolore',
  'Posso gradualmente diventare più attivo, nonostante il dolore'
];

const String section4Title = 'Pain Catastrophizing Scale (PCS)';

const String section4Subtitle =
    'Ognuno di noi prova esperienze dolorose durante la propria vita. Tali esperienze possono includere, ad esempio, mal di testa, mal di denti, dolore articolare o muscolare. Le persone sono spesso esposte a situazioni che possono causare dolore come le malattie, gli infortuni, o le procedure chirurgiche.\n\nSiamo interessati ai pensieri e ai sentimenti che provate quando avete dolore. Di seguito sono elencate tredici affermazioni che descrivono pensieri e sentimenti eventualmente associati a dolore. Usando la seguente scala, è richiesto indicare la frequenza con cui coltivate questi pensieri e sentimenti quando provate dolore.';

const List<String> section4 = [
  'Sono preoccupato riguardo a quando finirà il dolore',
  'Sento di non riuscire ad andare avanti',
  'Il dolore è terribile e penso che non migliorerà più',
  'Tutto è inutile e sento che il dolore sta per sopraffarmi',
  'Ho la sensazione di non poter più sopportare il dolore',
  'Ho paura che il dolore possa aumentare',
  'Penso ad altre esperienze dolorose',
  'Desidero con impazienza che il dolore vada via',
  'Non mi sembra di riuscire a scacciare il dolore dalla mia mente',
  'Continuo a pensare a quanto il dolore mi provochi sofferenza',
  'Continuo a pensare a quanto intensamente voglio che il dolore finisca',
  'Non c’è nulla che posso fare per ridurre l’intensità del dolore',
  'Mi chiedo se qualcosa di serio possa accadermi'
];

const String section5Title = 'Brief Pain Inventory (BPI)';

const String section5Subtitle =
    'Nel corso della vita la maggior parte di noi ha avuto saltuariamente qualche dolore (es: un leggero mal di testa, uno strappo muscolare o un mal di denti).';

const String section5q9Title =
    'Indichi il numero che meglio descrive quanto il dolore ha interferito, nelle ultime 24 ore, con:';

const List<String> section5 = [
  'Oggi ha avuto un dolore diverso da questi dolori comuni?',
  'Clicchi sul disegno le parti dove sente dolore',
  'Valuti il suo dolore cerchiando il numero che meglio descrive l’intensità del peggior dolore provato nelle ultime 24 ore',
  'Valuti il suo dolore cerchiando il numero che meglio descrive l’intensità del dolore più lieve provato nelle ultime 24 ore',
  'Valuti il suo dolore cerchiando il numero che meglio descrive l’intensità media del dolore nelle ultime 24 ore',
  'Valuti il suo dolore cerchiando il numero che meglio descrive quanto dolore prova in questo momento',
  'Quali terapie o farmaci sta ricevendo per il suo dolore?',
  'Nelle ultime 24 ore quanto sollievo ha tratto dalle terapie o dai farmaci? Indichi la percentuale che meglio descrive quanto sollievo ha avuto',
  'LA SUA ATTIVITA’ IN GENERALE',
  'IL SUO UMORE',
  'LA SUA CAPACITA’ DI CAMMINARE',
  'LA SUA NORMALE CAPACITA’ LAVORATIVA (sia in casa sia fuori)',
  'LE SUE RELAZIONI CON ALTRE PERSONE',
  'IL SONNO',
  'IL SUO PIACERE DI VIVERE'
];

const List<String> bodySites = [
  'Spalla destra-dietro',
  'Spalla destra-avanti',
  'Spalla sinistra-dietro',
  'Spalla sinistra-avanti',
  'Avambraccio sinistro-dietro',
  'Avambraccio sinistro-avanti',
  'Avambraccio destro-dietro',
  'Avambraccio destro-avanti',
  'Gomito sinistro-dietro',
  'Gomito sinistro-avanti',
  'Gomito destro-dietro',
  'Gomito destro-avanti',
  'Ginocchio destro-dietro',
  'Ginocchio destro-avanti',
  'Ginocchio sinistro-dietro',
  'Ginocchio sinistro-avanti',
  'Coscia destra-dietro',
  'Coscia destra-avanti',
  'Coscia sinistra-dietro',
  'Coscia sinistra-avanti',
  'Piede sinistro-avanti',
  'Piede sinistro-dietro',
  'Piede destro-avanti',
  'Piede destro-dietro',
  'Capo-avanti',
  'Capo-dietro',
  'Mano sinistra-dietro',
  'Mano sinistra-avanti',
  'Mano destra-dietro',
  'Mano destra-avanti',
  'Gamba sinistra-dietro',
  'Gamba sinistra-avanti',
  'Gamba destra-dietro',
  'Gamba destra-avanti',
  'Braccio sinistro-dietro',
  'Braccio sinistro-avanti',
  'Braccio destro-dietro',
  'Braccio destro-avanti',
  'Polso sinistro-dietro',
  'Polso sinistro-avanti',
  'Polso destro-dietro',
  'Polso destro-avanti',
  'Caviglia sinistra-dietro',
  'Caviglia sinistra-avanti',
  'Caviglia destra-dietro',
  'Caviglia destra-avanti',
  'Pettorale',
  'Addome',
  'Gluteo destro',
  'Gluteo sinistro',
  'Costato',
  'Pelvi',
  'Dorso',
  'Lombo'
];

const String section6Title = 'Questionario sullo stato di salute (SF12)';

const String section6Subtitle =
    'Questo questionario intende valutare cosa Lei pensa della Sua salute. Le informazioni raccolte permetteranno di essere sempre aggiornati su come si sente e su come riesce a svolgere le Sue attività consuete.\n\nRisponda a ciascuna domanda del questionario indicando la Sua risposta come mostrato di volta in volta. Se non si sente certo della risposta, effettui la scelta che comunque Le sembra migliore.';

const section6label1 =
    'Le seguenti domande riguardano alcune attività che potrebbe svolgere nel corso di una qualsiasi giornata. La Sua salute La limita attualmente nello svolgimento di queste attività?';

const section6label2 =
    'Nelle ultime 4 settimane, ha riscontrato i seguenti problemi sul lavoro o nelle altre attività quotidiane, a causa della Sua salute fisica?';

const section6label3 =
    'Nelle ultime 4 settimane, ha riscontrato i seguenti problemi sul lavoro o nelle altre attività quotidiane, a causa del Suo stato emotivo (quale il sentirsi depresso o ansioso)?';

const section6label4 =
    'Le seguenti domande si riferiscono a come si è sentito nelle ultime 4 settimane. Risponda a ciascuna domanda scegliendo la risposta che più si avvicina al Suo caso. Per quanto tempo nelle ultime 4 settimane si è sentito …';

const List<String> section6 = [
  'In generale, direbbe che la Sua salute è:',
  'Attività di moderato impegno fisico, come spostare un tavolo, usare l’aspirapolvere, giocare a bocce o fare un giretto in bicicletta',
  'Salire qualche piano di scale',
  'Ha reso meno di quanto avrebbe voluto',
  'Ha dovuto limitare alcuni tipi di lavoro o di altre attività',
  'Ha reso meno di quanto avrebbe voluto',
  'Ha avuto un calo di concentrazione sul lavoro o in altre attività',
  'Nelle ultime 4 settimane, in che misura il dolore l’ha ostacolata nel lavoro che svolge abitualmente (sia in casa sia fuori casa)?',
  'calmo e sereno?',
  'pieno di energia?',
  'scoraggiato e triste?',
  'Nelle ultime 4 settimane, per quanto tempo la Sua salute fisica o il Suo stato emotivo hanno interferito nelle Sue attività sociali, in famiglia, con gli amici?',
];

//already switched
const String googleUrl =
    'https://docs.google.com/forms/u/0/d/e/1FAIpQLScWriWZjmXq98Qf7AnXKHBFLLxSNIAJ_8CXBpjDZXDyy2xXTA/formResponse';

const String nodeUrl = kDebugMode
    ? 'http://localhost:3000/sendResponse'
    : 'https://us-central1-cronic-pain-test.cloudfunctions.net/app/sendResponse';

//background
const String background = 'images/background.png';

//background color
const Color backgroundColor = Color(0xffffffff);

//button color
const Color buttonColor = Color(0xff2d5970);

//title style
const TextStyle titleStyle = TextStyle(fontSize: 24);

//title style
const TextStyle subtitleStyle = TextStyle(fontSize: 20);

//content style
const TextStyle contentStyle = TextStyle(fontSize: 16);

//button style
var buttonStyle = ElevatedButton.styleFrom(
  //minimumSize: Size(120, 30),
  //maximumSize: Size(140, 60),
  backgroundColor: buttonColor,
  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(60)),
  ),
);

//button style
var textButtonStyle = TextButton.styleFrom(
  //minimumSize: Size(120, 30),
  //maximumSize: Size(140, 60),
  foregroundColor: buttonColor,
  /*textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(60)),
  ),*/
);

//input style
//input decoration style
const inputStyle = InputDecoration(
    contentPadding: EdgeInsets.only(left: 10, top: 5),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30.0),
      ),
      borderSide: BorderSide(color: buttonColor, width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30.0),
      ),
      borderSide: BorderSide(color: Colors.red, width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30.0),
      ),
      borderSide: BorderSide(color: Colors.red, width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30.0),
      ),
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30.0),
      ),
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
    ));

const rowInputStyle = InputDecoration(
  contentPadding: EdgeInsets.only(left: 10, top: 5),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
  ),
);
