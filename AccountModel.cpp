#include <QDebug>
#include "AccountModel.hpp"
#include "Account.hpp"

void AccountModel::addAccount(const QString& name, const QString& balance)
{
	beginInsertRows(QModelIndex(), rowCount(), rowCount());
	accounts.append(new Account(name, balance, this));
	endInsertRows();
}

int AccountModel::rowCount(const QModelIndex& /*parent*/) const
{
	return accounts.size();
}

QVariant AccountModel::data(const QModelIndex& index, int role) const
{
	if (index.row() < 0 || index.row() >= accounts.size())
		return QVariant();

	return role == Qt::DisplayRole
			? QVariant::fromValue(qobject_cast<QObject*>(accounts[index.row()]))
			: QVariant();
}

QHash<int, QByteArray> AccountModel::roleNames() const
{
	QHash<int, QByteArray> roles;
	roles[Qt::DisplayRole] = "account";

	return roles;
}


void AccountModel::replaceWith(const QStringList& newAccounts)
{
	beginRemoveRows(QModelIndex(), 0, accounts.size());
	qDeleteAll(accounts);
	accounts.clear();
	endRemoveRows();

	for (int i = 0; i < newAccounts.size(); i += 2)
	{
		addAccount(newAccounts[i], newAccounts[i + 1]);
	}
}
