if status is-interactive
    fastfetch
    # Pesan berdasarkan waktu
    set hour (date +%H)
    if test $hour -lt 12
        echo "Good Afternoon, $USER!"
    else if test $hour -lt 18
        echo "Good Evening, $USER!"
    else
        echo "Good Night, $USER!"
    end
end

