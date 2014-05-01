#ifndef GCIPRINTABLE_H
#define GCIPRINTABLE_H

#include <string>
#include <ostream>

namespace gci {
/**
 * @brief
 * Base class for printable representation of object
 *
 */

class Printable
{
public:
    Printable();
    /*!
     \brief
    printable form of the object.
     \return std::string
    */
   virtual std::string toString(int verbosity=0) const=0;
    /*!
     \brief
     Overloaded <<
    */
//    friend std::ostream& operator<<(std::ostream& os, Printable const& obj);

};
    std::ostream& operator<<(std::ostream& os, Printable const& obj);
}
using namespace gci;

#endif // GCIPRINTABLE_H
