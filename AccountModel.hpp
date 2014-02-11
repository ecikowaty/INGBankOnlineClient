#ifndef ACCOUNTINFOMODEL_HPP
#define ACCOUNTINFOMODEL_HPP

#include <QObject>
#include <QVector>
#include <QStringList>
#include <QAbstractListModel>

class Account;
class AccountModel : public QAbstractListModel
{
	Q_OBJECT

public:
	void addAccount(const QString& name, const QString& balance);

	int rowCount(const QModelIndex& parent = QModelIndex()) const override;

	QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

public slots:
	void replaceWith(const QStringList& newAccounts);

protected:
	virtual QHash<int, QByteArray> roleNames() const override;

private:
	QVector<Account*> accounts;
};

#endif // ACCOUNTINFOMODEL_HPP
