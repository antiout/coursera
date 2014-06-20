package recfun
import common._

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if ( c == 0 || r == 0 || c == r ) 1 else
      pascal(c-1, r-1) + pascal(c, r-1)
  }

  /**
   * Exercise 2
   */
  def balance(chars: List[Char]): Boolean = {
    def iter(count:Int, lst:List[Char]) : Boolean = {
      if ( lst == Nil || lst.isEmpty ) count == 0 else
        if ( count < 0 ) false else
        if ( lst.head == '(' ) iter(count+1, lst.tail) else
        if ( lst.head == ')' )  iter(count-1, lst.tail) else
        iter(count, lst.tail)
    }
    iter(0, chars)
  }

  /**
   * Exercise 3
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    def iter (money:Int, lst:List[Int]) : Int = {
      if ( money == 0 ) 1 else
      if ( money < 0 ) 0 else
      if ( lst == Nil || lst.isEmpty) 0 else
      iter(money, lst.tail) + iter(money-lst.head, lst)
    }
    iter(money, coins)
  }
}
