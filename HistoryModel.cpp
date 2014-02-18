#include <QDebug>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>

#include "HistoryModel.hpp"
#include "HistoryEntry.hpp"

HistoryModel::HistoryModel(QObject *parent)
	: QAbstractListModel(parent)
{
	if (QSqlDatabase::connectionNames().isEmpty())
	{
		QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
		db.setDatabaseName("history.sqlite");

		if (!db.open())
		{
			throw std::runtime_error("Can't open database.");
		}
	}
}

void HistoryModel::addEntry(const QString& date, const QString& amount, const QString& description)
{
	beginInsertRows(QModelIndex(), entries.size(), entries.size());
	entries.append(new HistoryEntry(date, amount, description));
	endInsertRows();
}

int HistoryModel::rowCount(const QModelIndex& /*parent*/) const
{
	return entries.size();
}

QVariant HistoryModel::data(const QModelIndex& index, int role) const
{
	if (index.row() < 0 || index.row() >= entries.size())
		return QVariant();

	return role == Qt::DisplayRole
			? QVariant::fromValue(qobject_cast<QObject*>(entries[index.row()]))
			: QVariant();
}

void HistoryModel::replaceWith(const QStringList& data)
{
	if (data.size() % 3 != 0)
	{
		qWarning() << "Incorrect history data";
		return;
	}

	beginRemoveRows(QModelIndex(), 0, entries.size());
	qDeleteAll(entries);
	entries.clear();
	endRemoveRows();

	for (int i = 0; i < data.size(); i += 3)
	{
		addEntry(data[i], data[i + 2], data[i + 1]);
	}
}

QHash<int, QByteArray> HistoryModel::roleNames() const
{
	QHash<int, QByteArray> roles;
	roles[Qt::DisplayRole] = "entry";

	return roles;
}
