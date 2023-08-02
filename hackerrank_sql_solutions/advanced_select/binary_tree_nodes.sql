select 
    BT.N,
case
    when BT.P is null then 'Root'
    when exists (select B.P 
                from BST B
                where B.P = BT.N) then 'Inner'
                else 'Leaf'
end

from BST as BT
order by BT.N;