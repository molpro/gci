#ifndef GCI_GCIPERSISTENTOPERATOR_H
#define GCI_GCIPERSISTENTOPERATOR_H

#include <memory>
#include <Operator.h>
#include <hdf5.h>

namespace gci {

/*!
 * @brief stores SymmetryMatrix::Operator either in memory for small operators or on disk in an hdf5 file.
 */
class PersistentOperator {
protected:
    std::shared_ptr<SymmetryMatrix::Operator> m_op; //!< small operators are stored in memory
    hid_t m_file_id; //!< hdf5 file must already be open and remain open while access to operator is needed
    std::string m_description; //!< description of the operator, used to idenitfy it in hdf5 file
    bool m_on_disk; //!< whether the operator was saved to disk
public:
    //!< Takes ownership of the operator, writing it to hdf5 if it's large or keeping it in memory
    PersistentOperator(std::shared_ptr<SymmetryMatrix::Operator> &op, hid_t id);
    //!< operator is stored on file
    PersistentOperator(hid_t id, std::string _description);
    //! gets a copy of the stored operator
    std::shared_ptr<SymmetryMatrix::Operator> get();
    //! unique description of the operator
    std::string description();
protected:
    //! converts operator to bytestream and writes it to hdf5 file
    void store_bytestream(const SymmetryMatrix::Operator &op_);
};


} // namespace gci
#endif //GCI_GCIPERSISTENTOPERATOR_H