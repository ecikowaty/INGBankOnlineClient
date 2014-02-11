#include "Account.hpp"

struct AccountPrivate
{
	AccountPrivate(const QString& name, const QString& balance)
		: name(name)
		, balance(balance)
	{
	}

	QString name = "Account";
	QString balance = "0.00 zł";
};

Account::Account(const QString& name, const QString& balance, QObject* parent)
	: QObject(parent)
	, d(*new AccountPrivate{ name, balance })
{
}

Account::~Account()
{
	delete &d;
}

QString Account::name() const
{
	return d.name;
}

void Account::setName(const QString& name)
{
	if (d.name != name)
	{
		d.name = name;
		emit nameChanged();
	}
}

QString Account::balance() const
{
	return d.balance;
}

void Account::setBalance(const QString& balance)
{
	if (d.balance != balance)
	{
		d.balance = balance;
		emit balanceChanged();
	}
}
