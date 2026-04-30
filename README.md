\---



\## SELECT DISTINCT Challenge



\### Problem



Find the unique rental rates from the `film` table.



\### My Approach



\* I identified the column: `rental\_rate`

\* I noticed there were duplicate values

\* I used `SELECT DISTINCT` to return only unique values



\### SQL Query



```sql

SELECT DISTINCT rental\_rate

FROM film;

```



\### Result



\* 0.99

\* 2.99

\* 4.99



\### What I Learned



\* `DISTINCT` removes duplicate values

\* It helps answer questions like “what unique values exist?”

\* Always think in terms of the business question first



\### Screenshot



!\[SELECT DISTINCT Result](images/select\_distinct\_result.png)



