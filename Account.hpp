#ifndef ACCOUNT_HPP
#define ACCOUNT_HPP

#include <QObject>

class Account : public QObject
{
	Q_OBJECT

	Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
	Q_PROPERTY(QString balance READ balance WRITE setBalance NOTIFY balanceChanged)

public:
	explicit Account(const QString& name, const QString& balance, QObject* parent = 0);
	~Account();

signals:
	void nameChanged();
	void balanceChanged();

public slots:
	QString name() const;
	void setName(const QString& name);

	QString balance() const;
	void setBalance(const QString& balance);

private:
	struct AccountPrivate& d;
};

#endif // ACCOUNT_HPP
