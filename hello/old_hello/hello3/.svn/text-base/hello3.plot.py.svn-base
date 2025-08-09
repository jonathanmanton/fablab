from matplotlib.matlab import *
y = load('hello3.charge')
y = y[::-1]
#y = y[-1] + y[0]-y
x = arange(len(y))
axes([.1,.2,.8,.6])
plt=plot(x,y,'k-')
axis([0,800,312,385])
xlabel('time',fontsize=16)
set(gca(),'xticklabels',[])
ylabel('charging rate',fontsize=16)
set(gca(),'yticklabels',[])
savefig('button.png',dpi=300)
show()
