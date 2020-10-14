describe 'Caixas de seleção', :checkbox do

    #passar um for each para visitar o site para cada função.
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/checkboxes'
    end

    it 'marcando uma opção' do
        check('thor')
    end 

    it 'desmarcando uma opção' do
        uncheck('antman')
    end

    it 'marcando com find set true' do
        find('input[value=cap]').set(true)
    end

    it 'desmarcando com find set false' do 
        find('input[value=guardians]').set(false)
    end

    #sempre que usar o before, deve colocar no final um after, neste exemplo utilizou-se para tempo de cada execução.
    after(:each) do
        sleep 3
    end
end