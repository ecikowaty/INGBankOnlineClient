#ifndef HISTORYMODEL_HPP
#define HISTORYMODEL_HPP

#include <QObject>
#include <QVector>
#include <QAbstractListModel>

class HistoryEntry;
class HistoryModel : public QAbstractListModel
{
	Q_OBJECT
public:
	explicit HistoryModel(QObject *parent = 0);

	void addEntry(const QString& date, const QString& amount, const QString& description);

	int rowCount(const QModelIndex& parent = QModelIndex()) const override;

	QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

public slots:
	void replaceWith(const QStringList& data);

protected:
	virtual QHash<int, QByteArray> roleNames() const override;

private:
	QVector<HistoryEntry*> entries;
};

#endif // HISTORYMODEL_HPP
