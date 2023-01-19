begin
    x = 10
    y = 100
    puts x
    puts y
    # 例外を起こす
    puts x / 0
rescue StandardError => e
    puts "#{e.class}(#{e.message}) エラー発生。"
endarray2 = %w(apple banana orange)