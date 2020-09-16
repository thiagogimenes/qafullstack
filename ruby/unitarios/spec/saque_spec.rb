#exemplo de teste com TDD
class ContaCorrente
    #criar atributo saldo
    attr_accessor :saldo, :mensagem

    #cria construtor saldo vai receber o argumento saldo
    def initialize(saldo)
        self.saldo = saldo
    end
    #cria método saca
    def saca(valor) 
        if (valor > self.saldo)
            self.mensagem = 'Saldo insuficiente para saque :('
        elsif (valor > 700.00)
            self.mensagem = 'Limite máximo por saque é de R$ 700'
        else
            self.saldo -= valor
        end
    end
end

#criar uma switch - para validar o cenário na conta corrente
describe ContaCorrente do
    #switch
    describe 'Saque' do
        #criar um contexto para fazer o teste.
        context 'quanto o valor é positivo' do
            #método do meu contexto
            before(:all) do
                #criar variável de instancia e ficará disponível para uso.
                @conta = ContaCorrente.new(1000.00)
                @conta.saca(200.00)
            end
            it 'entao atualiza saldo' do
                expect(@conta.saldo).to eql 800.00
            end
        end

        context 'quando o saldo é zero' do
            before(:all) do
                @conta = ContaCorrente.new(0.00)
                @conta.saca(100.00)
            end
            it 'vejo mensagem' do
                expect(@conta.mensagem).to eql 'Saldo insuficiente para saque :('
            end
            it 'meu saldo permanece com zero' do
                expect(@conta.saldo).to eql 0.00
            end
        end

        context 'quando o saldo é insuficiente' do
            before(:all) do
                @conta = ContaCorrente.new(100.00)
                @conta.saca(101.00)
            end
            it 'Vejo mensagem' do
                expect(@conta.mensagem).to eql 'Saldo insuficiente para saque :('
            end
            it 'meu saldo permanece conforme valor inicial' do
                expect(@conta.saldo).to eql 100.00
            end
        end

        context 'quando o valor do saque é maior que o limite por transação' do
            before(:all) do
                @conta = ContaCorrente.new(1000.00)
                @conta.saca(701.00)
            end
            it 'Vejo mensagem' do
                expect(@conta.mensagem).to eql 'Limite máximo por saque é de R$ 700'
            end
            it 'meu saldo permanece conforme valor inicial' do
                expect(@conta.saldo).to eql 1000.00
            end
        end
    end
end