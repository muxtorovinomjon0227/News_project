import 'package:news_project/src/data/models/currency_news_model.dart';

String getFlags(List<CurrencyNews> result, int index) {
  String flags = result[index].code.toString();
  String flag = getFlag(flags);

  return  flag;
}



String getFlag(String index) {
  switch (index) {
    case 'AED':
      {
        return "assets/images/baa.png";
      }
    case 'AUD':
      {
        return "assets/images/australiya.png";
      }
    case 'CAD':
      {
        return "assets/images/canada.png";
      }
    case 'CHF':
      {
        return "assets/images/shvedsarya.png";
      }
    case 'CNY':
      {
        return "assets/images/china.png";
      }
    case 'DKK':
      {
        return "assets/images/denmark.png";
      }
    case 'EGP':
      {
        return "assets/images/misr.png";
      }
    case 'EUR':
      {
        return "assets/images/yevropa.png";
      }
    case 'GBP':
      {
        return "assets/images/anglya.png";
      }
    case 'ISK':
      {
        return "assets/images/island.png";
      }
    case 'JPY':
      {
        return "assets/images/yaponya.png";
      }
    case 'KRW':
      {
        return "assets/images/koreya.png";
      }
    case 'KWD':
      {
        return "assets/images/kuayt.png";
      }
    case 'KZT':
      {
        return "assets/images/kazakistzn.png";
      }
    case 'LBP':
      {
        return "assets/images/lebanon.png";
      }
    case 'MYR':
      {
        return "assets/images/malayziya.png";
      }
    case 'NOK':
      {
        return "assets/images/iceland.png";
      }
    case 'PLN':
      {
        return "assets/images/san_marino.png";
      }
    case 'RUB':
      {
        return "assets/images/russia.png";
      }
    case 'SEK':
      {
        return "assets/images/shvedsarya.png";
      }
    case 'SGD':
      {
        return "assets/images/singapur.png";
      }
    case 'TRY':
      {
        return "assets/images/turkiya.png";
      }
    case 'UAH':
      {
        return "assets/images/ukraina.png";
      }
      case 'USD':
    {
      return "assets/images/usa.png";
    }
  }
  return "assets/images/Uzbekistan.png";

}

