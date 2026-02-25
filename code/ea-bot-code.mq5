
//+------------------------------------------------------------------+
//|                                           Forex_Bot_Omkar.mq5    |
//|   Pro Level Multi-Pair EA with Dashboard, SL/TP, and Trailing   |
//+------------------------------------------------------------------+
#property strict

input double LotSize = 0.01;
input int StopLossPips = 20;
input int TakeProfitPips = 40;
input double RiskPercent = 2.0;
input bool UseTrailingStop = true;
input int TrailingStopPips = 15;

input string TradeSymbols = "XAUUSD,EURUSD,USDJPY,GBPUSD";

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   Print("Forex_Bot_Omkar initialized on ", _Symbol);
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Print("Forex_Bot_Omkar deinitialized from ", _Symbol);
  }

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   // Sample logic: check no open trade and open new trade if possible
   if (PositionsTotal() == 0)
     {
      double sl = Bid - StopLossPips * _Point;
      double tp = Bid + TakeProfitPips * _Point;
      trade.Buy(LotSize, _Symbol, Bid, sl, tp, "OmkarEA");
     }
  }
