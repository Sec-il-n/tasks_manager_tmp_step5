# DB scheme

* models:
  * User
    * columns: & data type:
      * user_name : string
      * email : string
      * password :string

      * task_id : integer
      * lable_id : integer

  * Task
    * columns: & data type:
      * task_neme : string
      * details　: string
      <!-- 以下3カラムはvalidates < GUIから選択式(←の実装が容易であれば) -->
      * valid : string ? (received by [date picker](https://diver.diveintocode.jp/curriculums/339) & needs validation of　regular expression ?)
      * priority : integer <!-- 選択肢から数値変換してdb保存 (->優先順位、終了期限を元にしてソート)-->
      * status : string ? <!-- 未着手・着手・完了 -->
      (use [select box](https://railsguides.jp/form_helpers.html#%E3%83%A2%E3%83%87%E3%83%AB%E3%82%92%E6%89%B1%E3%81%86%E3%82%BB%E3%83%AC%E3%82%AF%E3%83%88%E3%83%9C%E3%83%83%E3%82%AF%E3%82%B9) ?)


  * Label
    * columns: & data type:
      * label_name
