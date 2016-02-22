#!/usr/bin/perl

use strict;
use warnings;

my $max_profit = get_max_profit(10, 7, 5, 8, 11, 9);
exit(0);

sub get_max_profit
{
   my @stock_prices_yesterday = @_;

   my $last_index = @stock_prices_yesterday;
   my $buy_index = 0;
   my $buy_price = $stock_prices_yesterday[$buy_index];
   my $max_profit_buy_price = 0;
   my $max_profit_sell_price = 0;
   my $max_profit = 0;

   while ($buy_index < $last_index)
   {
       for(my $index = $buy_index + 1; $index < $last_index; $index++)
       {
          my $buy    =  $stock_prices_yesterday[$buy_index];
          my $sell   = $stock_prices_yesterday[$index];
          my $profit = $sell - $buy;

          # This prints intermediate results.
          print "Buy: $buy  Sell: $sell  Profit: $profit\n";

          if($profit > $max_profit)
          {
             $max_profit_buy_price  = $buy;
             $max_profit_sell_price = $sell;
             $max_profit            = $profit;
          }        
       }
       print "\n";
       ++$buy_index;
    }

    # This prints the buy and sell price for maxium profit
    print " Buy Price: $max_profit_buy_price\n";
    print "Sell Price: $max_profit_sell_price\n";
    print "Max Profit: $max_profit\n";

    return $max_profit;  # Returns the maxium profit;
}
